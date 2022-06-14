-------------------------------------------------------------------------------
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: Simple PGPv4 Example
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

entity SimplePgp4Kcu105Example is
   generic (
      TPD_G        : time   := 1 ns;
      BUILD_INFO_G : BuildInfoType;
      SIMULATION_G : boolean := false;
      RATE_G       : string  := "10.3125Gbps");  -- or "6.25Gbps" or "3.125Gbps"
   port (
      -- I2C Ports
      sfpTxDisL  : out   sl;
      i2cRstL    : out   sl;
      i2cScl     : inout sl;
      i2cSda     : inout sl;
      -- XADC Ports
      vPIn       : in    sl;
      vNIn       : in    sl;
      -- System Ports
      emcClk     : in    sl;
      extRst     : in    sl;
      led        : out   slv(7 downto 0);
      -- Boot Memory Ports
      flashCsL   : out   sl;
      flashMosi  : out   sl;
      flashMiso  : in    sl;
      flashHoldL : out   sl;
      flashWp    : out   sl;
      -- PGP GT Pins
      pgpClkP    : in    sl;
      pgpClkN    : in    sl;
      pgpRxP     : in    sl;
      pgpRxN     : in    sl;
      pgpTxP     : out   sl;
      pgpTxN     : out   sl);
end SimplePgp4Kcu105Example;

architecture top_level of SimplePgp4Kcu105Example is

   signal heartbeat   : sl;
   signal rxlinkReady : sl;
   signal txlinkReady : sl;

   -- Clock and Reset
   signal axilClk : sl;
   signal axilRst : sl;

   -- AXI-Stream: Stream Interface
   signal ibPgpMaster : AxiStreamMasterType;
   signal ibPgpSlave  : AxiStreamSlaveType;
   signal obPgpMaster : AxiStreamMasterType;
   signal obPgpSlave  : AxiStreamSlaveType;

   -- AXI-Lite: Register Access
   signal axilReadMaster  : AxiLiteReadMasterType;
   signal axilReadSlave   : AxiLiteReadSlaveType;
   signal axilWriteMaster : AxiLiteWriteMasterType;
   signal axilWriteSlave  : AxiLiteWriteSlaveType;

begin

   led(7) <= '1';
   led(6) <= '0';
   led(5) <= heartbeat;
   led(4) <= axilRst;
   led(3) <= not(axilRst);
   led(2) <= rxlinkReady;
   led(1) <= txlinkReady;
   led(0) <= '0';

   -----------------------
   -- Core Firmware Module
   -----------------------
   U_Core : entity work.Core
      generic map (
         TPD_G        => TPD_G,
         BUILD_INFO_G => BUILD_INFO_G,
         SIMULATION_G => SIMULATION_G,
         RATE_G       => RATE_G)
      port map (
         -- Clock and Reset
         axilClk         => axilClk,
         axilRst         => axilRst,
         -- AXI-Stream Interface
         ibPgpMaster     => ibPgpMaster,
         ibPgpSlave      => ibPgpSlave,
         obPgpMaster     => obPgpMaster,
         obPgpSlave      => obPgpSlave,
         -- AXI-Lite Interface
         axilReadMaster  => axilReadMaster,
         axilReadSlave   => axilReadSlave,
         axilWriteMaster => axilWriteMaster,
         axilWriteSlave  => axilWriteSlave,
         -- I2C Ports
         sfpTxDisL       => sfpTxDisL,
         i2cRstL         => i2cRstL,
         i2cScl          => i2cScl,
         i2cSda          => i2cSda,
         -- SYSMON Ports
         vPIn            => vPIn,
         vNIn            => vNIn,
         -- System Ports
         extRst          => extRst,
         emcClk          => emcClk,
         heartbeat       => heartbeat,
         rxlinkReady     => rxlinkReady,
         txlinkReady     => txlinkReady,
         -- Boot Memory Ports
         flashCsL        => flashCsL,
         flashMosi       => flashMosi,
         flashMiso       => flashMiso,
         flashHoldL      => flashHoldL,
         flashWp         => flashWp,
         -- PGP GT Pins
         pgpClkP         => pgpClkP,
         pgpClkN         => pgpClkN,
         pgpRxP          => pgpRxP,
         pgpRxN          => pgpRxN,
         pgpTxP          => pgpTxP,
         pgpTxN          => pgpTxN);

   ------------------------------
   -- Application Firmware Module
   ------------------------------
   U_App : entity work.App
      generic map (
         TPD_G        => TPD_G,
         SIMULATION_G => SIMULATION_G)
      port map (
         -- Clock and Reset
         axilClk         => axilClk,
         axilRst         => axilRst,
         -- AXI-Stream Interface
         ibPgpMaster     => ibPgpMaster,
         ibPgpSlave      => ibPgpSlave,
         obPgpMaster     => obPgpMaster,
         obPgpSlave      => obPgpSlave,
         -- AXI-Lite Interface
         axilReadMaster  => axilReadMaster,
         axilReadSlave   => axilReadSlave,
         axilWriteMaster => axilWriteMaster,
         axilWriteSlave  => axilWriteSlave);

end top_level;
