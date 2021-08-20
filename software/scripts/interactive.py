#!/usr/bin/env python3
#-----------------------------------------------------------------------------
# This file is part of the 'Simple-PGPv4-KCU105-Example'. It is subject to
# the license terms in the LICENSE.txt file found in the top-level directory
# of this distribution and at:
#    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html.
# No part of the 'Simple-PGPv4-KCU105-Example', including this file, may be
# copied, modified, propagated, or distributed except according to the terms
# contained in the LICENSE.txt file.
#-----------------------------------------------------------------------------
import setupLibPaths

import sys
import time
import argparse

import pyrogue as pr
import pyrogue.pydm

import simple_pgp4_kcu105_example as devBoard

#################################################################

if __name__ == "__main__":

    # Convert str to bool
    argBool = lambda s: s.lower() in ['true', 't', 'yes', '1']

    # Set the argument parser
    parser = argparse.ArgumentParser()

    # Add arguments
    parser.add_argument(
        "--dev",
        type     = str,
        required = False,
        default  = '/dev/datadev_0',
        help     = "axi-pcie-core device",
    )

    parser.add_argument(
        "--lane",
        type     = int,
        required = False,
        default  = 0,
        help     = "DMA Lane Index",
    )

    # Get the arguments
    args = parser.parse_args()

    #################################################################

    # Set base
    root = devBoard.Root(dev = args.dev, lane = args.lane)

    # Start the system
    root.start()

    # Read all the variables
    root.ReadAll()

    # Create useful pointers
    AxiVersion = root.Core.AxiVersion

    print ( '###################################################')
    print ( '#             Firmware Version                    #')
    print ( '###################################################')
    AxiVersion.printStatus()
    print ( '###################################################')

    # Example of scripting get()/set()
    AxiVersion.ScratchPad.set(0xdeadbeef)
    print( f'AxiVersion.ScratchPad.get()     = {AxiVersion.ScratchPad.get()}' )
    print( f'AxiVersion.ScratchPad.getDisp() = {AxiVersion.ScratchPad.getDisp()}' )

    # If you are using python "-i" argument,
    # you can now doing interactive mode at this point

    #################################################################
