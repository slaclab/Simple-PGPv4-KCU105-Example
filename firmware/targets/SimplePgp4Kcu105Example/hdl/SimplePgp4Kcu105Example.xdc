##############################################################################
## This file is part of 'Simple-PGPv4-KCU105-Example'.
## It is subject to the license terms in the LICENSE.txt file found in the
## top-level directory of this distribution and at:
##    https://confluence.slac.stanford.edu/display/ppareg/LICENSE.html.
## No part of 'Simple-PGPv4-KCU105-Example', including this file,
## may be copied, modified, propagated, or distributed except according to
## the terms contained in the LICENSE.txt file.
##############################################################################

##############################################################################
# I/O Constraints
##############################################################################

set_property PACKAGE_PIN U4 [get_ports pgpTxP]
set_property PACKAGE_PIN U3 [get_ports pgpTxN]
set_property PACKAGE_PIN T2 [get_ports pgpRxP]
set_property PACKAGE_PIN T1 [get_ports pgpRxN]

set_property PACKAGE_PIN P6 [get_ports pgpClkP]
set_property PACKAGE_PIN P5 [get_ports pgpClkN]

set_property -dict { PACKAGE_PIN V12 IOSTANDARD ANALOG } [get_ports { vPIn }]
set_property -dict { PACKAGE_PIN W11 IOSTANDARD ANALOG } [get_ports { vNIn }]

set_property -dict { PACKAGE_PIN AN8 IOSTANDARD LVCMOS18 } [get_ports { extRst }]

set_property -dict { PACKAGE_PIN AL8  IOSTANDARD LVCMOS18 } [get_ports { sfpTxDisL }]
set_property -dict { PACKAGE_PIN AP10 IOSTANDARD LVCMOS18 } [get_ports { i2cRstL }]
set_property -dict { PACKAGE_PIN J24  IOSTANDARD LVCMOS18 } [get_ports { i2cScl }]
set_property -dict { PACKAGE_PIN J25  IOSTANDARD LVCMOS18 } [get_ports { i2cSda }]

set_property -dict { PACKAGE_PIN AP8 IOSTANDARD LVCMOS18 } [get_ports { led[0] }]
set_property -dict { PACKAGE_PIN H23 IOSTANDARD LVCMOS18 } [get_ports { led[1] }]
set_property -dict { PACKAGE_PIN P20 IOSTANDARD LVCMOS18 } [get_ports { led[2] }]
set_property -dict { PACKAGE_PIN P21 IOSTANDARD LVCMOS18 } [get_ports { led[3] }]
set_property -dict { PACKAGE_PIN N22 IOSTANDARD LVCMOS18 } [get_ports { led[4] }]
set_property -dict { PACKAGE_PIN M22 IOSTANDARD LVCMOS18 } [get_ports { led[5] }]
set_property -dict { PACKAGE_PIN R23 IOSTANDARD LVCMOS18 } [get_ports { led[6] }]
set_property -dict { PACKAGE_PIN P23 IOSTANDARD LVCMOS18 } [get_ports { led[7] }]

set_property -dict { PACKAGE_PIN G26 IOSTANDARD LVCMOS18 } [get_ports { flashCsL }]  ; # QSPI1_CS_B
set_property -dict { PACKAGE_PIN M20 IOSTANDARD LVCMOS18 } [get_ports { flashMosi }] ; # QSPI1_IO[0]
set_property -dict { PACKAGE_PIN L20 IOSTANDARD LVCMOS18 } [get_ports { flashMiso }] ; # QSPI1_IO[1]
set_property -dict { PACKAGE_PIN R21 IOSTANDARD LVCMOS18 } [get_ports { flashWp }]   ; # QSPI1_IO[2]
set_property -dict { PACKAGE_PIN R22 IOSTANDARD LVCMOS18 } [get_ports { flashHoldL }]; # QSPI1_IO[3]

set_property -dict { PACKAGE_PIN K20 IOSTANDARD LVCMOS18 } [get_ports { emcClk }]

##############################################################################
# Timing Constraints
##############################################################################

create_clock -name pgpClkP -period  6.400 [get_ports {pgpClkP}]

set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins U_Core/U_Pgp/U_axilClk/PllGen.U_Pll/CLKOUT0]] -group [get_clocks -of_objects [get_pins {U_Core/U_Pgp/U_Pgp/REAL_PGP.GEN_LANE[0].U_Pgp/U_Pgp3GthUsIpWrapper_1/GEN_10G.U_Pgp3GthUsIp/inst/gen_gtwizard_gthe3_top.Pgp3GthUsIp10G_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_tx_user_clocking_internal.gen_single_instance.gtwiz_userclk_tx_inst/gen_gtwiz_userclk_tx_main.bufg_gt_usrclk2_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins U_Core/U_Pgp/U_axilClk/PllGen.U_Pll/CLKOUT0]] -group [get_clocks -of_objects [get_pins {U_Core/U_Pgp/U_Pgp/REAL_PGP.GEN_LANE[0].U_Pgp/U_Pgp3GthUsIpWrapper_1/GEN_10G.U_Pgp3GthUsIp/inst/gen_gtwizard_gthe3_top.Pgp3GthUsIp10G_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_rx_user_clocking_internal.gen_single_instance.gtwiz_userclk_rx_inst/gen_gtwiz_userclk_rx_main.bufg_gt_usrclk2_inst/O}]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins {U_Core/U_Pgp/U_Pgp/REAL_PGP.GEN_LANE[0].U_Pgp/U_Pgp3GthUsIpWrapper_1/GEN_10G.U_Pgp3GthUsIp/inst/gen_gtwizard_gthe3_top.Pgp3GthUsIp10G_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_tx_user_clocking_internal.gen_single_instance.gtwiz_userclk_tx_inst/gen_gtwiz_userclk_tx_main.bufg_gt_usrclk2_inst/O}]] -group [get_clocks -of_objects [get_pins {U_Core/U_Pgp/U_Pgp/REAL_PGP.GEN_LANE[0].U_Pgp/U_Pgp3GthUsIpWrapper_1/GEN_10G.U_Pgp3GthUsIp/inst/gen_gtwizard_gthe3_top.Pgp3GthUsIp10G_gtwizard_gthe3_inst/gen_gtwizard_gthe3.gen_rx_user_clocking_internal.gen_single_instance.gtwiz_userclk_rx_inst/gen_gtwiz_userclk_rx_main.bufg_gt_usrclk2_inst/O}]]

##############################################################################
# BITSTREAM: .bit file Configuration
##############################################################################

set_property CONFIG_VOLTAGE 1.8              [current_design]
set_property CFGBVS GND                      [current_design]
set_property CONFIG_MODE SPIx8               [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 12  [current_design]
#set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN div-1 [current_design]
#set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR Yes [current_design]
set_property BITSTREAM.STARTUP.LCK_CYCLE NoWait [current_design]
set_property BITSTREAM.STARTUP.MATCH_CYCLE NoWait [current_design]
