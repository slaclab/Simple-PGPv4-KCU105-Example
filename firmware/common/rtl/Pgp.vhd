-------------------------------------------------------------------------------
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: PGP Firmware Module
-------------------------------------------------------------------------------
-- This file is part of 'Simple-PGPv4-KCU105-Example'.
-- It is subject to the license terms in the LICENSE.txt file found in the
-- top-level directory of this distribution and at:
--    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html.
-- No part of 'Simple-PGPv4-KCU105-Example', including this file,
-- may be copied, modified, propagated, or distributed except according to
-- the terms contained in the LICENSE.txt file.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library surf;
use surf.StdRtlPkg.all;
use surf.AxiStreamPkg.all;
use surf.AxiLitePkg.all;
use surf.EthMacPkg.all;
use surf.Pgp4Pkg.all;

library unisim;
use unisim.vcomponents.all;

entity Pgp is
   generic (
      TPD_G            : time    := 1 ns;
      SIMULATION_G     : boolean := false;
      RATE_G           : string  := "10.3125Gbps";  -- or "6.25Gbps" or "3.125Gbps"
      AXIL_BASE_ADDR_G : slv(31 downto 0));
   port (
      -- System Ports
      extRst           : in  sl;
      -- PGP Link Status
      rxlinkReady      : out sl;
      txlinkReady      : out sl;
      -- Clock and Reset
      axilClk          : out sl;
      axilRst          : out sl;
      -- AXI-Stream Interface
      ibPgpMaster      : in  AxiStreamMasterType;
      ibPgpSlave       : out AxiStreamSlaveType;
      obPgpMaster      : out AxiStreamMasterType;
      obPgpSlave       : in  AxiStreamSlaveType;
      -- Master AXI-Lite Interface
      mAxilReadMaster  : out AxiLiteReadMasterType;
      mAxilReadSlave   : in  AxiLiteReadSlaveType;
      mAxilWriteMaster : out AxiLiteWriteMasterType;
      mAxilWriteSlave  : in  AxiLiteWriteSlaveType;
      -- Slave AXI-Lite Interfaces
      sAxilReadMaster  : in  AxiLiteReadMasterType;
      sAxilReadSlave   : out AxiLiteReadSlaveType;
      sAxilWriteMaster : in  AxiLiteWriteMasterType;
      sAxilWriteSlave  : out AxiLiteWriteSlaveType;
      -- PGP GT Pins
      pgpClkP          : in  sl;
      pgpClkN          : in  sl;
      pgpRxP           : in  sl;
      pgpRxN           : in  sl;
      pgpTxP           : out sl;
      pgpTxN           : out sl);
end Pgp;

