-------------------------------------------------------------------------------
-- Company    : SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------
-- Description: Simulation test bed for FPGA FW/SW co-simulation
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library surf;
use surf.StdRtlPkg.all;
use surf.AxiStreamPkg.all;
use surf.SsiPkg.all;

library ruckus;
use ruckus.BuildInfoPkg.all;

entity SimplePgp4Kcu105ExampleTb is end SimplePgp4Kcu105ExampleTb;

architecture testbed of SimplePgp4Kcu105ExampleTb is

   constant GET_BUILD_INFO_C : BuildInfoRetType := toBuildInfo(BUILD_INFO_C);
   constant MOD_BUILD_INFO_C : BuildInfoRetType := (
      buildString => GET_BUILD_INFO_C.buildString,
      fwVersion   => GET_BUILD_INFO_C.fwVersion,
      gitHash     => x"1111_2222_3333_4444_5555_6666_7777_8888_9999_AAAA");  -- Force githash for simulation testing
   constant SIM_BUILD_INFO_C : slv(2239 downto 0) := toSlv(MOD_BUILD_INFO_C);

   signal pgpClkP : sl;
   signal pgpClkN : sl;

begin

   U_Fpga : entity work.SimplePgp4Kcu105Example
      generic map (
         SIMULATION_G => true,
         BUILD_INFO_G => SIM_BUILD_INFO_C)
      port map (
         -- I2C Ports
         sfpTxDisL  => open,
         i2cRstL    => open,
         i2cScl     => open,
         i2cSda     => open,
         -- XADC Ports
         vPIn       => '0',
         vNIn       => '1',
         -- System Ports
         emcClk     => '0',
         extRst     => '0',
         led        => open,
         -- Boot Memory Ports
         flashCsL   => open,
         flashMosi  => open,
         flashMiso  => '1',
         flashHoldL => open,
         flashWp    => open,
         -- ETH GT Pins
         pgpClkP    => pgpClkP,
         pgpClkN    => pgpClkN,
         pgpRxP     => '0',
         pgpRxN     => '1',
         pgpTxP     => open,
         pgpTxN     => open);

   U_ClkPgp : entity surf.ClkRst
      generic map (
         CLK_PERIOD_G      => 6.4 ns,   -- 156.25 MHz
         RST_START_DELAY_G => 0 ns,
         RST_HOLD_TIME_G   => 1000 ns)
      port map (
         clkP => pgpClkP,
         clkN => pgpClkN);

end testbed;
