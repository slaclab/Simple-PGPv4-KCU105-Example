#-----------------------------------------------------------------------------
# This file is part of the 'Simple-PGPv4-KCU105-Example'. It is subject to
# the license terms in the LICENSE.txt file found in the top-level directory
# of this distribution and at:
#    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html.
# No part of the 'Simple-PGPv4-KCU105-Example', including this file, may be
# copied, modified, propagated, or distributed except according to the terms
# contained in the LICENSE.txt file.
#-----------------------------------------------------------------------------

import pyrogue as pr

import surf.axi                  as axi
import surf.devices.micron       as micron
import surf.devices.transceivers as xceiver
import surf.protocols.pgp        as pgp
import surf.xilinx               as xil

class Core(pr.Device):
    def __init__( self,
            sim      = False,
            promProg = False,
        **kwargs):
        super().__init__(**kwargs)

        self.add(axi.AxiVersion(
            offset = 0x0000_0000,
            expand = True,
        ))

        for i in range(2):
            self.add(micron.AxiMicronN25Q(
                name         = f'AxiMicronN25Q[{i}]',
                offset       = 0x0002_0000 + (i * 0x0001_0000),
                hidden       = True,
                enabled      = not sim,
            ))

        if not promProg:
            self.add(xil.AxiSysMonUltraScale(
                offset  = 0x0001_0000,
                enabled = not sim,
            ))

            self.add(pgp.Pgp4AxiL(
                offset  = 0x0010_0000,
                numVc   = 4,
                writeEn = False,
                enabled = not sim,
            ))

            self.add(axi.AxiStreamMonAxiL(
                name        = 'AxisMon',
                offset      = 0x0011_0000,
                numberLanes = 8,
                expand      = True,
                enabled     = not sim,
            ))

            # Close the streams that you don't want to monitor
            for i in range(8):
                if (i == 1):
                    self.AxisMon.Ch[i]._expand = True
                else:
                    self.AxisMon.Ch[i]._expand = False

            self.add(xceiver.Sfp(
                offset      = 0x0020_2000,
                enabled     = not sim,
            ))
