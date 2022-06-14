.. _how_to_build_firmware:

=========================
How to build the firmware
=========================

#. Setup Xilinx licensing (refer to :ref:`setup_vivado_setup`)


#. Go to the target directory and build the firmware via `make`:

   .. code-block:: bash

      $ cd Simple-PGPv4-KCU105-Example/firmware/targets/SimplePgp4Kcu105Example
      $ make


#. Optional: Review the results in GUI mode

   .. code-block:: bash

      $ make gui

   .. image:: ../../images/VivadoGui.png
     :width: 800
     :alt: Alternative text
