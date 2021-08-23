.. _pcie_setup:

===============
PCIe Card Setup
===============

You will need one of the "Pgp4_10Gbps" PCIe hardware platforms that's released in this Github repo:

https://github.com/slaclab/pgp-pcie-apps/releases


You will need to use the "aes-stream-drivers/data_dev" DMA driver for this example.
Here's how to clone/build/load this driver:

.. code-block:: bash

   # Confirm that you have the board the computer with VID=1a4a ("SLAC") and PID=2030 ("AXI Stream DAQ")
   $ lspci -nn | grep SLAC
   04:00.0 Signal processing controller [1180]: SLAC National Accelerator Lab TID-AIR AXI Stream DAQ PCIe card [1a4a:2030]

   # Clone the driver github repo:
   $ git clone --recursive https://github.com/slaclab/aes-stream-drivers

   # Go to the driver directory
   $ cd aes-stream-drivers/data_dev/driver/

   # Build the driver
   $ make

   # Load the driver
   $ sudo /sbin/insmod ./datadev.ko cfgSize=0x50000 cfgRxCount=256 cfgTxCount=16

   # Give appropriate group/permissions
   $ sudo chmod 666 /dev/datadev*

   # Check for the loaded device
   $ cat /proc/datadev0