architecture mapping of Pgp is

   constant PHY_INDEX_C      : natural := 0;
   constant AXIS_MON_INDEX_C : natural := 1;

   constant NUM_AXIL_MASTERS_C : positive := 2;

   constant XBAR_CONFIG_C : AxiLiteCrossbarMasterConfigArray(NUM_AXIL_MASTERS_C-1 downto 0) := genAxiLiteConfig(NUM_AXIL_MASTERS_C, AXIL_BASE_ADDR_G, 20, 16);

   signal axilWriteMasters : AxiLiteWriteMasterArray(NUM_AXIL_MASTERS_C-1 downto 0);
   signal axilWriteSlaves  : AxiLiteWriteSlaveArray(NUM_AXIL_MASTERS_C-1 downto 0) := (others => AXI_LITE_WRITE_SLAVE_EMPTY_SLVERR_C);
   signal axilReadMasters  : AxiLiteReadMasterArray(NUM_AXIL_MASTERS_C-1 downto 0);
   signal axilReadSlaves   : AxiLiteReadSlaveArray(NUM_AXIL_MASTERS_C-1 downto 0)  := (others => AXI_LITE_READ_SLAVE_EMPTY_SLVERR_C);

   signal ibXvcMaster : AxiStreamMasterType := AXI_STREAM_MASTER_INIT_C;
   signal ibXvcSlave  : AxiStreamSlaveType  := AXI_STREAM_SLAVE_FORCE_C;
   signal obXvcMaster : AxiStreamMasterType := AXI_STREAM_MASTER_INIT_C;
   signal obXvcSlave  : AxiStreamSlaveType  := AXI_STREAM_SLAVE_FORCE_C;

   signal pgpTxIn      : Pgp4TxInType                     := PGP4_TX_IN_INIT_C;
   signal pgpTxOut     : Pgp4TxOutType;
   signal pgpTxMasters : AxiStreamMasterArray(3 downto 0) := (others => AXI_STREAM_MASTER_INIT_C);
   signal pgpTxSlaves  : AxiStreamSlaveArray(3 downto 0)  := (others => AXI_STREAM_SLAVE_FORCE_C);

   signal pgpRxIn      : Pgp4RxInType                     := PGP4_RX_IN_INIT_C;
   signal pgpRxOut     : Pgp4RxOutType;
   signal pgpRxMasters : AxiStreamMasterArray(3 downto 0) := (others => AXI_STREAM_MASTER_INIT_C);
   signal pgpRxCtrl    : AxiStreamCtrlArray(3 downto 0)   := (others => AXI_STREAM_CTRL_UNUSED_C);
   signal pgpRxSlaves  : AxiStreamSlaveArray(3 downto 0)  := (others => AXI_STREAM_SLAVE_FORCE_C);

   signal pgpClk : sl;
   signal pgpRst : sl;

   signal pgpClkBufg : sl;
   signal axilClock  : sl;
   signal axilReset  : sl;

