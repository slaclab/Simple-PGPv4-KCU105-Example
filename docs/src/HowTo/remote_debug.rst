.. _how_to_remote_debug:

==============================================
How to use Xilinx Virtual Cable (XVC) with ILA
==============================================

The Xilinx Virtual Cable (XVC) lets you remotely access the ILA
(A.K.A. ``Chipscope``) via the KCU105 PGP (instead of using JTAG).
The XVC will let you view and interact with ILA remotely via
the same PGP link that you use for register access
and data streaming.

However, XVC does **NOT** support non-ILA debugging operations:

* JTAG programming
* IBERT debugging
* MIG calibration results

For more information about XVC, refer to the Xilinx XVC homepage:

   https://www.xilinx.com/products/intellectual-property/xvc.html

Note: To setup the XVC in ruckus, you will need to define
and set ``USE_XVC_DEBUG = 1`` in your target's makefile:

   .. code-block:: bash

      # Using XVC Debug bridge
      export USE_XVC_DEBUG = 1

In this firmware example, the ``surf.UdpDebugBridgeWrapper`` is mapped to Virtual Channel (VC) 2:

   .. code-block:: vhdl

      U_XVC : entity surf.UdpDebugBridgeWrapper
         generic map (
            TPD_G => TPD_G)
         port map (
            -- Clock and Reset
            clk            => axilClock,
            rst            => axilReset,
            -- UDP XVC Interface
            obServerMaster => ibXvcMaster,
            obServerSlave  => ibXvcSlave,
            ibServerMaster => obXvcMaster,
            ibServerSlave  => obXvcSlave);

In python rogue, VC[2] is mapped to UDP server:

   .. code-block:: python

      # Create (Xilinx Virtual Cable) XVC UDP server on localhost
      self.xvc  = rogue.protocols.udp.Server(2542,False) # Server(port,jumbo)

      # Connect dmaStream[VC=2] to XVC UDP server
      self.dmaStream[2] == self.xvc

Next you will start up the rogue software, which will setup the UDP bridge to XVC.

   .. code-block:: bash

      $ cd Simple-PGPv4-KCU105-Example/software
      $ python scripts/devGui.py

Next you will build the XVC source:

   .. code-block:: bash

      $ cd Simple-PGPv4-KCU105-Example/software/xvcSrv/src
      $ make

Next you will connect execute the ``./xvcSrv -t <fw_ip_address>:<udp_server_port>`` command:

   .. code-block:: bash

      $ ./xvcSrv -t localhost:2542

The XVC server is now running and ready to accept a XVC client connection.
Next you will open ``Vivado Hardware Manager`` and ``open new target``:

   .. image:: ../../images/xcv_0.png
     :width: 400
     :alt: Alternative text

Select that you are connecting to a remote server and enter the ``host`` name.
If locally ran, then use ``localhost``.
If running remotely for different computer, you can use IP address or PC's hostname on your network.

   .. image:: ../../images/xcv_1.png
     :width: 400
     :alt: Alternative text

Click on ``Add Xilinx Virtual Cable (XVC)``:

   .. image:: ../../images/xcv_2.png
     :width: 400
     :alt: Alternative text

If locally ran, then use ``localhost`` for "Host Name".
If running remotely for different computer, you can use IP address or PC's hostname on your network.

   .. image:: ../../images/xcv_3.png
     :width: 400
     :alt: Alternative text

Next you will click on ``NEXT`` then click on ``Finished`` on the window after that

   .. image:: ../../images/xcv_4.png
     :width: 400
     :alt: Alternative text

Click on "debug_bridge_0", go to the "General Tab" and click on the ``...`` next to "Probes File":

   .. image:: ../../images/xcv_5.png
     :width: 400
     :alt: Alternative text

Navigate to the ``.ltx`` file that generated from your ``post_synthesis.tcl`` TCL script (refer to :ref:`how_to_hardware_debug`).
Once the .ltx file is loaded, the ILA can now be access remotely via the Ethernet link.

   .. image:: ../../images/xcv_6.png
     :width: 400
     :alt: Alternative text
