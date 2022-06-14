#-----------------------------------------------------------------------------
# This file is part of the 'Development Board Examples'. It is subject to
# the license terms in the LICENSE.txt file found in the top-level directory
# of this distribution and at:
#    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html.
# No part of the 'Development Board Examples', including this file, may be
# copied, modified, propagated, or distributed except according to the terms
# contained in the LICENSE.txt file.
#-----------------------------------------------------------------------------

import pyrogue  as pr
import pyrogue.protocols
import pyrogue.utilities.fileio

import rogue
import rogue.hardware.axi
import rogue.interfaces.stream
import rogue.utilities.fileio

import simple_pgp4_kcu105_example as devBoard

rogue.Version.minVersion('5.14.0')

class Root(pr.Root):
    def __init__(   self,
            dev      = '/dev/datadev_0',
            lane     = 0,
            pollEn   = True,  # Enable automatic polling registers
            initRead = True,  # Read all registers at start of the system
            promProg = False, # Flag to disable all devices not related to PROM programming
            enSwRx   = True, # Flag to enable the software stream receiver
            **kwargs):

        #################################################################

        self.enSwRx = not promProg and enSwRx
        self.sim    = (dev == 'sim')

        if (self.sim):
            # Set the timeout
            kwargs['timeout'] = 100000000 # firmware simulation slow and timeout base on real time (not simulation time)

        else:
            # Set the timeout
            kwargs['timeout'] = 5000000 # 5.0 seconds default

        super().__init__(**kwargs)

        #################################################################

        # Create an empty list to be filled
        self.dmaStream = [None for i in range(4)]

        # Check if not VCS simulation
        if (not self.sim):

            # Start up flags
            self._pollEn   = pollEn
            self._initRead = initRead

            # Map the DMA streams
            for vc in range(4):
                self.dmaStream[vc] = rogue.hardware.axi.AxiStreamDma(dev,(0x100*lane)+vc,1)

            # Create (Xilinx Virtual Cable) XVC on localhost
            self.xvc = rogue.protocols.xilinx.Xvc( 2542 )
            self.addProtocol( self.xvc )

            # Connect dmaStream[VC = 2] to XVC
            self.dmaStream[2] == self.xvc

        else:

            # Start up flags are FALSE for simulation mode
            self._pollEn   = False
            self._initRead = False

            # Map the simulation DMA streams
            for vc in range(4):
                self.dmaStream[vc] = rogue.interfaces.stream.TcpClient('localhost',10000+2*vc) # 2 TCP ports per stream

        #################################################################

        # Create SRPv3
        self.srp = rogue.protocols.srp.SrpV3()

        # Connect SRPv3 to dmaStream[VC=0]
        self.srp == self.dmaStream[0]

        #################################################################

        # Check for streaming enabled
        if self.enSwRx:

            # File writer
            self.dataWriter = pr.utilities.fileio.StreamWriter()
            self.add(self.dataWriter)

            # Create application stream receiver
            self.swRx = devBoard.SwRx(expand=True)
            self.add(self.swRx)

            # Connect dmaStream[VC=1] to swRx
            self.dmaStream[1] >> self.swRx

            # Also connect dmaStream[VC=1] to data writer
            self.dmaStream[1] >> self.dataWriter.getChannel(0)

        #################################################################

        # Add Devices
        self.add(devBoard.Core(
            offset   = 0x0000_0000,
            memBase  = self.srp,
            sim      = self.sim,
            promProg = promProg,
            expand   = True,
        ))

        if not promProg:
            self.add(devBoard.App(
                offset   = 0x8000_0000,
                memBase  = self.srp,
                sim      = self.sim,
                expand   = True,
            ))

        #################################################################

    def start(self, **kwargs):
        super().start(**kwargs)
        # Check if not simulation
        if not self.sim:
            appTx = self.find(typ=devBoard.AppTx)
            # Turn off the Continuous Mode
            for devPtr in appTx:
                devPtr.ContinuousMode.set(False)
            self.CountReset()