begin

   axilClk <= axilClock;
   axilRst <= axilReset;

   rxlinkReady <= pgpRxOut.linkReady;
   txlinkReady <= pgpTxOut.linkReady;

   U_XBAR : entity surf.AxiLiteCrossbar
      generic map (
         TPD_G              => TPD_G,
         NUM_SLAVE_SLOTS_G  => 1,
         NUM_MASTER_SLOTS_G => NUM_AXIL_MASTERS_C,
         MASTERS_CONFIG_G   => XBAR_CONFIG_C)
      port map (
         axiClk              => axilClock,
         axiClkRst           => axilReset,
         sAxiWriteMasters(0) => sAxilWriteMaster,
         sAxiWriteSlaves(0)  => sAxilWriteSlave,
         sAxiReadMasters(0)  => sAxilReadMaster,
         sAxiReadSlaves(0)   => sAxilReadSlave,
         mAxiWriteMasters    => axilWriteMasters,
         mAxiWriteSlaves     => axilWriteSlaves,
         mAxiReadMasters     => axilReadMasters,
         mAxiReadSlaves      => axilReadSlaves);

   U_axilClk : entity surf.ClockManagerUltraScale
      generic map(
         TPD_G             => TPD_G,
         SIMULATION_G      => SIMULATION_G,
         TYPE_G            => "PLL",
         INPUT_BUFG_G      => false,
         FB_BUFG_G         => true,
         RST_IN_POLARITY_G => '1',
         NUM_CLOCKS_G      => 1,
         -- MMCM attributes
         BANDWIDTH_G       => "OPTIMIZED",
         CLKIN_PERIOD_G    => 6.4,      -- 156.25 MHz
         CLKFBOUT_MULT_G   => 8,        -- 1.25GHz = 8 x 156.25 MHz
         CLKOUT0_DIVIDE_G  => 8)        -- 156.25MHz = 1.25GHz/8
      port map(
         -- Clock Input
         clkIn     => pgpClkBufg,
         rstIn     => extRst,
         -- Clock Outputs
         clkOut(0) => axilClock,
         -- Reset Outputs
         rstOut(0) => axilReset);

   U_Pgp : entity surf.Pgp4GthUsWrapper
      generic map (
         TPD_G                => TPD_G,
         ROGUE_SIM_EN_G       => SIMULATION_G,
         ROGUE_SIM_SIDEBAND_G => true,
         ROGUE_SIM_PORT_NUM_G => 10000,
         RATE_G               => RATE_G,
         EN_PGP_MON_G         => true,
         WRITE_EN_G           => false,
         NUM_LANES_G          => 1,
         NUM_VC_G             => 4,
         AXIL_CLK_FREQ_G      => 156.25E+6,
         AXIL_BASE_ADDR_G     => XBAR_CONFIG_C(PHY_INDEX_C).baseAddr)
      port map (
         -- Stable Clock and Reset
         stableClk         => axilClock,
         stableRst         => axilReset,
         -- Gt Serial IO
         pgpGtTxP(0)       => pgpTxP,
         pgpGtTxN(0)       => pgpTxN,
         pgpGtRxP(0)       => pgpRxP,
         pgpGtRxN(0)       => pgpRxN,
         -- GT Clocking
         pgpRefClkP        => pgpClkP,
         pgpRefClkN        => pgpClkN,
         pgpRefClkDiv2Bufg => pgpClkBufg,
         -- Clocking
         pgpClk(0)         => pgpClk,
         pgpClkRst(0)      => pgpRst,
         -- Non VC Rx Signals
         pgpRxIn(0)        => pgpRxIn,
         pgpRxOut(0)       => pgpRxOut,
         -- Non VC Tx Signals
         pgpTxIn(0)        => pgpTxIn,
         pgpTxOut(0)       => pgpTxOut,
         -- Frame Transmit Interface
         pgpTxMasters      => pgpTxMasters,
         pgpTxSlaves       => pgpTxSlaves,
         -- Frame Receive Interface
         pgpRxMasters      => pgpRxMasters,
         pgpRxCtrl         => pgpRxCtrl,
         pgpRxSlaves       => pgpRxSlaves,
         -- AXI-Lite Register Interface (axilClk domain)
         axilClk           => axilClock,
         axilRst           => axilReset,
         axilReadMaster    => axilReadMasters(PHY_INDEX_C),
         axilReadSlave     => axilReadSlaves(PHY_INDEX_C),
         axilWriteMaster   => axilWriteMasters(PHY_INDEX_C),
         axilWriteSlave    => axilWriteSlaves(PHY_INDEX_C));

   U_VC0 : entity surf.SrpV3AxiLite
      generic map (
         TPD_G               => TPD_G,
         SLAVE_READY_EN_G    => SIMULATION_G,
         GEN_SYNC_FIFO_G     => false,
         AXI_STREAM_CONFIG_G => PGP4_AXIS_CONFIG_C)
      port map (
         -- Streaming Slave (Rx) Interface (sAxisClk domain)
         sAxisClk         => pgpClk,
         sAxisRst         => pgpRst,
         sAxisMaster      => pgpRxMasters(0),
         sAxisCtrl        => pgpRxCtrl(0),    -- Valid if SIMULATION_G=false
         sAxisSlave       => pgpRxSlaves(0),  -- Valid if SIMULATION_G=true
         -- Streaming Master (Tx) Data Interface (mAxisClk domain)
         mAxisClk         => pgpClk,
         mAxisRst         => pgpRst,
         mAxisMaster      => pgpTxMasters(0),
         mAxisSlave       => pgpTxSlaves(0),
         -- Master AXI-Lite Interface (axilClk domain)
         axilClk          => axilClock,
         axilRst          => axilReset,
         mAxilReadMaster  => mAxilReadMaster,
         mAxilReadSlave   => mAxilReadSlave,
         mAxilWriteMaster => mAxilWriteMaster,
         mAxilWriteSlave  => mAxilWriteSlave);

   U_VC1_RX : entity surf.PgpRxVcFifo
      generic map (
         TPD_G            => TPD_G,
         ROGUE_SIM_EN_G   => SIMULATION_G,
         PHY_AXI_CONFIG_G => PGP4_AXIS_CONFIG_C,
         APP_AXI_CONFIG_G => PGP4_AXIS_CONFIG_C)
      port map (
         -- PGP Interface (pgpClk domain)
         pgpClk      => pgpClk,
         pgpRst      => pgpRst,
         rxlinkReady => pgpRxOut.linkReady,
         pgpRxMaster => pgpRxMasters(1),
         pgpRxCtrl   => pgpRxCtrl(1),
         pgpRxSlave  => pgpRxSlaves(1),
         -- AXIS Interface (axisClk domain)
         axisClk     => axilClock,
         axisRst     => axilReset,
         axisMaster  => obPgpMaster,
         axisSlave   => obPgpSlave);

   U_VC1_TX : entity surf.PgpTxVcFifo
      generic map (
         TPD_G            => TPD_G,
         APP_AXI_CONFIG_G => PGP4_AXIS_CONFIG_C,
         PHY_AXI_CONFIG_G => PGP4_AXIS_CONFIG_C)
      port map (
         -- AXIS Interface (axisClk domain)
         axisClk     => axilClock,
         axisRst     => axilReset,
         axisMaster  => ibPgpMaster,
         axisSlave   => ibPgpSlave,
         -- PGP Interface (pgpClk domain)
         pgpClk      => pgpClk,
         pgpRst      => pgpRst,
         rxlinkReady => pgpRxOut.linkReady,
         txlinkReady => pgpTxOut.linkReady,
         pgpTxMaster => pgpTxMasters(1),
         pgpTxSlave  => pgpTxSlaves(1));

   U_VC2_XVC : entity surf.PgpXvcWrapper
      generic map (
         TPD_G            => TPD_G,
         SIMULATION_G     => SIMULATION_G,
         AXIS_CLK_FREQ_G  => 156.25E+6,
         PHY_AXI_CONFIG_G => PGP4_AXIS_CONFIG_C)
      port map (
         -- Clock and Reset (xvcClk domain)
         xvcClk      => axilClock,
         xvcRst      => axilReset,
         -- Clock and Reset (pgpClk domain)
         pgpClk      => pgpClk,
         pgpRst      => pgpRst,
         -- PGP Interface (pgpClk domain)
         rxlinkReady => pgpRxOut.linkReady,
         txlinkReady => pgpTxOut.linkReady,
         -- TX FIFO  (pgpClk domain)
         pgpTxMaster => pgpTxMasters(2),
         pgpTxSlave  => pgpTxSlaves(2),
         -- RX FIFO  (pgpClk domain)
         pgpRxMaster => pgpRxMasters(2),
         pgpRxCtrl   => pgpRxCtrl(2));

   ------------------------
   -- AXI Stream Monitoring
   ------------------------
   U_AXIS_MON : entity surf.AxiStreamMonAxiL
      generic map(
         TPD_G            => TPD_G,
         COMMON_CLK_G     => false,
         AXIS_CLK_FREQ_G  => 156.25E+6,
         AXIS_NUM_SLOTS_G => 8,
         AXIS_CONFIG_G    => PGP4_AXIS_CONFIG_C)
      port map(
         -- AXIS Stream Interface
         axisClk                 => pgpClk,
         axisRst                 => pgpRst,
         axisMasters(3 downto 0) => pgpTxMasters,
         axisMasters(7 downto 4) => pgpRxMasters,
         axisSlaves(3 downto 0)  => pgpTxSlaves,
         axisSlaves(7 downto 4)  => pgpRxSlaves,
         -- AXI lite slave port for register access
         axilClk                 => axilClock,
         axilRst                 => axilReset,
         sAxilWriteMaster        => axilWriteMasters(AXIS_MON_INDEX_C),
         sAxilWriteSlave         => axilWriteSlaves(AXIS_MON_INDEX_C),
         sAxilReadMaster         => axilReadMasters(AXIS_MON_INDEX_C),
         sAxilReadSlave          => axilReadSlaves(AXIS_MON_INDEX_C));

end mapping;
