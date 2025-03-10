.. _setup_rogue_setup:

====================
Rogue Software Setup
====================

If you are on the SLAC AFS network
==================================

After you have cloned the repository :ref:`how_to_git_clone`

Here's how to setup the SLAC AFS conda build of rogue:

.. code-block:: bash

   $ cd Simple-PGPv4-KCU105-Example/software
   $ source setup_env_slac.sh

If you are NOT on the SLAC AFS network
======================================

Here is "How to install the Rogue With Anaconda":

   https://slaclab.github.io/rogue/installing/anaconda.html

After doing the local anaconda install, you will need to setup the conda enviroment

.. code-block:: bash

   # Setup conda environment
   $ source /path/to/my/anaconda3/etc/profile.d/conda.sh

   # Activate Rogue conda Environment
   $ conda activate rogue_v6.4.4
