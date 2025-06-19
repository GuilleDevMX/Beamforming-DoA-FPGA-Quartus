-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 23.1std (Release Build #993)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2024 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from cordic_cos_CORDIC_0
-- VHDL created on Sun May  4 22:01:51 2025


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity cordic_cos_CORDIC_0 is
    port (
        a : in std_logic_vector(18 downto 0);  -- sfix19_en16
        c : out std_logic_vector(17 downto 0);  -- sfix18_en16
        s : out std_logic_vector(17 downto 0);  -- sfix18_en16
        clk : in std_logic;
        areset : in std_logic
    );
end cordic_cos_CORDIC_0;

architecture normal of cordic_cos_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal signA_uid7_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignA_uid8_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal absAE_uid9_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal absAE_uid9_sincosTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal absAE_uid9_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal absAR_uid10_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal absAR_uid10_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal cstPiO2_uid11_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal padACst_uid12_sincosTest_q : STD_LOGIC_VECTOR (6 downto 0);
    signal aPostPad_uid13_sincosTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal argMPiO2_uid14_sincosTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal argMPiO2_uid14_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal argMPiO2_uid14_sincosTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal argMPiO2_uid14_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal firstQuadrant_uid15_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal absARE_mergedSignalTM_uid18_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal argMPiO2_uid20_sincosTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal argMPiO2_uid20_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal absA_uid21_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absA_uid21_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal cstOneOverK_uid22_sincosTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal cstArcTan2Mi_0_uid26_sincosTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1E_1_uid32_sincosTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1E_1CostZeroPaddingA_uid33_sincosTest_q : STD_LOGIC_VECTOR (35 downto 0);
    signal yip1E_1NA_uid34_sincosTest_q : STD_LOGIC_VECTOR (36 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_a : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_o : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_q : STD_LOGIC_VECTOR (37 downto 0);
    signal invSignOfSelectionSignal_uid36_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1CostZeroPaddingA_uid37_sincosTest_q : STD_LOGIC_VECTOR (3 downto 0);
    signal aip1E_1NA_uid38_sincosTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal xip1_1_mergedSignalTM_uid42_sincosTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal xMSB_uid44_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_1_mergedSignalTM_uid48_sincosTest_q : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid50_sincosTest_in : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_uid50_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal xMSB_uid51_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid53_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid56_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal twoToMiSiYip_uid57_sincosTest_b : STD_LOGIC_VECTOR (37 downto 0);
    signal cstArcTan2Mi_1_uid58_sincosTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1E_2_uid60_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_2_uid60_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_2_uid60_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_2_uid60_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2_uid60_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_2_uid61_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_2_uid61_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_2_uid61_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_2_uid61_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2_uid61_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_2_uid63_sincosTest_a : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_2_uid63_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_2_uid63_sincosTest_o : STD_LOGIC_VECTOR (30 downto 0);
    signal aip1E_2_uid63_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2_uid63_sincosTest_q : STD_LOGIC_VECTOR (29 downto 0);
    signal xip1_2_uid64_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_2_uid64_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_2_uid65_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_2_uid65_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid66_sincosTest_in : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_uid66_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal xMSB_uid67_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid69_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid72_sincosTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal twoToMiSiYip_uid73_sincosTest_b : STD_LOGIC_VECTOR (36 downto 0);
    signal cstArcTan2Mi_2_uid74_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1E_3_uid76_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_3_uid76_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_3_uid76_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_3_uid76_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3_uid76_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_3_uid77_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_3_uid77_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_3_uid77_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_3_uid77_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3_uid77_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_3_uid79_sincosTest_a : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_3_uid79_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_3_uid79_sincosTest_o : STD_LOGIC_VECTOR (29 downto 0);
    signal aip1E_3_uid79_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3_uid79_sincosTest_q : STD_LOGIC_VECTOR (28 downto 0);
    signal xip1_3_uid80_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_3_uid80_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_3_uid81_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_3_uid81_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid82_sincosTest_in : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_uid82_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal xMSB_uid83_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid85_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid88_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal twoToMiSiYip_uid89_sincosTest_b : STD_LOGIC_VECTOR (35 downto 0);
    signal cstArcTan2Mi_3_uid90_sincosTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4_uid92_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_4_uid92_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_4_uid92_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_4_uid92_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4_uid92_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_4_uid93_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_4_uid93_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_4_uid93_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_4_uid93_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4_uid93_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_4_uid95_sincosTest_a : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_4_uid95_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_4_uid95_sincosTest_o : STD_LOGIC_VECTOR (28 downto 0);
    signal aip1E_4_uid95_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4_uid95_sincosTest_q : STD_LOGIC_VECTOR (27 downto 0);
    signal xip1_4_uid96_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_4_uid96_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_4_uid97_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_4_uid97_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid98_sincosTest_in : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_uid98_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal xMSB_uid99_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid101_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid104_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal twoToMiSiYip_uid105_sincosTest_b : STD_LOGIC_VECTOR (34 downto 0);
    signal cstArcTan2Mi_4_uid106_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1E_5_uid108_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_5_uid108_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_5_uid108_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_5_uid108_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5_uid108_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_5_uid109_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_5_uid109_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_5_uid109_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_5_uid109_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5_uid109_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_5_uid111_sincosTest_a : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_5_uid111_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_5_uid111_sincosTest_o : STD_LOGIC_VECTOR (27 downto 0);
    signal aip1E_5_uid111_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5_uid111_sincosTest_q : STD_LOGIC_VECTOR (26 downto 0);
    signal xip1_5_uid112_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_5_uid112_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_5_uid113_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_5_uid113_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid114_sincosTest_in : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_uid114_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xMSB_uid115_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid117_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid120_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal twoToMiSiYip_uid121_sincosTest_b : STD_LOGIC_VECTOR (33 downto 0);
    signal cstArcTan2Mi_5_uid122_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1E_6_uid124_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_6_uid124_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_6_uid124_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_6_uid124_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6_uid124_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_6_uid125_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_6_uid125_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_6_uid125_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_6_uid125_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6_uid125_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_6_uid127_sincosTest_a : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_6_uid127_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_6_uid127_sincosTest_o : STD_LOGIC_VECTOR (26 downto 0);
    signal aip1E_6_uid127_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6_uid127_sincosTest_q : STD_LOGIC_VECTOR (25 downto 0);
    signal xip1_6_uid128_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_6_uid128_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_6_uid129_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_6_uid129_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid130_sincosTest_in : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_uid130_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal xMSB_uid131_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid133_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid136_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal twoToMiSiYip_uid137_sincosTest_b : STD_LOGIC_VECTOR (32 downto 0);
    signal cstArcTan2Mi_6_uid138_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_7_uid140_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_7_uid140_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_7_uid140_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_7_uid140_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid140_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_7_uid141_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_7_uid141_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_7_uid141_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_7_uid141_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid141_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_7_uid143_sincosTest_a : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_7_uid143_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_7_uid143_sincosTest_o : STD_LOGIC_VECTOR (25 downto 0);
    signal aip1E_7_uid143_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7_uid143_sincosTest_q : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1_7_uid144_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_7_uid144_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_7_uid145_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_7_uid145_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid146_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid146_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xMSB_uid147_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid149_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid152_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal twoToMiSiYip_uid153_sincosTest_b : STD_LOGIC_VECTOR (31 downto 0);
    signal cstArcTan2Mi_7_uid154_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1E_8_uid156_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_8_uid156_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_8_uid156_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_8_uid156_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid156_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_8_uid157_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_8_uid157_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_8_uid157_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_8_uid157_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid157_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_8_uid159_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_8_uid159_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_8_uid159_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal aip1E_8_uid159_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8_uid159_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_8_uid160_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_8_uid160_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_8_uid161_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_8_uid161_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid162_sincosTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_uid162_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xMSB_uid163_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid165_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid168_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal twoToMiSiYip_uid169_sincosTest_b : STD_LOGIC_VECTOR (30 downto 0);
    signal cstArcTan2Mi_8_uid170_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1E_9_uid172_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_9_uid172_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_9_uid172_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_9_uid172_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid172_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_9_uid173_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_9_uid173_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_9_uid173_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_9_uid173_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid173_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal aip1E_9_uid175_sincosTest_a : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_9_uid175_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_9_uid175_sincosTest_o : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_9_uid175_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9_uid175_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_9_uid176_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_9_uid176_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_9_uid177_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_9_uid177_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid178_sincosTest_in : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_uid178_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal xMSB_uid179_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid181_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid184_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal twoToMiSiYip_uid185_sincosTest_b : STD_LOGIC_VECTOR (29 downto 0);
    signal cstArcTan2Mi_9_uid186_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_10_uid188_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_10_uid188_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_10_uid188_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_10_uid188_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid188_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_10_uid189_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_10_uid189_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_10_uid189_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_10_uid189_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid189_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid191_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid191_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid192_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_10high_uid193_sincosTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_10high_uid193_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_10high_uid193_sincosTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_10high_uid193_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_10high_uid193_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_10_uid194_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_10_uid195_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_10_uid195_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_10_uid196_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_10_uid196_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid197_sincosTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid197_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid198_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid200_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid203_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal twoToMiSiYip_uid204_sincosTest_b : STD_LOGIC_VECTOR (28 downto 0);
    signal cstArcTan2Mi_10_uid205_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_11_uid207_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_11_uid207_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_11_uid207_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_11_uid207_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_11_uid207_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_11_uid208_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_11_uid208_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_11_uid208_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_11_uid208_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_11_uid208_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid210_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid210_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid211_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_11high_uid212_sincosTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_11high_uid212_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_11high_uid212_sincosTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_11high_uid212_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_11high_uid212_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_11_uid213_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_11_uid214_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_11_uid214_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_11_uid215_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_11_uid215_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid216_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_uid216_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xMSB_uid217_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid219_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid222_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal twoToMiSiYip_uid223_sincosTest_b : STD_LOGIC_VECTOR (27 downto 0);
    signal cstArcTan2Mi_11_uid224_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_12_uid226_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_12_uid226_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_12_uid226_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_12_uid226_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_12_uid226_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_12_uid227_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_12_uid227_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_12_uid227_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_12_uid227_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_12_uid227_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid229_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid229_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid230_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_12high_uid231_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_12high_uid231_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_12high_uid231_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_12high_uid231_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_12high_uid231_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_12_uid232_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_12_uid233_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_12_uid233_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_12_uid234_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_12_uid234_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid235_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_uid235_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid236_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid238_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid241_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal twoToMiSiYip_uid242_sincosTest_b : STD_LOGIC_VECTOR (26 downto 0);
    signal cstArcTan2Mi_12_uid243_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_13_uid245_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_13_uid245_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_13_uid245_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_13_uid245_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_13_uid245_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_13_uid246_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_13_uid246_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_13_uid246_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_13_uid246_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_13_uid246_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid248_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid248_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid249_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_13high_uid250_sincosTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_13high_uid250_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_13high_uid250_sincosTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_13high_uid250_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_13high_uid250_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_13_uid251_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_13_uid252_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_13_uid252_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_13_uid253_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_13_uid253_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid254_sincosTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_uid254_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xMSB_uid255_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid257_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid260_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal twoToMiSiYip_uid261_sincosTest_b : STD_LOGIC_VECTOR (25 downto 0);
    signal cstArcTan2Mi_13_uid262_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_14_uid264_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_14_uid264_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_14_uid264_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_14_uid264_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_14_uid264_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_14_uid265_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_14_uid265_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_14_uid265_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_14_uid265_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_14_uid265_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid267_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid267_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid268_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_14high_uid269_sincosTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_14high_uid269_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_14high_uid269_sincosTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_14high_uid269_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_14high_uid269_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_14_uid270_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_14_uid271_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_14_uid271_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_14_uid272_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_14_uid272_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid273_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_uid273_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xMSB_uid274_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid276_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid279_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal twoToMiSiYip_uid280_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal cstArcTan2Mi_14_uid281_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_15_uid283_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_15_uid283_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_15_uid283_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_15_uid283_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_15_uid283_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_15_uid284_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_15_uid284_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_15_uid284_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_15_uid284_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_15_uid284_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid286_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid286_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid287_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_15high_uid288_sincosTest_a : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_15high_uid288_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_15high_uid288_sincosTest_o : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_15high_uid288_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_15high_uid288_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_15_uid289_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1_15_uid290_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_15_uid290_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_15_uid291_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_15_uid291_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid292_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_uid292_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xMSB_uid293_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid295_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid298_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal twoToMiSiYip_uid299_sincosTest_b : STD_LOGIC_VECTOR (23 downto 0);
    signal cstArcTan2Mi_15_uid300_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_16_uid302_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_16_uid302_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_16_uid302_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_16_uid302_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_16_uid302_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_16_uid303_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_16_uid303_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_16_uid303_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_16_uid303_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_16_uid303_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid305_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid305_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid306_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_16high_uid307_sincosTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_16high_uid307_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_16high_uid307_sincosTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_16high_uid307_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_16high_uid307_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_16_uid308_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_16_uid309_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_16_uid309_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_16_uid310_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_16_uid310_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid311_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_uid311_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xMSB_uid312_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid314_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid317_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal twoToMiSiYip_uid318_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal cstArcTan2Mi_16_uid319_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xip1E_17_uid321_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_17_uid321_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_17_uid321_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_17_uid321_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_17_uid321_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_17_uid322_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_17_uid322_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_17_uid322_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_17_uid322_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_17_uid322_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal lowRangeA_uid324_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid324_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid325_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_17high_uid326_sincosTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_17high_uid326_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_17high_uid326_sincosTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_17high_uid326_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_17high_uid326_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_17_uid327_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1_17_uid328_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_17_uid328_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_17_uid329_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_17_uid329_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal aip1E_uid330_sincosTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_uid330_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal xMSB_uid331_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid333_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid336_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal twoToMiSiYip_uid337_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1E_18_uid340_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_18_uid340_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_18_uid340_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal xip1E_18_uid340_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_18_uid340_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal yip1E_18_uid341_sincosTest_a : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_18_uid341_sincosTest_b : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_18_uid341_sincosTest_o : STD_LOGIC_VECTOR (40 downto 0);
    signal yip1E_18_uid341_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_18_uid341_sincosTest_q : STD_LOGIC_VECTOR (39 downto 0);
    signal xip1_18_uid347_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal xip1_18_uid347_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_18_uid348_sincosTest_in : STD_LOGIC_VECTOR (38 downto 0);
    signal yip1_18_uid348_sincosTest_b : STD_LOGIC_VECTOR (38 downto 0);
    signal xSumPreRnd_uid350_sincosTest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal xSumPreRnd_uid350_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xSumPostRnd_uid353_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal xSumPostRnd_uid353_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xSumPostRnd_uid353_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal xSumPostRnd_uid353_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal ySumPreRnd_uid354_sincosTest_in : STD_LOGIC_VECTOR (37 downto 0);
    signal ySumPreRnd_uid354_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal ySumPostRnd_uid357_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal ySumPostRnd_uid357_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal ySumPostRnd_uid357_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal ySumPostRnd_uid357_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xPostExc_uid358_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal xPostExc_uid358_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal yPostExc_uid359_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal yPostExc_uid359_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal invFirstQuadrant_uid360_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond2_uid361_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond1_uid362_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond0_uid364_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid365_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstZeroForAddSub_uid367_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal invSinNegCond_uid368_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid369_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal sinPostNeg_uid369_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal sinPostNeg_uid369_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal sinPostNeg_uid369_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid369_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal invCosNegCond_uid370_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid371_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal cosPostNeg_uid371_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal cosPostNeg_uid371_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal cosPostNeg_uid371_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid371_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xPostRR_uid372_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid372_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xPostRR_uid373_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid373_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal cos_uid374_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal cos_uid374_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal sin_uid375_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal sin_uid375_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal redist0_xMSB_uid331_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_xMSB_uid312_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_xMSB_uid293_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist3_yip1_15_uid291_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist4_xip1_15_uid290_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist5_aip1E_uid273_sincosTest_b_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal redist6_xMSB_uid255_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_xMSB_uid236_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_xMSB_uid217_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_yip1_11_uid215_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist10_xip1_11_uid214_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist11_aip1E_uid162_sincosTest_b_1_q : STD_LOGIC_VECTOR (21 downto 0);
    signal redist12_xMSB_uid147_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_yip1_7_uid145_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist14_xip1_7_uid144_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist15_aip1E_uid82_sincosTest_b_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal redist16_yip1_3_uid81_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist17_xip1_3_uid80_sincosTest_b_1_q : STD_LOGIC_VECTOR (38 downto 0);
    signal redist18_firstQuadrant_uid15_sincosTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist19_invSignA_uid8_sincosTest_q_4_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist20_signA_uid7_sincosTest_b_4_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- invFirstQuadrant_uid360_sincosTest(LOGICAL,359)@4
    invFirstQuadrant_uid360_sincosTest_q <= not (redist18_firstQuadrant_uid15_sincosTest_b_4_q);

    -- signA_uid7_sincosTest(BITSELECT,6)@0
    signA_uid7_sincosTest_b <= STD_LOGIC_VECTOR(a(18 downto 18));

    -- redist20_signA_uid7_sincosTest_b_4(DELAY,395)
    redist20_signA_uid7_sincosTest_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => signA_uid7_sincosTest_b, xout => redist20_signA_uid7_sincosTest_b_4_q, clk => clk, aclr => areset );

    -- sinNegCond2_uid361_sincosTest(LOGICAL,360)@4
    sinNegCond2_uid361_sincosTest_q <= redist20_signA_uid7_sincosTest_b_4_q and invFirstQuadrant_uid360_sincosTest_q;

    -- sinNegCond1_uid362_sincosTest(LOGICAL,361)@4
    sinNegCond1_uid362_sincosTest_q <= redist20_signA_uid7_sincosTest_b_4_q and redist18_firstQuadrant_uid15_sincosTest_b_4_q;

    -- invSignA_uid8_sincosTest(LOGICAL,7)@0
    invSignA_uid8_sincosTest_q <= not (signA_uid7_sincosTest_b);

    -- redist19_invSignA_uid8_sincosTest_q_4(DELAY,394)
    redist19_invSignA_uid8_sincosTest_q_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => invSignA_uid8_sincosTest_q, xout => redist19_invSignA_uid8_sincosTest_q_4_q, clk => clk, aclr => areset );

    -- sinNegCond0_uid364_sincosTest(LOGICAL,363)@4
    sinNegCond0_uid364_sincosTest_q <= redist19_invSignA_uid8_sincosTest_q_4_q and invFirstQuadrant_uid360_sincosTest_q;

    -- sinNegCond_uid365_sincosTest(LOGICAL,364)@4
    sinNegCond_uid365_sincosTest_q <= sinNegCond0_uid364_sincosTest_q or sinNegCond1_uid362_sincosTest_q or sinNegCond2_uid361_sincosTest_q;

    -- invSinNegCond_uid368_sincosTest(LOGICAL,367)@4
    invSinNegCond_uid368_sincosTest_q <= not (sinNegCond_uid365_sincosTest_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- xMSB_uid163_sincosTest(BITSELECT,162)@2
    xMSB_uid163_sincosTest_b <= STD_LOGIC_VECTOR(redist11_aip1E_uid162_sincosTest_b_1_q(21 downto 21));

    -- cstArcTan2Mi_8_uid170_sincosTest(CONSTANT,169)
    cstArcTan2Mi_8_uid170_sincosTest_q <= "01111111111111111101";

    -- xMSB_uid147_sincosTest(BITSELECT,146)@1
    xMSB_uid147_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid146_sincosTest_b(22 downto 22));

    -- cstArcTan2Mi_7_uid154_sincosTest(CONSTANT,153)
    cstArcTan2Mi_7_uid154_sincosTest_q <= "011111111111111101011";

    -- xMSB_uid131_sincosTest(BITSELECT,130)@1
    xMSB_uid131_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_b(23 downto 23));

    -- cstArcTan2Mi_6_uid138_sincosTest(CONSTANT,137)
    cstArcTan2Mi_6_uid138_sincosTest_q <= "0111111111111101010101";

    -- xMSB_uid115_sincosTest(BITSELECT,114)@1
    xMSB_uid115_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_b(24 downto 24));

    -- cstArcTan2Mi_5_uid122_sincosTest(CONSTANT,121)
    cstArcTan2Mi_5_uid122_sincosTest_q <= "01111111111101010101011";

    -- xMSB_uid99_sincosTest(BITSELECT,98)@1
    xMSB_uid99_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid98_sincosTest_b(25 downto 25));

    -- cstArcTan2Mi_4_uid106_sincosTest(CONSTANT,105)
    cstArcTan2Mi_4_uid106_sincosTest_q <= "011111111101010101101111";

    -- xMSB_uid83_sincosTest(BITSELECT,82)@1
    xMSB_uid83_sincosTest_b <= STD_LOGIC_VECTOR(redist15_aip1E_uid82_sincosTest_b_1_q(26 downto 26));

    -- cstArcTan2Mi_3_uid90_sincosTest(CONSTANT,89)
    cstArcTan2Mi_3_uid90_sincosTest_q <= "0111111101010110111010101";

    -- xMSB_uid67_sincosTest(BITSELECT,66)@0
    xMSB_uid67_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid66_sincosTest_b(27 downto 27));

    -- cstArcTan2Mi_2_uid74_sincosTest(CONSTANT,73)
    cstArcTan2Mi_2_uid74_sincosTest_q <= "01111101011011011101100000";

    -- xMSB_uid51_sincosTest(BITSELECT,50)@0
    xMSB_uid51_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_b(28 downto 28));

    -- cstArcTan2Mi_1_uid58_sincosTest(CONSTANT,57)
    cstArcTan2Mi_1_uid58_sincosTest_q <= "011101101011000110011100001";

    -- invSignOfSelectionSignal_uid36_sincosTest(LOGICAL,35)@0
    invSignOfSelectionSignal_uid36_sincosTest_q <= not (VCC_q);

    -- cstArcTan2Mi_0_uid26_sincosTest(CONSTANT,25)
    cstArcTan2Mi_0_uid26_sincosTest_q <= "0110010010000111111011010101";

    -- constantZero_uid6_sincosTest(CONSTANT,5)
    constantZero_uid6_sincosTest_q <= "0000000000000000000";

    -- absAE_uid9_sincosTest(ADDSUB,8)@0
    absAE_uid9_sincosTest_s <= invSignA_uid8_sincosTest_q;
    absAE_uid9_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => constantZero_uid6_sincosTest_q(18)) & constantZero_uid6_sincosTest_q));
    absAE_uid9_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => a(18)) & a));
    absAE_uid9_sincosTest_combproc: PROCESS (absAE_uid9_sincosTest_a, absAE_uid9_sincosTest_b, absAE_uid9_sincosTest_s)
    BEGIN
        IF (absAE_uid9_sincosTest_s = "1") THEN
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) + SIGNED(absAE_uid9_sincosTest_b));
        ELSE
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) - SIGNED(absAE_uid9_sincosTest_b));
        END IF;
    END PROCESS;
    absAE_uid9_sincosTest_q <= absAE_uid9_sincosTest_o(19 downto 0);

    -- absAR_uid10_sincosTest(BITSELECT,9)@0
    absAR_uid10_sincosTest_in <= absAE_uid9_sincosTest_q(17 downto 0);
    absAR_uid10_sincosTest_b <= absAR_uid10_sincosTest_in(17 downto 0);

    -- absARE_bottomRange_uid17_sincosTest(BITSELECT,16)@0
    absARE_bottomRange_uid17_sincosTest_in <= absAR_uid10_sincosTest_b(16 downto 0);
    absARE_bottomRange_uid17_sincosTest_b <= absARE_bottomRange_uid17_sincosTest_in(16 downto 0);

    -- padACst_uid12_sincosTest(CONSTANT,11)
    padACst_uid12_sincosTest_q <= "0000000";

    -- absARE_mergedSignalTM_uid18_sincosTest(BITJOIN,17)@0
    absARE_mergedSignalTM_uid18_sincosTest_q <= absARE_bottomRange_uid17_sincosTest_b & padACst_uid12_sincosTest_q;

    -- cstPiO2_uid11_sincosTest(CONSTANT,10)
    cstPiO2_uid11_sincosTest_q <= "110010010000111111011011";

    -- aPostPad_uid13_sincosTest(BITJOIN,12)@0
    aPostPad_uid13_sincosTest_q <= absAR_uid10_sincosTest_b & padACst_uid12_sincosTest_q;

    -- argMPiO2_uid14_sincosTest(SUB,13)@0
    argMPiO2_uid14_sincosTest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid13_sincosTest_q);
    argMPiO2_uid14_sincosTest_b <= STD_LOGIC_VECTOR("00" & cstPiO2_uid11_sincosTest_q);
    argMPiO2_uid14_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(argMPiO2_uid14_sincosTest_a) - UNSIGNED(argMPiO2_uid14_sincosTest_b));
    argMPiO2_uid14_sincosTest_q <= argMPiO2_uid14_sincosTest_o(25 downto 0);

    -- argMPiO2_uid20_sincosTest(BITSELECT,19)@0
    argMPiO2_uid20_sincosTest_in <= argMPiO2_uid14_sincosTest_q(23 downto 0);
    argMPiO2_uid20_sincosTest_b <= argMPiO2_uid20_sincosTest_in(23 downto 0);

    -- firstQuadrant_uid15_sincosTest(BITSELECT,14)@0
    firstQuadrant_uid15_sincosTest_b <= STD_LOGIC_VECTOR(argMPiO2_uid14_sincosTest_q(25 downto 25));

    -- absA_uid21_sincosTest(MUX,20)@0
    absA_uid21_sincosTest_s <= firstQuadrant_uid15_sincosTest_b;
    absA_uid21_sincosTest_combproc: PROCESS (absA_uid21_sincosTest_s, argMPiO2_uid20_sincosTest_b, absARE_mergedSignalTM_uid18_sincosTest_q)
    BEGIN
        CASE (absA_uid21_sincosTest_s) IS
            WHEN "0" => absA_uid21_sincosTest_q <= argMPiO2_uid20_sincosTest_b;
            WHEN "1" => absA_uid21_sincosTest_q <= absARE_mergedSignalTM_uid18_sincosTest_q;
            WHEN OTHERS => absA_uid21_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- aip1E_1CostZeroPaddingA_uid37_sincosTest(CONSTANT,36)
    aip1E_1CostZeroPaddingA_uid37_sincosTest_q <= "0000";

    -- aip1E_1NA_uid38_sincosTest(BITJOIN,37)@0
    aip1E_1NA_uid38_sincosTest_q <= absA_uid21_sincosTest_q & aip1E_1CostZeroPaddingA_uid37_sincosTest_q;

    -- aip1E_1sumAHighB_uid39_sincosTest(ADDSUB,38)@0
    aip1E_1sumAHighB_uid39_sincosTest_s <= invSignOfSelectionSignal_uid36_sincosTest_q;
    aip1E_1sumAHighB_uid39_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aip1E_1NA_uid38_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 28 => cstArcTan2Mi_0_uid26_sincosTest_q(27)) & cstArcTan2Mi_0_uid26_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_combproc: PROCESS (aip1E_1sumAHighB_uid39_sincosTest_a, aip1E_1sumAHighB_uid39_sincosTest_b, aip1E_1sumAHighB_uid39_sincosTest_s)
    BEGIN
        IF (aip1E_1sumAHighB_uid39_sincosTest_s = "1") THEN
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) + SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        ELSE
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) - SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_1sumAHighB_uid39_sincosTest_q <= aip1E_1sumAHighB_uid39_sincosTest_o(29 downto 0);

    -- aip1E_uid50_sincosTest(BITSELECT,49)@0
    aip1E_uid50_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_1sumAHighB_uid39_sincosTest_q(28 downto 0));
    aip1E_uid50_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_in(28 downto 0));

    -- aip1E_2_uid63_sincosTest(ADDSUB,62)@0
    aip1E_2_uid63_sincosTest_s <= xMSB_uid51_sincosTest_b;
    aip1E_2_uid63_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 29 => aip1E_uid50_sincosTest_b(28)) & aip1E_uid50_sincosTest_b));
    aip1E_2_uid63_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((30 downto 27 => cstArcTan2Mi_1_uid58_sincosTest_q(26)) & cstArcTan2Mi_1_uid58_sincosTest_q));
    aip1E_2_uid63_sincosTest_combproc: PROCESS (aip1E_2_uid63_sincosTest_a, aip1E_2_uid63_sincosTest_b, aip1E_2_uid63_sincosTest_s)
    BEGIN
        IF (aip1E_2_uid63_sincosTest_s = "1") THEN
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) + SIGNED(aip1E_2_uid63_sincosTest_b));
        ELSE
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) - SIGNED(aip1E_2_uid63_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_2_uid63_sincosTest_q <= aip1E_2_uid63_sincosTest_o(29 downto 0);

    -- aip1E_uid66_sincosTest(BITSELECT,65)@0
    aip1E_uid66_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_2_uid63_sincosTest_q(27 downto 0));
    aip1E_uid66_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid66_sincosTest_in(27 downto 0));

    -- aip1E_3_uid79_sincosTest(ADDSUB,78)@0
    aip1E_3_uid79_sincosTest_s <= xMSB_uid67_sincosTest_b;
    aip1E_3_uid79_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 28 => aip1E_uid66_sincosTest_b(27)) & aip1E_uid66_sincosTest_b));
    aip1E_3_uid79_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 26 => cstArcTan2Mi_2_uid74_sincosTest_q(25)) & cstArcTan2Mi_2_uid74_sincosTest_q));
    aip1E_3_uid79_sincosTest_combproc: PROCESS (aip1E_3_uid79_sincosTest_a, aip1E_3_uid79_sincosTest_b, aip1E_3_uid79_sincosTest_s)
    BEGIN
        IF (aip1E_3_uid79_sincosTest_s = "1") THEN
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) + SIGNED(aip1E_3_uid79_sincosTest_b));
        ELSE
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) - SIGNED(aip1E_3_uid79_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_3_uid79_sincosTest_q <= aip1E_3_uid79_sincosTest_o(28 downto 0);

    -- aip1E_uid82_sincosTest(BITSELECT,81)@0
    aip1E_uid82_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_3_uid79_sincosTest_q(26 downto 0));
    aip1E_uid82_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid82_sincosTest_in(26 downto 0));

    -- redist15_aip1E_uid82_sincosTest_b_1(DELAY,390)
    redist15_aip1E_uid82_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 27, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid82_sincosTest_b, xout => redist15_aip1E_uid82_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_4_uid95_sincosTest(ADDSUB,94)@1
    aip1E_4_uid95_sincosTest_s <= xMSB_uid83_sincosTest_b;
    aip1E_4_uid95_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 27 => redist15_aip1E_uid82_sincosTest_b_1_q(26)) & redist15_aip1E_uid82_sincosTest_b_1_q));
    aip1E_4_uid95_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 25 => cstArcTan2Mi_3_uid90_sincosTest_q(24)) & cstArcTan2Mi_3_uid90_sincosTest_q));
    aip1E_4_uid95_sincosTest_combproc: PROCESS (aip1E_4_uid95_sincosTest_a, aip1E_4_uid95_sincosTest_b, aip1E_4_uid95_sincosTest_s)
    BEGIN
        IF (aip1E_4_uid95_sincosTest_s = "1") THEN
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) + SIGNED(aip1E_4_uid95_sincosTest_b));
        ELSE
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) - SIGNED(aip1E_4_uid95_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_4_uid95_sincosTest_q <= aip1E_4_uid95_sincosTest_o(27 downto 0);

    -- aip1E_uid98_sincosTest(BITSELECT,97)@1
    aip1E_uid98_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_4_uid95_sincosTest_q(25 downto 0));
    aip1E_uid98_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid98_sincosTest_in(25 downto 0));

    -- aip1E_5_uid111_sincosTest(ADDSUB,110)@1
    aip1E_5_uid111_sincosTest_s <= xMSB_uid99_sincosTest_b;
    aip1E_5_uid111_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 26 => aip1E_uid98_sincosTest_b(25)) & aip1E_uid98_sincosTest_b));
    aip1E_5_uid111_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 24 => cstArcTan2Mi_4_uid106_sincosTest_q(23)) & cstArcTan2Mi_4_uid106_sincosTest_q));
    aip1E_5_uid111_sincosTest_combproc: PROCESS (aip1E_5_uid111_sincosTest_a, aip1E_5_uid111_sincosTest_b, aip1E_5_uid111_sincosTest_s)
    BEGIN
        IF (aip1E_5_uid111_sincosTest_s = "1") THEN
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) + SIGNED(aip1E_5_uid111_sincosTest_b));
        ELSE
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) - SIGNED(aip1E_5_uid111_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_5_uid111_sincosTest_q <= aip1E_5_uid111_sincosTest_o(26 downto 0);

    -- aip1E_uid114_sincosTest(BITSELECT,113)@1
    aip1E_uid114_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_5_uid111_sincosTest_q(24 downto 0));
    aip1E_uid114_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_in(24 downto 0));

    -- aip1E_6_uid127_sincosTest(ADDSUB,126)@1
    aip1E_6_uid127_sincosTest_s <= xMSB_uid115_sincosTest_b;
    aip1E_6_uid127_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 25 => aip1E_uid114_sincosTest_b(24)) & aip1E_uid114_sincosTest_b));
    aip1E_6_uid127_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 23 => cstArcTan2Mi_5_uid122_sincosTest_q(22)) & cstArcTan2Mi_5_uid122_sincosTest_q));
    aip1E_6_uid127_sincosTest_combproc: PROCESS (aip1E_6_uid127_sincosTest_a, aip1E_6_uid127_sincosTest_b, aip1E_6_uid127_sincosTest_s)
    BEGIN
        IF (aip1E_6_uid127_sincosTest_s = "1") THEN
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) + SIGNED(aip1E_6_uid127_sincosTest_b));
        ELSE
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) - SIGNED(aip1E_6_uid127_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_6_uid127_sincosTest_q <= aip1E_6_uid127_sincosTest_o(25 downto 0);

    -- aip1E_uid130_sincosTest(BITSELECT,129)@1
    aip1E_uid130_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_6_uid127_sincosTest_q(23 downto 0));
    aip1E_uid130_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_in(23 downto 0));

    -- aip1E_7_uid143_sincosTest(ADDSUB,142)@1
    aip1E_7_uid143_sincosTest_s <= xMSB_uid131_sincosTest_b;
    aip1E_7_uid143_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 24 => aip1E_uid130_sincosTest_b(23)) & aip1E_uid130_sincosTest_b));
    aip1E_7_uid143_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 22 => cstArcTan2Mi_6_uid138_sincosTest_q(21)) & cstArcTan2Mi_6_uid138_sincosTest_q));
    aip1E_7_uid143_sincosTest_combproc: PROCESS (aip1E_7_uid143_sincosTest_a, aip1E_7_uid143_sincosTest_b, aip1E_7_uid143_sincosTest_s)
    BEGIN
        IF (aip1E_7_uid143_sincosTest_s = "1") THEN
            aip1E_7_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7_uid143_sincosTest_a) + SIGNED(aip1E_7_uid143_sincosTest_b));
        ELSE
            aip1E_7_uid143_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7_uid143_sincosTest_a) - SIGNED(aip1E_7_uid143_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_7_uid143_sincosTest_q <= aip1E_7_uid143_sincosTest_o(24 downto 0);

    -- aip1E_uid146_sincosTest(BITSELECT,145)@1
    aip1E_uid146_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_7_uid143_sincosTest_q(22 downto 0));
    aip1E_uid146_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid146_sincosTest_in(22 downto 0));

    -- aip1E_8_uid159_sincosTest(ADDSUB,158)@1
    aip1E_8_uid159_sincosTest_s <= xMSB_uid147_sincosTest_b;
    aip1E_8_uid159_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => aip1E_uid146_sincosTest_b(22)) & aip1E_uid146_sincosTest_b));
    aip1E_8_uid159_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 21 => cstArcTan2Mi_7_uid154_sincosTest_q(20)) & cstArcTan2Mi_7_uid154_sincosTest_q));
    aip1E_8_uid159_sincosTest_combproc: PROCESS (aip1E_8_uid159_sincosTest_a, aip1E_8_uid159_sincosTest_b, aip1E_8_uid159_sincosTest_s)
    BEGIN
        IF (aip1E_8_uid159_sincosTest_s = "1") THEN
            aip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8_uid159_sincosTest_a) + SIGNED(aip1E_8_uid159_sincosTest_b));
        ELSE
            aip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8_uid159_sincosTest_a) - SIGNED(aip1E_8_uid159_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_8_uid159_sincosTest_q <= aip1E_8_uid159_sincosTest_o(23 downto 0);

    -- aip1E_uid162_sincosTest(BITSELECT,161)@1
    aip1E_uid162_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_8_uid159_sincosTest_q(21 downto 0));
    aip1E_uid162_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid162_sincosTest_in(21 downto 0));

    -- redist11_aip1E_uid162_sincosTest_b_1(DELAY,386)
    redist11_aip1E_uid162_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 22, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid162_sincosTest_b, xout => redist11_aip1E_uid162_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_9_uid175_sincosTest(ADDSUB,174)@2
    aip1E_9_uid175_sincosTest_s <= xMSB_uid163_sincosTest_b;
    aip1E_9_uid175_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 22 => redist11_aip1E_uid162_sincosTest_b_1_q(21)) & redist11_aip1E_uid162_sincosTest_b_1_q));
    aip1E_9_uid175_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((23 downto 20 => cstArcTan2Mi_8_uid170_sincosTest_q(19)) & cstArcTan2Mi_8_uid170_sincosTest_q));
    aip1E_9_uid175_sincosTest_combproc: PROCESS (aip1E_9_uid175_sincosTest_a, aip1E_9_uid175_sincosTest_b, aip1E_9_uid175_sincosTest_s)
    BEGIN
        IF (aip1E_9_uid175_sincosTest_s = "1") THEN
            aip1E_9_uid175_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9_uid175_sincosTest_a) + SIGNED(aip1E_9_uid175_sincosTest_b));
        ELSE
            aip1E_9_uid175_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9_uid175_sincosTest_a) - SIGNED(aip1E_9_uid175_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_9_uid175_sincosTest_q <= aip1E_9_uid175_sincosTest_o(22 downto 0);

    -- aip1E_uid178_sincosTest(BITSELECT,177)@2
    aip1E_uid178_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_9_uid175_sincosTest_q(20 downto 0));
    aip1E_uid178_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid178_sincosTest_in(20 downto 0));

    -- xMSB_uid179_sincosTest(BITSELECT,178)@2
    xMSB_uid179_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid178_sincosTest_b(20 downto 20));

    -- cstArcTan2Mi_9_uid186_sincosTest(CONSTANT,185)
    cstArcTan2Mi_9_uid186_sincosTest_q <= "0100000000000000000";

    -- highABits_uid192_sincosTest(BITSELECT,191)@2
    highABits_uid192_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid178_sincosTest_b(20 downto 1));

    -- aip1E_10high_uid193_sincosTest(ADDSUB,192)@2
    aip1E_10high_uid193_sincosTest_s <= xMSB_uid179_sincosTest_b;
    aip1E_10high_uid193_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => highABits_uid192_sincosTest_b(19)) & highABits_uid192_sincosTest_b));
    aip1E_10high_uid193_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 19 => cstArcTan2Mi_9_uid186_sincosTest_q(18)) & cstArcTan2Mi_9_uid186_sincosTest_q));
    aip1E_10high_uid193_sincosTest_combproc: PROCESS (aip1E_10high_uid193_sincosTest_a, aip1E_10high_uid193_sincosTest_b, aip1E_10high_uid193_sincosTest_s)
    BEGIN
        IF (aip1E_10high_uid193_sincosTest_s = "1") THEN
            aip1E_10high_uid193_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid193_sincosTest_a) + SIGNED(aip1E_10high_uid193_sincosTest_b));
        ELSE
            aip1E_10high_uid193_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_10high_uid193_sincosTest_a) - SIGNED(aip1E_10high_uid193_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_10high_uid193_sincosTest_q <= aip1E_10high_uid193_sincosTest_o(20 downto 0);

    -- lowRangeA_uid191_sincosTest(BITSELECT,190)@2
    lowRangeA_uid191_sincosTest_in <= aip1E_uid178_sincosTest_b(0 downto 0);
    lowRangeA_uid191_sincosTest_b <= lowRangeA_uid191_sincosTest_in(0 downto 0);

    -- aip1E_10_uid194_sincosTest(BITJOIN,193)@2
    aip1E_10_uid194_sincosTest_q <= aip1E_10high_uid193_sincosTest_q & lowRangeA_uid191_sincosTest_b;

    -- aip1E_uid197_sincosTest(BITSELECT,196)@2
    aip1E_uid197_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_10_uid194_sincosTest_q(19 downto 0));
    aip1E_uid197_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid197_sincosTest_in(19 downto 0));

    -- xMSB_uid198_sincosTest(BITSELECT,197)@2
    xMSB_uid198_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid197_sincosTest_b(19 downto 19));

    -- cstArcTan2Mi_10_uid205_sincosTest(CONSTANT,204)
    cstArcTan2Mi_10_uid205_sincosTest_q <= "010000000000000000";

    -- highABits_uid211_sincosTest(BITSELECT,210)@2
    highABits_uid211_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid197_sincosTest_b(19 downto 1));

    -- aip1E_11high_uid212_sincosTest(ADDSUB,211)@2
    aip1E_11high_uid212_sincosTest_s <= xMSB_uid198_sincosTest_b;
    aip1E_11high_uid212_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => highABits_uid211_sincosTest_b(18)) & highABits_uid211_sincosTest_b));
    aip1E_11high_uid212_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 18 => cstArcTan2Mi_10_uid205_sincosTest_q(17)) & cstArcTan2Mi_10_uid205_sincosTest_q));
    aip1E_11high_uid212_sincosTest_combproc: PROCESS (aip1E_11high_uid212_sincosTest_a, aip1E_11high_uid212_sincosTest_b, aip1E_11high_uid212_sincosTest_s)
    BEGIN
        IF (aip1E_11high_uid212_sincosTest_s = "1") THEN
            aip1E_11high_uid212_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid212_sincosTest_a) + SIGNED(aip1E_11high_uid212_sincosTest_b));
        ELSE
            aip1E_11high_uid212_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_11high_uid212_sincosTest_a) - SIGNED(aip1E_11high_uid212_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_11high_uid212_sincosTest_q <= aip1E_11high_uid212_sincosTest_o(19 downto 0);

    -- lowRangeA_uid210_sincosTest(BITSELECT,209)@2
    lowRangeA_uid210_sincosTest_in <= aip1E_uid197_sincosTest_b(0 downto 0);
    lowRangeA_uid210_sincosTest_b <= lowRangeA_uid210_sincosTest_in(0 downto 0);

    -- aip1E_11_uid213_sincosTest(BITJOIN,212)@2
    aip1E_11_uid213_sincosTest_q <= aip1E_11high_uid212_sincosTest_q & lowRangeA_uid210_sincosTest_b;

    -- aip1E_uid216_sincosTest(BITSELECT,215)@2
    aip1E_uid216_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_11_uid213_sincosTest_q(18 downto 0));
    aip1E_uid216_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid216_sincosTest_in(18 downto 0));

    -- xMSB_uid217_sincosTest(BITSELECT,216)@2
    xMSB_uid217_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid216_sincosTest_b(18 downto 18));

    -- cstArcTan2Mi_11_uid224_sincosTest(CONSTANT,223)
    cstArcTan2Mi_11_uid224_sincosTest_q <= "01000000000000000";

    -- highABits_uid230_sincosTest(BITSELECT,229)@2
    highABits_uid230_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid216_sincosTest_b(18 downto 1));

    -- aip1E_12high_uid231_sincosTest(ADDSUB,230)@2
    aip1E_12high_uid231_sincosTest_s <= xMSB_uid217_sincosTest_b;
    aip1E_12high_uid231_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => highABits_uid230_sincosTest_b(17)) & highABits_uid230_sincosTest_b));
    aip1E_12high_uid231_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => cstArcTan2Mi_11_uid224_sincosTest_q(16)) & cstArcTan2Mi_11_uid224_sincosTest_q));
    aip1E_12high_uid231_sincosTest_combproc: PROCESS (aip1E_12high_uid231_sincosTest_a, aip1E_12high_uid231_sincosTest_b, aip1E_12high_uid231_sincosTest_s)
    BEGIN
        IF (aip1E_12high_uid231_sincosTest_s = "1") THEN
            aip1E_12high_uid231_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12high_uid231_sincosTest_a) + SIGNED(aip1E_12high_uid231_sincosTest_b));
        ELSE
            aip1E_12high_uid231_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_12high_uid231_sincosTest_a) - SIGNED(aip1E_12high_uid231_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_12high_uid231_sincosTest_q <= aip1E_12high_uid231_sincosTest_o(18 downto 0);

    -- lowRangeA_uid229_sincosTest(BITSELECT,228)@2
    lowRangeA_uid229_sincosTest_in <= aip1E_uid216_sincosTest_b(0 downto 0);
    lowRangeA_uid229_sincosTest_b <= lowRangeA_uid229_sincosTest_in(0 downto 0);

    -- aip1E_12_uid232_sincosTest(BITJOIN,231)@2
    aip1E_12_uid232_sincosTest_q <= aip1E_12high_uid231_sincosTest_q & lowRangeA_uid229_sincosTest_b;

    -- aip1E_uid235_sincosTest(BITSELECT,234)@2
    aip1E_uid235_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_12_uid232_sincosTest_q(17 downto 0));
    aip1E_uid235_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid235_sincosTest_in(17 downto 0));

    -- xMSB_uid236_sincosTest(BITSELECT,235)@2
    xMSB_uid236_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid235_sincosTest_b(17 downto 17));

    -- cstArcTan2Mi_12_uid243_sincosTest(CONSTANT,242)
    cstArcTan2Mi_12_uid243_sincosTest_q <= "0100000000000000";

    -- highABits_uid249_sincosTest(BITSELECT,248)@2
    highABits_uid249_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid235_sincosTest_b(17 downto 1));

    -- aip1E_13high_uid250_sincosTest(ADDSUB,249)@2
    aip1E_13high_uid250_sincosTest_s <= xMSB_uid236_sincosTest_b;
    aip1E_13high_uid250_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => highABits_uid249_sincosTest_b(16)) & highABits_uid249_sincosTest_b));
    aip1E_13high_uid250_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => cstArcTan2Mi_12_uid243_sincosTest_q(15)) & cstArcTan2Mi_12_uid243_sincosTest_q));
    aip1E_13high_uid250_sincosTest_combproc: PROCESS (aip1E_13high_uid250_sincosTest_a, aip1E_13high_uid250_sincosTest_b, aip1E_13high_uid250_sincosTest_s)
    BEGIN
        IF (aip1E_13high_uid250_sincosTest_s = "1") THEN
            aip1E_13high_uid250_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13high_uid250_sincosTest_a) + SIGNED(aip1E_13high_uid250_sincosTest_b));
        ELSE
            aip1E_13high_uid250_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_13high_uid250_sincosTest_a) - SIGNED(aip1E_13high_uid250_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_13high_uid250_sincosTest_q <= aip1E_13high_uid250_sincosTest_o(17 downto 0);

    -- lowRangeA_uid248_sincosTest(BITSELECT,247)@2
    lowRangeA_uid248_sincosTest_in <= aip1E_uid235_sincosTest_b(0 downto 0);
    lowRangeA_uid248_sincosTest_b <= lowRangeA_uid248_sincosTest_in(0 downto 0);

    -- aip1E_13_uid251_sincosTest(BITJOIN,250)@2
    aip1E_13_uid251_sincosTest_q <= aip1E_13high_uid250_sincosTest_q & lowRangeA_uid248_sincosTest_b;

    -- aip1E_uid254_sincosTest(BITSELECT,253)@2
    aip1E_uid254_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_13_uid251_sincosTest_q(16 downto 0));
    aip1E_uid254_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid254_sincosTest_in(16 downto 0));

    -- xMSB_uid255_sincosTest(BITSELECT,254)@2
    xMSB_uid255_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid254_sincosTest_b(16 downto 16));

    -- cstArcTan2Mi_13_uid262_sincosTest(CONSTANT,261)
    cstArcTan2Mi_13_uid262_sincosTest_q <= "010000000000000";

    -- highABits_uid268_sincosTest(BITSELECT,267)@2
    highABits_uid268_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid254_sincosTest_b(16 downto 1));

    -- aip1E_14high_uid269_sincosTest(ADDSUB,268)@2
    aip1E_14high_uid269_sincosTest_s <= xMSB_uid255_sincosTest_b;
    aip1E_14high_uid269_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => highABits_uid268_sincosTest_b(15)) & highABits_uid268_sincosTest_b));
    aip1E_14high_uid269_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 15 => cstArcTan2Mi_13_uid262_sincosTest_q(14)) & cstArcTan2Mi_13_uid262_sincosTest_q));
    aip1E_14high_uid269_sincosTest_combproc: PROCESS (aip1E_14high_uid269_sincosTest_a, aip1E_14high_uid269_sincosTest_b, aip1E_14high_uid269_sincosTest_s)
    BEGIN
        IF (aip1E_14high_uid269_sincosTest_s = "1") THEN
            aip1E_14high_uid269_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14high_uid269_sincosTest_a) + SIGNED(aip1E_14high_uid269_sincosTest_b));
        ELSE
            aip1E_14high_uid269_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_14high_uid269_sincosTest_a) - SIGNED(aip1E_14high_uid269_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_14high_uid269_sincosTest_q <= aip1E_14high_uid269_sincosTest_o(16 downto 0);

    -- lowRangeA_uid267_sincosTest(BITSELECT,266)@2
    lowRangeA_uid267_sincosTest_in <= aip1E_uid254_sincosTest_b(0 downto 0);
    lowRangeA_uid267_sincosTest_b <= lowRangeA_uid267_sincosTest_in(0 downto 0);

    -- aip1E_14_uid270_sincosTest(BITJOIN,269)@2
    aip1E_14_uid270_sincosTest_q <= aip1E_14high_uid269_sincosTest_q & lowRangeA_uid267_sincosTest_b;

    -- aip1E_uid273_sincosTest(BITSELECT,272)@2
    aip1E_uid273_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_14_uid270_sincosTest_q(15 downto 0));
    aip1E_uid273_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid273_sincosTest_in(15 downto 0));

    -- redist5_aip1E_uid273_sincosTest_b_1(DELAY,380)
    redist5_aip1E_uid273_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 16, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid273_sincosTest_b, xout => redist5_aip1E_uid273_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xMSB_uid274_sincosTest(BITSELECT,273)@3
    xMSB_uid274_sincosTest_b <= STD_LOGIC_VECTOR(redist5_aip1E_uid273_sincosTest_b_1_q(15 downto 15));

    -- cstArcTan2Mi_14_uid281_sincosTest(CONSTANT,280)
    cstArcTan2Mi_14_uid281_sincosTest_q <= "01000000000000";

    -- highABits_uid287_sincosTest(BITSELECT,286)@3
    highABits_uid287_sincosTest_b <= STD_LOGIC_VECTOR(redist5_aip1E_uid273_sincosTest_b_1_q(15 downto 1));

    -- aip1E_15high_uid288_sincosTest(ADDSUB,287)@3
    aip1E_15high_uid288_sincosTest_s <= xMSB_uid274_sincosTest_b;
    aip1E_15high_uid288_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => highABits_uid287_sincosTest_b(14)) & highABits_uid287_sincosTest_b));
    aip1E_15high_uid288_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 14 => cstArcTan2Mi_14_uid281_sincosTest_q(13)) & cstArcTan2Mi_14_uid281_sincosTest_q));
    aip1E_15high_uid288_sincosTest_combproc: PROCESS (aip1E_15high_uid288_sincosTest_a, aip1E_15high_uid288_sincosTest_b, aip1E_15high_uid288_sincosTest_s)
    BEGIN
        IF (aip1E_15high_uid288_sincosTest_s = "1") THEN
            aip1E_15high_uid288_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_15high_uid288_sincosTest_a) + SIGNED(aip1E_15high_uid288_sincosTest_b));
        ELSE
            aip1E_15high_uid288_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_15high_uid288_sincosTest_a) - SIGNED(aip1E_15high_uid288_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_15high_uid288_sincosTest_q <= aip1E_15high_uid288_sincosTest_o(15 downto 0);

    -- lowRangeA_uid286_sincosTest(BITSELECT,285)@3
    lowRangeA_uid286_sincosTest_in <= redist5_aip1E_uid273_sincosTest_b_1_q(0 downto 0);
    lowRangeA_uid286_sincosTest_b <= lowRangeA_uid286_sincosTest_in(0 downto 0);

    -- aip1E_15_uid289_sincosTest(BITJOIN,288)@3
    aip1E_15_uid289_sincosTest_q <= aip1E_15high_uid288_sincosTest_q & lowRangeA_uid286_sincosTest_b;

    -- aip1E_uid292_sincosTest(BITSELECT,291)@3
    aip1E_uid292_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_15_uid289_sincosTest_q(14 downto 0));
    aip1E_uid292_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid292_sincosTest_in(14 downto 0));

    -- xMSB_uid293_sincosTest(BITSELECT,292)@3
    xMSB_uid293_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid292_sincosTest_b(14 downto 14));

    -- cstArcTan2Mi_15_uid300_sincosTest(CONSTANT,299)
    cstArcTan2Mi_15_uid300_sincosTest_q <= "0100000000000";

    -- highABits_uid306_sincosTest(BITSELECT,305)@3
    highABits_uid306_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid292_sincosTest_b(14 downto 1));

    -- aip1E_16high_uid307_sincosTest(ADDSUB,306)@3
    aip1E_16high_uid307_sincosTest_s <= xMSB_uid293_sincosTest_b;
    aip1E_16high_uid307_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid306_sincosTest_b(13)) & highABits_uid306_sincosTest_b));
    aip1E_16high_uid307_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => cstArcTan2Mi_15_uid300_sincosTest_q(12)) & cstArcTan2Mi_15_uid300_sincosTest_q));
    aip1E_16high_uid307_sincosTest_combproc: PROCESS (aip1E_16high_uid307_sincosTest_a, aip1E_16high_uid307_sincosTest_b, aip1E_16high_uid307_sincosTest_s)
    BEGIN
        IF (aip1E_16high_uid307_sincosTest_s = "1") THEN
            aip1E_16high_uid307_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_16high_uid307_sincosTest_a) + SIGNED(aip1E_16high_uid307_sincosTest_b));
        ELSE
            aip1E_16high_uid307_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_16high_uid307_sincosTest_a) - SIGNED(aip1E_16high_uid307_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_16high_uid307_sincosTest_q <= aip1E_16high_uid307_sincosTest_o(14 downto 0);

    -- lowRangeA_uid305_sincosTest(BITSELECT,304)@3
    lowRangeA_uid305_sincosTest_in <= aip1E_uid292_sincosTest_b(0 downto 0);
    lowRangeA_uid305_sincosTest_b <= lowRangeA_uid305_sincosTest_in(0 downto 0);

    -- aip1E_16_uid308_sincosTest(BITJOIN,307)@3
    aip1E_16_uid308_sincosTest_q <= aip1E_16high_uid307_sincosTest_q & lowRangeA_uid305_sincosTest_b;

    -- aip1E_uid311_sincosTest(BITSELECT,310)@3
    aip1E_uid311_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_16_uid308_sincosTest_q(13 downto 0));
    aip1E_uid311_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid311_sincosTest_in(13 downto 0));

    -- xMSB_uid312_sincosTest(BITSELECT,311)@3
    xMSB_uid312_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid311_sincosTest_b(13 downto 13));

    -- cstArcTan2Mi_16_uid319_sincosTest(CONSTANT,318)
    cstArcTan2Mi_16_uid319_sincosTest_q <= "010000000000";

    -- highABits_uid325_sincosTest(BITSELECT,324)@3
    highABits_uid325_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid311_sincosTest_b(13 downto 1));

    -- aip1E_17high_uid326_sincosTest(ADDSUB,325)@3
    aip1E_17high_uid326_sincosTest_s <= xMSB_uid312_sincosTest_b;
    aip1E_17high_uid326_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => highABits_uid325_sincosTest_b(12)) & highABits_uid325_sincosTest_b));
    aip1E_17high_uid326_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => cstArcTan2Mi_16_uid319_sincosTest_q(11)) & cstArcTan2Mi_16_uid319_sincosTest_q));
    aip1E_17high_uid326_sincosTest_combproc: PROCESS (aip1E_17high_uid326_sincosTest_a, aip1E_17high_uid326_sincosTest_b, aip1E_17high_uid326_sincosTest_s)
    BEGIN
        IF (aip1E_17high_uid326_sincosTest_s = "1") THEN
            aip1E_17high_uid326_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_17high_uid326_sincosTest_a) + SIGNED(aip1E_17high_uid326_sincosTest_b));
        ELSE
            aip1E_17high_uid326_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_17high_uid326_sincosTest_a) - SIGNED(aip1E_17high_uid326_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_17high_uid326_sincosTest_q <= aip1E_17high_uid326_sincosTest_o(13 downto 0);

    -- lowRangeA_uid324_sincosTest(BITSELECT,323)@3
    lowRangeA_uid324_sincosTest_in <= aip1E_uid311_sincosTest_b(0 downto 0);
    lowRangeA_uid324_sincosTest_b <= lowRangeA_uid324_sincosTest_in(0 downto 0);

    -- aip1E_17_uid327_sincosTest(BITJOIN,326)@3
    aip1E_17_uid327_sincosTest_q <= aip1E_17high_uid326_sincosTest_q & lowRangeA_uid324_sincosTest_b;

    -- aip1E_uid330_sincosTest(BITSELECT,329)@3
    aip1E_uid330_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_17_uid327_sincosTest_q(12 downto 0));
    aip1E_uid330_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid330_sincosTest_in(12 downto 0));

    -- xMSB_uid331_sincosTest(BITSELECT,330)@3
    xMSB_uid331_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid330_sincosTest_b(12 downto 12));

    -- redist0_xMSB_uid331_sincosTest_b_1(DELAY,375)
    redist0_xMSB_uid331_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid331_sincosTest_b, xout => redist0_xMSB_uid331_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid333_sincosTest(LOGICAL,332)@4
    signOfSelectionSignal_uid333_sincosTest_q <= not (redist0_xMSB_uid331_sincosTest_b_1_q);

    -- redist1_xMSB_uid312_sincosTest_b_1(DELAY,376)
    redist1_xMSB_uid312_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid312_sincosTest_b, xout => redist1_xMSB_uid312_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist2_xMSB_uid293_sincosTest_b_1(DELAY,377)
    redist2_xMSB_uid293_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid293_sincosTest_b, xout => redist2_xMSB_uid293_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid295_sincosTest(LOGICAL,294)@4
    signOfSelectionSignal_uid295_sincosTest_q <= not (redist2_xMSB_uid293_sincosTest_b_1_q);

    -- redist6_xMSB_uid255_sincosTest_b_1(DELAY,381)
    redist6_xMSB_uid255_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid255_sincosTest_b, xout => redist6_xMSB_uid255_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid257_sincosTest(LOGICAL,256)@3
    signOfSelectionSignal_uid257_sincosTest_q <= not (redist6_xMSB_uid255_sincosTest_b_1_q);

    -- redist7_xMSB_uid236_sincosTest_b_1(DELAY,382)
    redist7_xMSB_uid236_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid236_sincosTest_b, xout => redist7_xMSB_uid236_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist8_xMSB_uid217_sincosTest_b_1(DELAY,383)
    redist8_xMSB_uid217_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid217_sincosTest_b, xout => redist8_xMSB_uid217_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid219_sincosTest(LOGICAL,218)@3
    signOfSelectionSignal_uid219_sincosTest_q <= not (redist8_xMSB_uid217_sincosTest_b_1_q);

    -- signOfSelectionSignal_uid181_sincosTest(LOGICAL,180)@2
    signOfSelectionSignal_uid181_sincosTest_q <= not (xMSB_uid179_sincosTest_b);

    -- redist12_xMSB_uid147_sincosTest_b_1(DELAY,387)
    redist12_xMSB_uid147_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid147_sincosTest_b, xout => redist12_xMSB_uid147_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid149_sincosTest(LOGICAL,148)@2
    signOfSelectionSignal_uid149_sincosTest_q <= not (redist12_xMSB_uid147_sincosTest_b_1_q);

    -- signOfSelectionSignal_uid117_sincosTest(LOGICAL,116)@1
    signOfSelectionSignal_uid117_sincosTest_q <= not (xMSB_uid115_sincosTest_b);

    -- signOfSelectionSignal_uid85_sincosTest(LOGICAL,84)@1
    signOfSelectionSignal_uid85_sincosTest_q <= not (xMSB_uid83_sincosTest_b);

    -- signOfSelectionSignal_uid53_sincosTest(LOGICAL,52)@0
    signOfSelectionSignal_uid53_sincosTest_q <= not (xMSB_uid51_sincosTest_b);

    -- cstOneOverK_uid22_sincosTest(CONSTANT,21)
    cstOneOverK_uid22_sincosTest_q <= "100110110111010011101101101010000100";

    -- xip1E_1_uid32_sincosTest(BITJOIN,31)@0
    xip1E_1_uid32_sincosTest_q <= STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q) & cstOneOverK_uid22_sincosTest_q;

    -- xip1_1_topRange_uid41_sincosTest(BITSELECT,40)@0
    xip1_1_topRange_uid41_sincosTest_in <= xip1E_1_uid32_sincosTest_q(37 downto 0);
    xip1_1_topRange_uid41_sincosTest_b <= xip1_1_topRange_uid41_sincosTest_in(37 downto 0);

    -- xip1_1_mergedSignalTM_uid42_sincosTest(BITJOIN,41)@0
    xip1_1_mergedSignalTM_uid42_sincosTest_q <= GND_q & xip1_1_topRange_uid41_sincosTest_b;

    -- twoToMiSiXip_uid56_sincosTest(BITSELECT,55)@0
    twoToMiSiXip_uid56_sincosTest_b <= STD_LOGIC_VECTOR(xip1_1_mergedSignalTM_uid42_sincosTest_q(38 downto 1));

    -- xMSB_uid44_sincosTest(BITSELECT,43)@0
    xMSB_uid44_sincosTest_b <= STD_LOGIC_VECTOR(yip1E_1sumAHighB_uid35_sincosTest_q(37 downto 37));

    -- yip1E_1CostZeroPaddingA_uid33_sincosTest(CONSTANT,32)
    yip1E_1CostZeroPaddingA_uid33_sincosTest_q <= "000000000000000000000000000000000000";

    -- yip1E_1NA_uid34_sincosTest(BITJOIN,33)@0
    yip1E_1NA_uid34_sincosTest_q <= GND_q & yip1E_1CostZeroPaddingA_uid33_sincosTest_q;

    -- yip1E_1sumAHighB_uid35_sincosTest(ADDSUB,34)@0
    yip1E_1sumAHighB_uid35_sincosTest_s <= VCC_q;
    yip1E_1sumAHighB_uid35_sincosTest_a <= STD_LOGIC_VECTOR("00" & yip1E_1NA_uid34_sincosTest_q);
    yip1E_1sumAHighB_uid35_sincosTest_b <= STD_LOGIC_VECTOR("000" & cstOneOverK_uid22_sincosTest_q);
    yip1E_1sumAHighB_uid35_sincosTest_combproc: PROCESS (yip1E_1sumAHighB_uid35_sincosTest_a, yip1E_1sumAHighB_uid35_sincosTest_b, yip1E_1sumAHighB_uid35_sincosTest_s)
    BEGIN
        IF (yip1E_1sumAHighB_uid35_sincosTest_s = "1") THEN
            yip1E_1sumAHighB_uid35_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_a) + UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_b));
        ELSE
            yip1E_1sumAHighB_uid35_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_a) - UNSIGNED(yip1E_1sumAHighB_uid35_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_1sumAHighB_uid35_sincosTest_q <= yip1E_1sumAHighB_uid35_sincosTest_o(37 downto 0);

    -- yip1_1_mergedSignalTM_uid48_sincosTest(BITJOIN,47)@0
    yip1_1_mergedSignalTM_uid48_sincosTest_q <= xMSB_uid44_sincosTest_b & yip1E_1sumAHighB_uid35_sincosTest_q;

    -- yip1E_2_uid61_sincosTest(ADDSUB,60)@0
    yip1E_2_uid61_sincosTest_s <= signOfSelectionSignal_uid53_sincosTest_q;
    yip1E_2_uid61_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_1_mergedSignalTM_uid48_sincosTest_q(38)) & yip1_1_mergedSignalTM_uid48_sincosTest_q));
    yip1E_2_uid61_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 38 => twoToMiSiXip_uid56_sincosTest_b(37)) & twoToMiSiXip_uid56_sincosTest_b));
    yip1E_2_uid61_sincosTest_combproc: PROCESS (yip1E_2_uid61_sincosTest_a, yip1E_2_uid61_sincosTest_b, yip1E_2_uid61_sincosTest_s)
    BEGIN
        IF (yip1E_2_uid61_sincosTest_s = "1") THEN
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) + SIGNED(yip1E_2_uid61_sincosTest_b));
        ELSE
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) - SIGNED(yip1E_2_uid61_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_2_uid61_sincosTest_q <= yip1E_2_uid61_sincosTest_o(39 downto 0);

    -- yip1_2_uid65_sincosTest(BITSELECT,64)@0
    yip1_2_uid65_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_2_uid61_sincosTest_q(38 downto 0));
    yip1_2_uid65_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid65_sincosTest_in(38 downto 0));

    -- twoToMiSiYip_uid73_sincosTest(BITSELECT,72)@0
    twoToMiSiYip_uid73_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid65_sincosTest_b(38 downto 2));

    -- twoToMiSiYip_uid57_sincosTest(BITSELECT,56)@0
    twoToMiSiYip_uid57_sincosTest_b <= STD_LOGIC_VECTOR(yip1_1_mergedSignalTM_uid48_sincosTest_q(38 downto 1));

    -- xip1E_2_uid60_sincosTest(ADDSUB,59)@0
    xip1E_2_uid60_sincosTest_s <= xMSB_uid51_sincosTest_b;
    xip1E_2_uid60_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_1_mergedSignalTM_uid42_sincosTest_q(38)) & xip1_1_mergedSignalTM_uid42_sincosTest_q));
    xip1E_2_uid60_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 38 => twoToMiSiYip_uid57_sincosTest_b(37)) & twoToMiSiYip_uid57_sincosTest_b));
    xip1E_2_uid60_sincosTest_combproc: PROCESS (xip1E_2_uid60_sincosTest_a, xip1E_2_uid60_sincosTest_b, xip1E_2_uid60_sincosTest_s)
    BEGIN
        IF (xip1E_2_uid60_sincosTest_s = "1") THEN
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) + SIGNED(xip1E_2_uid60_sincosTest_b));
        ELSE
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) - SIGNED(xip1E_2_uid60_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_2_uid60_sincosTest_q <= xip1E_2_uid60_sincosTest_o(39 downto 0);

    -- xip1_2_uid64_sincosTest(BITSELECT,63)@0
    xip1_2_uid64_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_2_uid60_sincosTest_q(38 downto 0));
    xip1_2_uid64_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid64_sincosTest_in(38 downto 0));

    -- xip1E_3_uid76_sincosTest(ADDSUB,75)@0
    xip1E_3_uid76_sincosTest_s <= xMSB_uid67_sincosTest_b;
    xip1E_3_uid76_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_2_uid64_sincosTest_b(38)) & xip1_2_uid64_sincosTest_b));
    xip1E_3_uid76_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 37 => twoToMiSiYip_uid73_sincosTest_b(36)) & twoToMiSiYip_uid73_sincosTest_b));
    xip1E_3_uid76_sincosTest_combproc: PROCESS (xip1E_3_uid76_sincosTest_a, xip1E_3_uid76_sincosTest_b, xip1E_3_uid76_sincosTest_s)
    BEGIN
        IF (xip1E_3_uid76_sincosTest_s = "1") THEN
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) + SIGNED(xip1E_3_uid76_sincosTest_b));
        ELSE
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) - SIGNED(xip1E_3_uid76_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_3_uid76_sincosTest_q <= xip1E_3_uid76_sincosTest_o(39 downto 0);

    -- xip1_3_uid80_sincosTest(BITSELECT,79)@0
    xip1_3_uid80_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_3_uid76_sincosTest_q(38 downto 0));
    xip1_3_uid80_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid80_sincosTest_in(38 downto 0));

    -- redist17_xip1_3_uid80_sincosTest_b_1(DELAY,392)
    redist17_xip1_3_uid80_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_3_uid80_sincosTest_b, xout => redist17_xip1_3_uid80_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid88_sincosTest(BITSELECT,87)@1
    twoToMiSiXip_uid88_sincosTest_b <= STD_LOGIC_VECTOR(redist17_xip1_3_uid80_sincosTest_b_1_q(38 downto 3));

    -- signOfSelectionSignal_uid69_sincosTest(LOGICAL,68)@0
    signOfSelectionSignal_uid69_sincosTest_q <= not (xMSB_uid67_sincosTest_b);

    -- twoToMiSiXip_uid72_sincosTest(BITSELECT,71)@0
    twoToMiSiXip_uid72_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid64_sincosTest_b(38 downto 2));

    -- yip1E_3_uid77_sincosTest(ADDSUB,76)@0
    yip1E_3_uid77_sincosTest_s <= signOfSelectionSignal_uid69_sincosTest_q;
    yip1E_3_uid77_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_2_uid65_sincosTest_b(38)) & yip1_2_uid65_sincosTest_b));
    yip1E_3_uid77_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 37 => twoToMiSiXip_uid72_sincosTest_b(36)) & twoToMiSiXip_uid72_sincosTest_b));
    yip1E_3_uid77_sincosTest_combproc: PROCESS (yip1E_3_uid77_sincosTest_a, yip1E_3_uid77_sincosTest_b, yip1E_3_uid77_sincosTest_s)
    BEGIN
        IF (yip1E_3_uid77_sincosTest_s = "1") THEN
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) + SIGNED(yip1E_3_uid77_sincosTest_b));
        ELSE
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) - SIGNED(yip1E_3_uid77_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_3_uid77_sincosTest_q <= yip1E_3_uid77_sincosTest_o(39 downto 0);

    -- yip1_3_uid81_sincosTest(BITSELECT,80)@0
    yip1_3_uid81_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_3_uid77_sincosTest_q(38 downto 0));
    yip1_3_uid81_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid81_sincosTest_in(38 downto 0));

    -- redist16_yip1_3_uid81_sincosTest_b_1(DELAY,391)
    redist16_yip1_3_uid81_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_3_uid81_sincosTest_b, xout => redist16_yip1_3_uid81_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_4_uid93_sincosTest(ADDSUB,92)@1
    yip1E_4_uid93_sincosTest_s <= signOfSelectionSignal_uid85_sincosTest_q;
    yip1E_4_uid93_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist16_yip1_3_uid81_sincosTest_b_1_q(38)) & redist16_yip1_3_uid81_sincosTest_b_1_q));
    yip1E_4_uid93_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 36 => twoToMiSiXip_uid88_sincosTest_b(35)) & twoToMiSiXip_uid88_sincosTest_b));
    yip1E_4_uid93_sincosTest_combproc: PROCESS (yip1E_4_uid93_sincosTest_a, yip1E_4_uid93_sincosTest_b, yip1E_4_uid93_sincosTest_s)
    BEGIN
        IF (yip1E_4_uid93_sincosTest_s = "1") THEN
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) + SIGNED(yip1E_4_uid93_sincosTest_b));
        ELSE
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) - SIGNED(yip1E_4_uid93_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_4_uid93_sincosTest_q <= yip1E_4_uid93_sincosTest_o(39 downto 0);

    -- yip1_4_uid97_sincosTest(BITSELECT,96)@1
    yip1_4_uid97_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_4_uid93_sincosTest_q(38 downto 0));
    yip1_4_uid97_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid97_sincosTest_in(38 downto 0));

    -- twoToMiSiYip_uid105_sincosTest(BITSELECT,104)@1
    twoToMiSiYip_uid105_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid97_sincosTest_b(38 downto 4));

    -- twoToMiSiYip_uid89_sincosTest(BITSELECT,88)@1
    twoToMiSiYip_uid89_sincosTest_b <= STD_LOGIC_VECTOR(redist16_yip1_3_uid81_sincosTest_b_1_q(38 downto 3));

    -- xip1E_4_uid92_sincosTest(ADDSUB,91)@1
    xip1E_4_uid92_sincosTest_s <= xMSB_uid83_sincosTest_b;
    xip1E_4_uid92_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist17_xip1_3_uid80_sincosTest_b_1_q(38)) & redist17_xip1_3_uid80_sincosTest_b_1_q));
    xip1E_4_uid92_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 36 => twoToMiSiYip_uid89_sincosTest_b(35)) & twoToMiSiYip_uid89_sincosTest_b));
    xip1E_4_uid92_sincosTest_combproc: PROCESS (xip1E_4_uid92_sincosTest_a, xip1E_4_uid92_sincosTest_b, xip1E_4_uid92_sincosTest_s)
    BEGIN
        IF (xip1E_4_uid92_sincosTest_s = "1") THEN
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) + SIGNED(xip1E_4_uid92_sincosTest_b));
        ELSE
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) - SIGNED(xip1E_4_uid92_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_4_uid92_sincosTest_q <= xip1E_4_uid92_sincosTest_o(39 downto 0);

    -- xip1_4_uid96_sincosTest(BITSELECT,95)@1
    xip1_4_uid96_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_4_uid92_sincosTest_q(38 downto 0));
    xip1_4_uid96_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid96_sincosTest_in(38 downto 0));

    -- xip1E_5_uid108_sincosTest(ADDSUB,107)@1
    xip1E_5_uid108_sincosTest_s <= xMSB_uid99_sincosTest_b;
    xip1E_5_uid108_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_4_uid96_sincosTest_b(38)) & xip1_4_uid96_sincosTest_b));
    xip1E_5_uid108_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 35 => twoToMiSiYip_uid105_sincosTest_b(34)) & twoToMiSiYip_uid105_sincosTest_b));
    xip1E_5_uid108_sincosTest_combproc: PROCESS (xip1E_5_uid108_sincosTest_a, xip1E_5_uid108_sincosTest_b, xip1E_5_uid108_sincosTest_s)
    BEGIN
        IF (xip1E_5_uid108_sincosTest_s = "1") THEN
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) + SIGNED(xip1E_5_uid108_sincosTest_b));
        ELSE
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) - SIGNED(xip1E_5_uid108_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_5_uid108_sincosTest_q <= xip1E_5_uid108_sincosTest_o(39 downto 0);

    -- xip1_5_uid112_sincosTest(BITSELECT,111)@1
    xip1_5_uid112_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_5_uid108_sincosTest_q(38 downto 0));
    xip1_5_uid112_sincosTest_b <= STD_LOGIC_VECTOR(xip1_5_uid112_sincosTest_in(38 downto 0));

    -- twoToMiSiXip_uid120_sincosTest(BITSELECT,119)@1
    twoToMiSiXip_uid120_sincosTest_b <= STD_LOGIC_VECTOR(xip1_5_uid112_sincosTest_b(38 downto 5));

    -- signOfSelectionSignal_uid101_sincosTest(LOGICAL,100)@1
    signOfSelectionSignal_uid101_sincosTest_q <= not (xMSB_uid99_sincosTest_b);

    -- twoToMiSiXip_uid104_sincosTest(BITSELECT,103)@1
    twoToMiSiXip_uid104_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid96_sincosTest_b(38 downto 4));

    -- yip1E_5_uid109_sincosTest(ADDSUB,108)@1
    yip1E_5_uid109_sincosTest_s <= signOfSelectionSignal_uid101_sincosTest_q;
    yip1E_5_uid109_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_4_uid97_sincosTest_b(38)) & yip1_4_uid97_sincosTest_b));
    yip1E_5_uid109_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 35 => twoToMiSiXip_uid104_sincosTest_b(34)) & twoToMiSiXip_uid104_sincosTest_b));
    yip1E_5_uid109_sincosTest_combproc: PROCESS (yip1E_5_uid109_sincosTest_a, yip1E_5_uid109_sincosTest_b, yip1E_5_uid109_sincosTest_s)
    BEGIN
        IF (yip1E_5_uid109_sincosTest_s = "1") THEN
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) + SIGNED(yip1E_5_uid109_sincosTest_b));
        ELSE
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) - SIGNED(yip1E_5_uid109_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_5_uid109_sincosTest_q <= yip1E_5_uid109_sincosTest_o(39 downto 0);

    -- yip1_5_uid113_sincosTest(BITSELECT,112)@1
    yip1_5_uid113_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_5_uid109_sincosTest_q(38 downto 0));
    yip1_5_uid113_sincosTest_b <= STD_LOGIC_VECTOR(yip1_5_uid113_sincosTest_in(38 downto 0));

    -- yip1E_6_uid125_sincosTest(ADDSUB,124)@1
    yip1E_6_uid125_sincosTest_s <= signOfSelectionSignal_uid117_sincosTest_q;
    yip1E_6_uid125_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_5_uid113_sincosTest_b(38)) & yip1_5_uid113_sincosTest_b));
    yip1E_6_uid125_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 34 => twoToMiSiXip_uid120_sincosTest_b(33)) & twoToMiSiXip_uid120_sincosTest_b));
    yip1E_6_uid125_sincosTest_combproc: PROCESS (yip1E_6_uid125_sincosTest_a, yip1E_6_uid125_sincosTest_b, yip1E_6_uid125_sincosTest_s)
    BEGIN
        IF (yip1E_6_uid125_sincosTest_s = "1") THEN
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) + SIGNED(yip1E_6_uid125_sincosTest_b));
        ELSE
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) - SIGNED(yip1E_6_uid125_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_6_uid125_sincosTest_q <= yip1E_6_uid125_sincosTest_o(39 downto 0);

    -- yip1_6_uid129_sincosTest(BITSELECT,128)@1
    yip1_6_uid129_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_6_uid125_sincosTest_q(38 downto 0));
    yip1_6_uid129_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid129_sincosTest_in(38 downto 0));

    -- twoToMiSiYip_uid137_sincosTest(BITSELECT,136)@1
    twoToMiSiYip_uid137_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid129_sincosTest_b(38 downto 6));

    -- twoToMiSiYip_uid121_sincosTest(BITSELECT,120)@1
    twoToMiSiYip_uid121_sincosTest_b <= STD_LOGIC_VECTOR(yip1_5_uid113_sincosTest_b(38 downto 5));

    -- xip1E_6_uid124_sincosTest(ADDSUB,123)@1
    xip1E_6_uid124_sincosTest_s <= xMSB_uid115_sincosTest_b;
    xip1E_6_uid124_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_5_uid112_sincosTest_b(38)) & xip1_5_uid112_sincosTest_b));
    xip1E_6_uid124_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 34 => twoToMiSiYip_uid121_sincosTest_b(33)) & twoToMiSiYip_uid121_sincosTest_b));
    xip1E_6_uid124_sincosTest_combproc: PROCESS (xip1E_6_uid124_sincosTest_a, xip1E_6_uid124_sincosTest_b, xip1E_6_uid124_sincosTest_s)
    BEGIN
        IF (xip1E_6_uid124_sincosTest_s = "1") THEN
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) + SIGNED(xip1E_6_uid124_sincosTest_b));
        ELSE
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) - SIGNED(xip1E_6_uid124_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_6_uid124_sincosTest_q <= xip1E_6_uid124_sincosTest_o(39 downto 0);

    -- xip1_6_uid128_sincosTest(BITSELECT,127)@1
    xip1_6_uid128_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_6_uid124_sincosTest_q(38 downto 0));
    xip1_6_uid128_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid128_sincosTest_in(38 downto 0));

    -- xip1E_7_uid140_sincosTest(ADDSUB,139)@1
    xip1E_7_uid140_sincosTest_s <= xMSB_uid131_sincosTest_b;
    xip1E_7_uid140_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_6_uid128_sincosTest_b(38)) & xip1_6_uid128_sincosTest_b));
    xip1E_7_uid140_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 33 => twoToMiSiYip_uid137_sincosTest_b(32)) & twoToMiSiYip_uid137_sincosTest_b));
    xip1E_7_uid140_sincosTest_combproc: PROCESS (xip1E_7_uid140_sincosTest_a, xip1E_7_uid140_sincosTest_b, xip1E_7_uid140_sincosTest_s)
    BEGIN
        IF (xip1E_7_uid140_sincosTest_s = "1") THEN
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) + SIGNED(xip1E_7_uid140_sincosTest_b));
        ELSE
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) - SIGNED(xip1E_7_uid140_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid140_sincosTest_q <= xip1E_7_uid140_sincosTest_o(39 downto 0);

    -- xip1_7_uid144_sincosTest(BITSELECT,143)@1
    xip1_7_uid144_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_7_uid140_sincosTest_q(38 downto 0));
    xip1_7_uid144_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid144_sincosTest_in(38 downto 0));

    -- redist14_xip1_7_uid144_sincosTest_b_1(DELAY,389)
    redist14_xip1_7_uid144_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_7_uid144_sincosTest_b, xout => redist14_xip1_7_uid144_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid152_sincosTest(BITSELECT,151)@2
    twoToMiSiXip_uid152_sincosTest_b <= STD_LOGIC_VECTOR(redist14_xip1_7_uid144_sincosTest_b_1_q(38 downto 7));

    -- signOfSelectionSignal_uid133_sincosTest(LOGICAL,132)@1
    signOfSelectionSignal_uid133_sincosTest_q <= not (xMSB_uid131_sincosTest_b);

    -- twoToMiSiXip_uid136_sincosTest(BITSELECT,135)@1
    twoToMiSiXip_uid136_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid128_sincosTest_b(38 downto 6));

    -- yip1E_7_uid141_sincosTest(ADDSUB,140)@1
    yip1E_7_uid141_sincosTest_s <= signOfSelectionSignal_uid133_sincosTest_q;
    yip1E_7_uid141_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_6_uid129_sincosTest_b(38)) & yip1_6_uid129_sincosTest_b));
    yip1E_7_uid141_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 33 => twoToMiSiXip_uid136_sincosTest_b(32)) & twoToMiSiXip_uid136_sincosTest_b));
    yip1E_7_uid141_sincosTest_combproc: PROCESS (yip1E_7_uid141_sincosTest_a, yip1E_7_uid141_sincosTest_b, yip1E_7_uid141_sincosTest_s)
    BEGIN
        IF (yip1E_7_uid141_sincosTest_s = "1") THEN
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) + SIGNED(yip1E_7_uid141_sincosTest_b));
        ELSE
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) - SIGNED(yip1E_7_uid141_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid141_sincosTest_q <= yip1E_7_uid141_sincosTest_o(39 downto 0);

    -- yip1_7_uid145_sincosTest(BITSELECT,144)@1
    yip1_7_uid145_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid141_sincosTest_q(38 downto 0));
    yip1_7_uid145_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid145_sincosTest_in(38 downto 0));

    -- redist13_yip1_7_uid145_sincosTest_b_1(DELAY,388)
    redist13_yip1_7_uid145_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_7_uid145_sincosTest_b, xout => redist13_yip1_7_uid145_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_8_uid157_sincosTest(ADDSUB,156)@2
    yip1E_8_uid157_sincosTest_s <= signOfSelectionSignal_uid149_sincosTest_q;
    yip1E_8_uid157_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist13_yip1_7_uid145_sincosTest_b_1_q(38)) & redist13_yip1_7_uid145_sincosTest_b_1_q));
    yip1E_8_uid157_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 32 => twoToMiSiXip_uid152_sincosTest_b(31)) & twoToMiSiXip_uid152_sincosTest_b));
    yip1E_8_uid157_sincosTest_combproc: PROCESS (yip1E_8_uid157_sincosTest_a, yip1E_8_uid157_sincosTest_b, yip1E_8_uid157_sincosTest_s)
    BEGIN
        IF (yip1E_8_uid157_sincosTest_s = "1") THEN
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) + SIGNED(yip1E_8_uid157_sincosTest_b));
        ELSE
            yip1E_8_uid157_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid157_sincosTest_a) - SIGNED(yip1E_8_uid157_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid157_sincosTest_q <= yip1E_8_uid157_sincosTest_o(39 downto 0);

    -- yip1_8_uid161_sincosTest(BITSELECT,160)@2
    yip1_8_uid161_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid157_sincosTest_q(38 downto 0));
    yip1_8_uid161_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid161_sincosTest_in(38 downto 0));

    -- twoToMiSiYip_uid169_sincosTest(BITSELECT,168)@2
    twoToMiSiYip_uid169_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid161_sincosTest_b(38 downto 8));

    -- twoToMiSiYip_uid153_sincosTest(BITSELECT,152)@2
    twoToMiSiYip_uid153_sincosTest_b <= STD_LOGIC_VECTOR(redist13_yip1_7_uid145_sincosTest_b_1_q(38 downto 7));

    -- xip1E_8_uid156_sincosTest(ADDSUB,155)@2
    xip1E_8_uid156_sincosTest_s <= redist12_xMSB_uid147_sincosTest_b_1_q;
    xip1E_8_uid156_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist14_xip1_7_uid144_sincosTest_b_1_q(38)) & redist14_xip1_7_uid144_sincosTest_b_1_q));
    xip1E_8_uid156_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 32 => twoToMiSiYip_uid153_sincosTest_b(31)) & twoToMiSiYip_uid153_sincosTest_b));
    xip1E_8_uid156_sincosTest_combproc: PROCESS (xip1E_8_uid156_sincosTest_a, xip1E_8_uid156_sincosTest_b, xip1E_8_uid156_sincosTest_s)
    BEGIN
        IF (xip1E_8_uid156_sincosTest_s = "1") THEN
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) + SIGNED(xip1E_8_uid156_sincosTest_b));
        ELSE
            xip1E_8_uid156_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid156_sincosTest_a) - SIGNED(xip1E_8_uid156_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid156_sincosTest_q <= xip1E_8_uid156_sincosTest_o(39 downto 0);

    -- xip1_8_uid160_sincosTest(BITSELECT,159)@2
    xip1_8_uid160_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_8_uid156_sincosTest_q(38 downto 0));
    xip1_8_uid160_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid160_sincosTest_in(38 downto 0));

    -- xip1E_9_uid172_sincosTest(ADDSUB,171)@2
    xip1E_9_uid172_sincosTest_s <= xMSB_uid163_sincosTest_b;
    xip1E_9_uid172_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_8_uid160_sincosTest_b(38)) & xip1_8_uid160_sincosTest_b));
    xip1E_9_uid172_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 31 => twoToMiSiYip_uid169_sincosTest_b(30)) & twoToMiSiYip_uid169_sincosTest_b));
    xip1E_9_uid172_sincosTest_combproc: PROCESS (xip1E_9_uid172_sincosTest_a, xip1E_9_uid172_sincosTest_b, xip1E_9_uid172_sincosTest_s)
    BEGIN
        IF (xip1E_9_uid172_sincosTest_s = "1") THEN
            xip1E_9_uid172_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid172_sincosTest_a) + SIGNED(xip1E_9_uid172_sincosTest_b));
        ELSE
            xip1E_9_uid172_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid172_sincosTest_a) - SIGNED(xip1E_9_uid172_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid172_sincosTest_q <= xip1E_9_uid172_sincosTest_o(39 downto 0);

    -- xip1_9_uid176_sincosTest(BITSELECT,175)@2
    xip1_9_uid176_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_9_uid172_sincosTest_q(38 downto 0));
    xip1_9_uid176_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid176_sincosTest_in(38 downto 0));

    -- twoToMiSiXip_uid184_sincosTest(BITSELECT,183)@2
    twoToMiSiXip_uid184_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid176_sincosTest_b(38 downto 9));

    -- signOfSelectionSignal_uid165_sincosTest(LOGICAL,164)@2
    signOfSelectionSignal_uid165_sincosTest_q <= not (xMSB_uid163_sincosTest_b);

    -- twoToMiSiXip_uid168_sincosTest(BITSELECT,167)@2
    twoToMiSiXip_uid168_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid160_sincosTest_b(38 downto 8));

    -- yip1E_9_uid173_sincosTest(ADDSUB,172)@2
    yip1E_9_uid173_sincosTest_s <= signOfSelectionSignal_uid165_sincosTest_q;
    yip1E_9_uid173_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_8_uid161_sincosTest_b(38)) & yip1_8_uid161_sincosTest_b));
    yip1E_9_uid173_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 31 => twoToMiSiXip_uid168_sincosTest_b(30)) & twoToMiSiXip_uid168_sincosTest_b));
    yip1E_9_uid173_sincosTest_combproc: PROCESS (yip1E_9_uid173_sincosTest_a, yip1E_9_uid173_sincosTest_b, yip1E_9_uid173_sincosTest_s)
    BEGIN
        IF (yip1E_9_uid173_sincosTest_s = "1") THEN
            yip1E_9_uid173_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid173_sincosTest_a) + SIGNED(yip1E_9_uid173_sincosTest_b));
        ELSE
            yip1E_9_uid173_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid173_sincosTest_a) - SIGNED(yip1E_9_uid173_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid173_sincosTest_q <= yip1E_9_uid173_sincosTest_o(39 downto 0);

    -- yip1_9_uid177_sincosTest(BITSELECT,176)@2
    yip1_9_uid177_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid173_sincosTest_q(38 downto 0));
    yip1_9_uid177_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid177_sincosTest_in(38 downto 0));

    -- yip1E_10_uid189_sincosTest(ADDSUB,188)@2
    yip1E_10_uid189_sincosTest_s <= signOfSelectionSignal_uid181_sincosTest_q;
    yip1E_10_uid189_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_9_uid177_sincosTest_b(38)) & yip1_9_uid177_sincosTest_b));
    yip1E_10_uid189_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 30 => twoToMiSiXip_uid184_sincosTest_b(29)) & twoToMiSiXip_uid184_sincosTest_b));
    yip1E_10_uid189_sincosTest_combproc: PROCESS (yip1E_10_uid189_sincosTest_a, yip1E_10_uid189_sincosTest_b, yip1E_10_uid189_sincosTest_s)
    BEGIN
        IF (yip1E_10_uid189_sincosTest_s = "1") THEN
            yip1E_10_uid189_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid189_sincosTest_a) + SIGNED(yip1E_10_uid189_sincosTest_b));
        ELSE
            yip1E_10_uid189_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid189_sincosTest_a) - SIGNED(yip1E_10_uid189_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid189_sincosTest_q <= yip1E_10_uid189_sincosTest_o(39 downto 0);

    -- yip1_10_uid196_sincosTest(BITSELECT,195)@2
    yip1_10_uid196_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid189_sincosTest_q(38 downto 0));
    yip1_10_uid196_sincosTest_b <= STD_LOGIC_VECTOR(yip1_10_uid196_sincosTest_in(38 downto 0));

    -- twoToMiSiYip_uid204_sincosTest(BITSELECT,203)@2
    twoToMiSiYip_uid204_sincosTest_b <= STD_LOGIC_VECTOR(yip1_10_uid196_sincosTest_b(38 downto 10));

    -- twoToMiSiYip_uid185_sincosTest(BITSELECT,184)@2
    twoToMiSiYip_uid185_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid177_sincosTest_b(38 downto 9));

    -- xip1E_10_uid188_sincosTest(ADDSUB,187)@2
    xip1E_10_uid188_sincosTest_s <= xMSB_uid179_sincosTest_b;
    xip1E_10_uid188_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_9_uid176_sincosTest_b(38)) & xip1_9_uid176_sincosTest_b));
    xip1E_10_uid188_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 30 => twoToMiSiYip_uid185_sincosTest_b(29)) & twoToMiSiYip_uid185_sincosTest_b));
    xip1E_10_uid188_sincosTest_combproc: PROCESS (xip1E_10_uid188_sincosTest_a, xip1E_10_uid188_sincosTest_b, xip1E_10_uid188_sincosTest_s)
    BEGIN
        IF (xip1E_10_uid188_sincosTest_s = "1") THEN
            xip1E_10_uid188_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid188_sincosTest_a) + SIGNED(xip1E_10_uid188_sincosTest_b));
        ELSE
            xip1E_10_uid188_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid188_sincosTest_a) - SIGNED(xip1E_10_uid188_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid188_sincosTest_q <= xip1E_10_uid188_sincosTest_o(39 downto 0);

    -- xip1_10_uid195_sincosTest(BITSELECT,194)@2
    xip1_10_uid195_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_10_uid188_sincosTest_q(38 downto 0));
    xip1_10_uid195_sincosTest_b <= STD_LOGIC_VECTOR(xip1_10_uid195_sincosTest_in(38 downto 0));

    -- xip1E_11_uid207_sincosTest(ADDSUB,206)@2
    xip1E_11_uid207_sincosTest_s <= xMSB_uid198_sincosTest_b;
    xip1E_11_uid207_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_10_uid195_sincosTest_b(38)) & xip1_10_uid195_sincosTest_b));
    xip1E_11_uid207_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 29 => twoToMiSiYip_uid204_sincosTest_b(28)) & twoToMiSiYip_uid204_sincosTest_b));
    xip1E_11_uid207_sincosTest_combproc: PROCESS (xip1E_11_uid207_sincosTest_a, xip1E_11_uid207_sincosTest_b, xip1E_11_uid207_sincosTest_s)
    BEGIN
        IF (xip1E_11_uid207_sincosTest_s = "1") THEN
            xip1E_11_uid207_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid207_sincosTest_a) + SIGNED(xip1E_11_uid207_sincosTest_b));
        ELSE
            xip1E_11_uid207_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_11_uid207_sincosTest_a) - SIGNED(xip1E_11_uid207_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_11_uid207_sincosTest_q <= xip1E_11_uid207_sincosTest_o(39 downto 0);

    -- xip1_11_uid214_sincosTest(BITSELECT,213)@2
    xip1_11_uid214_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_11_uid207_sincosTest_q(38 downto 0));
    xip1_11_uid214_sincosTest_b <= STD_LOGIC_VECTOR(xip1_11_uid214_sincosTest_in(38 downto 0));

    -- redist10_xip1_11_uid214_sincosTest_b_1(DELAY,385)
    redist10_xip1_11_uid214_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_11_uid214_sincosTest_b, xout => redist10_xip1_11_uid214_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid222_sincosTest(BITSELECT,221)@3
    twoToMiSiXip_uid222_sincosTest_b <= STD_LOGIC_VECTOR(redist10_xip1_11_uid214_sincosTest_b_1_q(38 downto 11));

    -- signOfSelectionSignal_uid200_sincosTest(LOGICAL,199)@2
    signOfSelectionSignal_uid200_sincosTest_q <= not (xMSB_uid198_sincosTest_b);

    -- twoToMiSiXip_uid203_sincosTest(BITSELECT,202)@2
    twoToMiSiXip_uid203_sincosTest_b <= STD_LOGIC_VECTOR(xip1_10_uid195_sincosTest_b(38 downto 10));

    -- yip1E_11_uid208_sincosTest(ADDSUB,207)@2
    yip1E_11_uid208_sincosTest_s <= signOfSelectionSignal_uid200_sincosTest_q;
    yip1E_11_uid208_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_10_uid196_sincosTest_b(38)) & yip1_10_uid196_sincosTest_b));
    yip1E_11_uid208_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 29 => twoToMiSiXip_uid203_sincosTest_b(28)) & twoToMiSiXip_uid203_sincosTest_b));
    yip1E_11_uid208_sincosTest_combproc: PROCESS (yip1E_11_uid208_sincosTest_a, yip1E_11_uid208_sincosTest_b, yip1E_11_uid208_sincosTest_s)
    BEGIN
        IF (yip1E_11_uid208_sincosTest_s = "1") THEN
            yip1E_11_uid208_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid208_sincosTest_a) + SIGNED(yip1E_11_uid208_sincosTest_b));
        ELSE
            yip1E_11_uid208_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_11_uid208_sincosTest_a) - SIGNED(yip1E_11_uid208_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_11_uid208_sincosTest_q <= yip1E_11_uid208_sincosTest_o(39 downto 0);

    -- yip1_11_uid215_sincosTest(BITSELECT,214)@2
    yip1_11_uid215_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_11_uid208_sincosTest_q(38 downto 0));
    yip1_11_uid215_sincosTest_b <= STD_LOGIC_VECTOR(yip1_11_uid215_sincosTest_in(38 downto 0));

    -- redist9_yip1_11_uid215_sincosTest_b_1(DELAY,384)
    redist9_yip1_11_uid215_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_11_uid215_sincosTest_b, xout => redist9_yip1_11_uid215_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_12_uid227_sincosTest(ADDSUB,226)@3
    yip1E_12_uid227_sincosTest_s <= signOfSelectionSignal_uid219_sincosTest_q;
    yip1E_12_uid227_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist9_yip1_11_uid215_sincosTest_b_1_q(38)) & redist9_yip1_11_uid215_sincosTest_b_1_q));
    yip1E_12_uid227_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 28 => twoToMiSiXip_uid222_sincosTest_b(27)) & twoToMiSiXip_uid222_sincosTest_b));
    yip1E_12_uid227_sincosTest_combproc: PROCESS (yip1E_12_uid227_sincosTest_a, yip1E_12_uid227_sincosTest_b, yip1E_12_uid227_sincosTest_s)
    BEGIN
        IF (yip1E_12_uid227_sincosTest_s = "1") THEN
            yip1E_12_uid227_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid227_sincosTest_a) + SIGNED(yip1E_12_uid227_sincosTest_b));
        ELSE
            yip1E_12_uid227_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_12_uid227_sincosTest_a) - SIGNED(yip1E_12_uid227_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_12_uid227_sincosTest_q <= yip1E_12_uid227_sincosTest_o(39 downto 0);

    -- yip1_12_uid234_sincosTest(BITSELECT,233)@3
    yip1_12_uid234_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_12_uid227_sincosTest_q(38 downto 0));
    yip1_12_uid234_sincosTest_b <= STD_LOGIC_VECTOR(yip1_12_uid234_sincosTest_in(38 downto 0));

    -- twoToMiSiYip_uid242_sincosTest(BITSELECT,241)@3
    twoToMiSiYip_uid242_sincosTest_b <= STD_LOGIC_VECTOR(yip1_12_uid234_sincosTest_b(38 downto 12));

    -- twoToMiSiYip_uid223_sincosTest(BITSELECT,222)@3
    twoToMiSiYip_uid223_sincosTest_b <= STD_LOGIC_VECTOR(redist9_yip1_11_uid215_sincosTest_b_1_q(38 downto 11));

    -- xip1E_12_uid226_sincosTest(ADDSUB,225)@3
    xip1E_12_uid226_sincosTest_s <= redist8_xMSB_uid217_sincosTest_b_1_q;
    xip1E_12_uid226_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist10_xip1_11_uid214_sincosTest_b_1_q(38)) & redist10_xip1_11_uid214_sincosTest_b_1_q));
    xip1E_12_uid226_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 28 => twoToMiSiYip_uid223_sincosTest_b(27)) & twoToMiSiYip_uid223_sincosTest_b));
    xip1E_12_uid226_sincosTest_combproc: PROCESS (xip1E_12_uid226_sincosTest_a, xip1E_12_uid226_sincosTest_b, xip1E_12_uid226_sincosTest_s)
    BEGIN
        IF (xip1E_12_uid226_sincosTest_s = "1") THEN
            xip1E_12_uid226_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid226_sincosTest_a) + SIGNED(xip1E_12_uid226_sincosTest_b));
        ELSE
            xip1E_12_uid226_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_12_uid226_sincosTest_a) - SIGNED(xip1E_12_uid226_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_12_uid226_sincosTest_q <= xip1E_12_uid226_sincosTest_o(39 downto 0);

    -- xip1_12_uid233_sincosTest(BITSELECT,232)@3
    xip1_12_uid233_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_12_uid226_sincosTest_q(38 downto 0));
    xip1_12_uid233_sincosTest_b <= STD_LOGIC_VECTOR(xip1_12_uid233_sincosTest_in(38 downto 0));

    -- xip1E_13_uid245_sincosTest(ADDSUB,244)@3
    xip1E_13_uid245_sincosTest_s <= redist7_xMSB_uid236_sincosTest_b_1_q;
    xip1E_13_uid245_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_12_uid233_sincosTest_b(38)) & xip1_12_uid233_sincosTest_b));
    xip1E_13_uid245_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 27 => twoToMiSiYip_uid242_sincosTest_b(26)) & twoToMiSiYip_uid242_sincosTest_b));
    xip1E_13_uid245_sincosTest_combproc: PROCESS (xip1E_13_uid245_sincosTest_a, xip1E_13_uid245_sincosTest_b, xip1E_13_uid245_sincosTest_s)
    BEGIN
        IF (xip1E_13_uid245_sincosTest_s = "1") THEN
            xip1E_13_uid245_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid245_sincosTest_a) + SIGNED(xip1E_13_uid245_sincosTest_b));
        ELSE
            xip1E_13_uid245_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_13_uid245_sincosTest_a) - SIGNED(xip1E_13_uid245_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_13_uid245_sincosTest_q <= xip1E_13_uid245_sincosTest_o(39 downto 0);

    -- xip1_13_uid252_sincosTest(BITSELECT,251)@3
    xip1_13_uid252_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_13_uid245_sincosTest_q(38 downto 0));
    xip1_13_uid252_sincosTest_b <= STD_LOGIC_VECTOR(xip1_13_uid252_sincosTest_in(38 downto 0));

    -- twoToMiSiXip_uid260_sincosTest(BITSELECT,259)@3
    twoToMiSiXip_uid260_sincosTest_b <= STD_LOGIC_VECTOR(xip1_13_uid252_sincosTest_b(38 downto 13));

    -- signOfSelectionSignal_uid238_sincosTest(LOGICAL,237)@3
    signOfSelectionSignal_uid238_sincosTest_q <= not (redist7_xMSB_uid236_sincosTest_b_1_q);

    -- twoToMiSiXip_uid241_sincosTest(BITSELECT,240)@3
    twoToMiSiXip_uid241_sincosTest_b <= STD_LOGIC_VECTOR(xip1_12_uid233_sincosTest_b(38 downto 12));

    -- yip1E_13_uid246_sincosTest(ADDSUB,245)@3
    yip1E_13_uid246_sincosTest_s <= signOfSelectionSignal_uid238_sincosTest_q;
    yip1E_13_uid246_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_12_uid234_sincosTest_b(38)) & yip1_12_uid234_sincosTest_b));
    yip1E_13_uid246_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 27 => twoToMiSiXip_uid241_sincosTest_b(26)) & twoToMiSiXip_uid241_sincosTest_b));
    yip1E_13_uid246_sincosTest_combproc: PROCESS (yip1E_13_uid246_sincosTest_a, yip1E_13_uid246_sincosTest_b, yip1E_13_uid246_sincosTest_s)
    BEGIN
        IF (yip1E_13_uid246_sincosTest_s = "1") THEN
            yip1E_13_uid246_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid246_sincosTest_a) + SIGNED(yip1E_13_uid246_sincosTest_b));
        ELSE
            yip1E_13_uid246_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_13_uid246_sincosTest_a) - SIGNED(yip1E_13_uid246_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_13_uid246_sincosTest_q <= yip1E_13_uid246_sincosTest_o(39 downto 0);

    -- yip1_13_uid253_sincosTest(BITSELECT,252)@3
    yip1_13_uid253_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_13_uid246_sincosTest_q(38 downto 0));
    yip1_13_uid253_sincosTest_b <= STD_LOGIC_VECTOR(yip1_13_uid253_sincosTest_in(38 downto 0));

    -- yip1E_14_uid265_sincosTest(ADDSUB,264)@3
    yip1E_14_uid265_sincosTest_s <= signOfSelectionSignal_uid257_sincosTest_q;
    yip1E_14_uid265_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_13_uid253_sincosTest_b(38)) & yip1_13_uid253_sincosTest_b));
    yip1E_14_uid265_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 26 => twoToMiSiXip_uid260_sincosTest_b(25)) & twoToMiSiXip_uid260_sincosTest_b));
    yip1E_14_uid265_sincosTest_combproc: PROCESS (yip1E_14_uid265_sincosTest_a, yip1E_14_uid265_sincosTest_b, yip1E_14_uid265_sincosTest_s)
    BEGIN
        IF (yip1E_14_uid265_sincosTest_s = "1") THEN
            yip1E_14_uid265_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid265_sincosTest_a) + SIGNED(yip1E_14_uid265_sincosTest_b));
        ELSE
            yip1E_14_uid265_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_14_uid265_sincosTest_a) - SIGNED(yip1E_14_uid265_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_14_uid265_sincosTest_q <= yip1E_14_uid265_sincosTest_o(39 downto 0);

    -- yip1_14_uid272_sincosTest(BITSELECT,271)@3
    yip1_14_uid272_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_14_uid265_sincosTest_q(38 downto 0));
    yip1_14_uid272_sincosTest_b <= STD_LOGIC_VECTOR(yip1_14_uid272_sincosTest_in(38 downto 0));

    -- twoToMiSiYip_uid280_sincosTest(BITSELECT,279)@3
    twoToMiSiYip_uid280_sincosTest_b <= STD_LOGIC_VECTOR(yip1_14_uid272_sincosTest_b(38 downto 14));

    -- twoToMiSiYip_uid261_sincosTest(BITSELECT,260)@3
    twoToMiSiYip_uid261_sincosTest_b <= STD_LOGIC_VECTOR(yip1_13_uid253_sincosTest_b(38 downto 13));

    -- xip1E_14_uid264_sincosTest(ADDSUB,263)@3
    xip1E_14_uid264_sincosTest_s <= redist6_xMSB_uid255_sincosTest_b_1_q;
    xip1E_14_uid264_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_13_uid252_sincosTest_b(38)) & xip1_13_uid252_sincosTest_b));
    xip1E_14_uid264_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 26 => twoToMiSiYip_uid261_sincosTest_b(25)) & twoToMiSiYip_uid261_sincosTest_b));
    xip1E_14_uid264_sincosTest_combproc: PROCESS (xip1E_14_uid264_sincosTest_a, xip1E_14_uid264_sincosTest_b, xip1E_14_uid264_sincosTest_s)
    BEGIN
        IF (xip1E_14_uid264_sincosTest_s = "1") THEN
            xip1E_14_uid264_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid264_sincosTest_a) + SIGNED(xip1E_14_uid264_sincosTest_b));
        ELSE
            xip1E_14_uid264_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_14_uid264_sincosTest_a) - SIGNED(xip1E_14_uid264_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_14_uid264_sincosTest_q <= xip1E_14_uid264_sincosTest_o(39 downto 0);

    -- xip1_14_uid271_sincosTest(BITSELECT,270)@3
    xip1_14_uid271_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_14_uid264_sincosTest_q(38 downto 0));
    xip1_14_uid271_sincosTest_b <= STD_LOGIC_VECTOR(xip1_14_uid271_sincosTest_in(38 downto 0));

    -- xip1E_15_uid283_sincosTest(ADDSUB,282)@3
    xip1E_15_uid283_sincosTest_s <= xMSB_uid274_sincosTest_b;
    xip1E_15_uid283_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_14_uid271_sincosTest_b(38)) & xip1_14_uid271_sincosTest_b));
    xip1E_15_uid283_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 25 => twoToMiSiYip_uid280_sincosTest_b(24)) & twoToMiSiYip_uid280_sincosTest_b));
    xip1E_15_uid283_sincosTest_combproc: PROCESS (xip1E_15_uid283_sincosTest_a, xip1E_15_uid283_sincosTest_b, xip1E_15_uid283_sincosTest_s)
    BEGIN
        IF (xip1E_15_uid283_sincosTest_s = "1") THEN
            xip1E_15_uid283_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid283_sincosTest_a) + SIGNED(xip1E_15_uid283_sincosTest_b));
        ELSE
            xip1E_15_uid283_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_15_uid283_sincosTest_a) - SIGNED(xip1E_15_uid283_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_15_uid283_sincosTest_q <= xip1E_15_uid283_sincosTest_o(39 downto 0);

    -- xip1_15_uid290_sincosTest(BITSELECT,289)@3
    xip1_15_uid290_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_15_uid283_sincosTest_q(38 downto 0));
    xip1_15_uid290_sincosTest_b <= STD_LOGIC_VECTOR(xip1_15_uid290_sincosTest_in(38 downto 0));

    -- redist4_xip1_15_uid290_sincosTest_b_1(DELAY,379)
    redist4_xip1_15_uid290_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_15_uid290_sincosTest_b, xout => redist4_xip1_15_uid290_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid298_sincosTest(BITSELECT,297)@4
    twoToMiSiXip_uid298_sincosTest_b <= STD_LOGIC_VECTOR(redist4_xip1_15_uid290_sincosTest_b_1_q(38 downto 15));

    -- signOfSelectionSignal_uid276_sincosTest(LOGICAL,275)@3
    signOfSelectionSignal_uid276_sincosTest_q <= not (xMSB_uid274_sincosTest_b);

    -- twoToMiSiXip_uid279_sincosTest(BITSELECT,278)@3
    twoToMiSiXip_uid279_sincosTest_b <= STD_LOGIC_VECTOR(xip1_14_uid271_sincosTest_b(38 downto 14));

    -- yip1E_15_uid284_sincosTest(ADDSUB,283)@3
    yip1E_15_uid284_sincosTest_s <= signOfSelectionSignal_uid276_sincosTest_q;
    yip1E_15_uid284_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_14_uid272_sincosTest_b(38)) & yip1_14_uid272_sincosTest_b));
    yip1E_15_uid284_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 25 => twoToMiSiXip_uid279_sincosTest_b(24)) & twoToMiSiXip_uid279_sincosTest_b));
    yip1E_15_uid284_sincosTest_combproc: PROCESS (yip1E_15_uid284_sincosTest_a, yip1E_15_uid284_sincosTest_b, yip1E_15_uid284_sincosTest_s)
    BEGIN
        IF (yip1E_15_uid284_sincosTest_s = "1") THEN
            yip1E_15_uid284_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid284_sincosTest_a) + SIGNED(yip1E_15_uid284_sincosTest_b));
        ELSE
            yip1E_15_uid284_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_15_uid284_sincosTest_a) - SIGNED(yip1E_15_uid284_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_15_uid284_sincosTest_q <= yip1E_15_uid284_sincosTest_o(39 downto 0);

    -- yip1_15_uid291_sincosTest(BITSELECT,290)@3
    yip1_15_uid291_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_15_uid284_sincosTest_q(38 downto 0));
    yip1_15_uid291_sincosTest_b <= STD_LOGIC_VECTOR(yip1_15_uid291_sincosTest_in(38 downto 0));

    -- redist3_yip1_15_uid291_sincosTest_b_1(DELAY,378)
    redist3_yip1_15_uid291_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 39, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_15_uid291_sincosTest_b, xout => redist3_yip1_15_uid291_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_16_uid303_sincosTest(ADDSUB,302)@4
    yip1E_16_uid303_sincosTest_s <= signOfSelectionSignal_uid295_sincosTest_q;
    yip1E_16_uid303_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist3_yip1_15_uid291_sincosTest_b_1_q(38)) & redist3_yip1_15_uid291_sincosTest_b_1_q));
    yip1E_16_uid303_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 24 => twoToMiSiXip_uid298_sincosTest_b(23)) & twoToMiSiXip_uid298_sincosTest_b));
    yip1E_16_uid303_sincosTest_combproc: PROCESS (yip1E_16_uid303_sincosTest_a, yip1E_16_uid303_sincosTest_b, yip1E_16_uid303_sincosTest_s)
    BEGIN
        IF (yip1E_16_uid303_sincosTest_s = "1") THEN
            yip1E_16_uid303_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_16_uid303_sincosTest_a) + SIGNED(yip1E_16_uid303_sincosTest_b));
        ELSE
            yip1E_16_uid303_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_16_uid303_sincosTest_a) - SIGNED(yip1E_16_uid303_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_16_uid303_sincosTest_q <= yip1E_16_uid303_sincosTest_o(39 downto 0);

    -- yip1_16_uid310_sincosTest(BITSELECT,309)@4
    yip1_16_uid310_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_16_uid303_sincosTest_q(38 downto 0));
    yip1_16_uid310_sincosTest_b <= STD_LOGIC_VECTOR(yip1_16_uid310_sincosTest_in(38 downto 0));

    -- twoToMiSiYip_uid318_sincosTest(BITSELECT,317)@4
    twoToMiSiYip_uid318_sincosTest_b <= STD_LOGIC_VECTOR(yip1_16_uid310_sincosTest_b(38 downto 16));

    -- twoToMiSiYip_uid299_sincosTest(BITSELECT,298)@4
    twoToMiSiYip_uid299_sincosTest_b <= STD_LOGIC_VECTOR(redist3_yip1_15_uid291_sincosTest_b_1_q(38 downto 15));

    -- xip1E_16_uid302_sincosTest(ADDSUB,301)@4
    xip1E_16_uid302_sincosTest_s <= redist2_xMSB_uid293_sincosTest_b_1_q;
    xip1E_16_uid302_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => redist4_xip1_15_uid290_sincosTest_b_1_q(38)) & redist4_xip1_15_uid290_sincosTest_b_1_q));
    xip1E_16_uid302_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 24 => twoToMiSiYip_uid299_sincosTest_b(23)) & twoToMiSiYip_uid299_sincosTest_b));
    xip1E_16_uid302_sincosTest_combproc: PROCESS (xip1E_16_uid302_sincosTest_a, xip1E_16_uid302_sincosTest_b, xip1E_16_uid302_sincosTest_s)
    BEGIN
        IF (xip1E_16_uid302_sincosTest_s = "1") THEN
            xip1E_16_uid302_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_16_uid302_sincosTest_a) + SIGNED(xip1E_16_uid302_sincosTest_b));
        ELSE
            xip1E_16_uid302_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_16_uid302_sincosTest_a) - SIGNED(xip1E_16_uid302_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_16_uid302_sincosTest_q <= xip1E_16_uid302_sincosTest_o(39 downto 0);

    -- xip1_16_uid309_sincosTest(BITSELECT,308)@4
    xip1_16_uid309_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_16_uid302_sincosTest_q(38 downto 0));
    xip1_16_uid309_sincosTest_b <= STD_LOGIC_VECTOR(xip1_16_uid309_sincosTest_in(38 downto 0));

    -- xip1E_17_uid321_sincosTest(ADDSUB,320)@4
    xip1E_17_uid321_sincosTest_s <= redist1_xMSB_uid312_sincosTest_b_1_q;
    xip1E_17_uid321_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_16_uid309_sincosTest_b(38)) & xip1_16_uid309_sincosTest_b));
    xip1E_17_uid321_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 23 => twoToMiSiYip_uid318_sincosTest_b(22)) & twoToMiSiYip_uid318_sincosTest_b));
    xip1E_17_uid321_sincosTest_combproc: PROCESS (xip1E_17_uid321_sincosTest_a, xip1E_17_uid321_sincosTest_b, xip1E_17_uid321_sincosTest_s)
    BEGIN
        IF (xip1E_17_uid321_sincosTest_s = "1") THEN
            xip1E_17_uid321_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_17_uid321_sincosTest_a) + SIGNED(xip1E_17_uid321_sincosTest_b));
        ELSE
            xip1E_17_uid321_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_17_uid321_sincosTest_a) - SIGNED(xip1E_17_uid321_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_17_uid321_sincosTest_q <= xip1E_17_uid321_sincosTest_o(39 downto 0);

    -- xip1_17_uid328_sincosTest(BITSELECT,327)@4
    xip1_17_uid328_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_17_uid321_sincosTest_q(38 downto 0));
    xip1_17_uid328_sincosTest_b <= STD_LOGIC_VECTOR(xip1_17_uid328_sincosTest_in(38 downto 0));

    -- twoToMiSiXip_uid336_sincosTest(BITSELECT,335)@4
    twoToMiSiXip_uid336_sincosTest_b <= STD_LOGIC_VECTOR(xip1_17_uid328_sincosTest_b(38 downto 17));

    -- signOfSelectionSignal_uid314_sincosTest(LOGICAL,313)@4
    signOfSelectionSignal_uid314_sincosTest_q <= not (redist1_xMSB_uid312_sincosTest_b_1_q);

    -- twoToMiSiXip_uid317_sincosTest(BITSELECT,316)@4
    twoToMiSiXip_uid317_sincosTest_b <= STD_LOGIC_VECTOR(xip1_16_uid309_sincosTest_b(38 downto 16));

    -- yip1E_17_uid322_sincosTest(ADDSUB,321)@4
    yip1E_17_uid322_sincosTest_s <= signOfSelectionSignal_uid314_sincosTest_q;
    yip1E_17_uid322_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_16_uid310_sincosTest_b(38)) & yip1_16_uid310_sincosTest_b));
    yip1E_17_uid322_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 23 => twoToMiSiXip_uid317_sincosTest_b(22)) & twoToMiSiXip_uid317_sincosTest_b));
    yip1E_17_uid322_sincosTest_combproc: PROCESS (yip1E_17_uid322_sincosTest_a, yip1E_17_uid322_sincosTest_b, yip1E_17_uid322_sincosTest_s)
    BEGIN
        IF (yip1E_17_uid322_sincosTest_s = "1") THEN
            yip1E_17_uid322_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_17_uid322_sincosTest_a) + SIGNED(yip1E_17_uid322_sincosTest_b));
        ELSE
            yip1E_17_uid322_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_17_uid322_sincosTest_a) - SIGNED(yip1E_17_uid322_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_17_uid322_sincosTest_q <= yip1E_17_uid322_sincosTest_o(39 downto 0);

    -- yip1_17_uid329_sincosTest(BITSELECT,328)@4
    yip1_17_uid329_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_17_uid322_sincosTest_q(38 downto 0));
    yip1_17_uid329_sincosTest_b <= STD_LOGIC_VECTOR(yip1_17_uid329_sincosTest_in(38 downto 0));

    -- yip1E_18_uid341_sincosTest(ADDSUB,340)@4
    yip1E_18_uid341_sincosTest_s <= signOfSelectionSignal_uid333_sincosTest_q;
    yip1E_18_uid341_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => yip1_17_uid329_sincosTest_b(38)) & yip1_17_uid329_sincosTest_b));
    yip1E_18_uid341_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 22 => twoToMiSiXip_uid336_sincosTest_b(21)) & twoToMiSiXip_uid336_sincosTest_b));
    yip1E_18_uid341_sincosTest_combproc: PROCESS (yip1E_18_uid341_sincosTest_a, yip1E_18_uid341_sincosTest_b, yip1E_18_uid341_sincosTest_s)
    BEGIN
        IF (yip1E_18_uid341_sincosTest_s = "1") THEN
            yip1E_18_uid341_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_18_uid341_sincosTest_a) + SIGNED(yip1E_18_uid341_sincosTest_b));
        ELSE
            yip1E_18_uid341_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_18_uid341_sincosTest_a) - SIGNED(yip1E_18_uid341_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_18_uid341_sincosTest_q <= yip1E_18_uid341_sincosTest_o(39 downto 0);

    -- yip1_18_uid348_sincosTest(BITSELECT,347)@4
    yip1_18_uid348_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_18_uid341_sincosTest_q(38 downto 0));
    yip1_18_uid348_sincosTest_b <= STD_LOGIC_VECTOR(yip1_18_uid348_sincosTest_in(38 downto 0));

    -- ySumPreRnd_uid354_sincosTest(BITSELECT,353)@4
    ySumPreRnd_uid354_sincosTest_in <= yip1_18_uid348_sincosTest_b(37 downto 0);
    ySumPreRnd_uid354_sincosTest_b <= ySumPreRnd_uid354_sincosTest_in(37 downto 19);

    -- ySumPostRnd_uid357_sincosTest(ADD,356)@4
    ySumPostRnd_uid357_sincosTest_a <= STD_LOGIC_VECTOR("0" & ySumPreRnd_uid354_sincosTest_b);
    ySumPostRnd_uid357_sincosTest_b <= STD_LOGIC_VECTOR("0000000000000000000" & VCC_q);
    ySumPostRnd_uid357_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(ySumPostRnd_uid357_sincosTest_a) + UNSIGNED(ySumPostRnd_uid357_sincosTest_b));
    ySumPostRnd_uid357_sincosTest_q <= ySumPostRnd_uid357_sincosTest_o(19 downto 0);

    -- yPostExc_uid359_sincosTest(BITSELECT,358)@4
    yPostExc_uid359_sincosTest_in <= STD_LOGIC_VECTOR(ySumPostRnd_uid357_sincosTest_q(18 downto 0));
    yPostExc_uid359_sincosTest_b <= STD_LOGIC_VECTOR(yPostExc_uid359_sincosTest_in(18 downto 1));

    -- cstZeroForAddSub_uid367_sincosTest(CONSTANT,366)
    cstZeroForAddSub_uid367_sincosTest_q <= "000000000000000000";

    -- sinPostNeg_uid369_sincosTest(ADDSUB,368)@4
    sinPostNeg_uid369_sincosTest_s <= invSinNegCond_uid368_sincosTest_q;
    sinPostNeg_uid369_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => cstZeroForAddSub_uid367_sincosTest_q(17)) & cstZeroForAddSub_uid367_sincosTest_q));
    sinPostNeg_uid369_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => yPostExc_uid359_sincosTest_b(17)) & yPostExc_uid359_sincosTest_b));
    sinPostNeg_uid369_sincosTest_combproc: PROCESS (sinPostNeg_uid369_sincosTest_a, sinPostNeg_uid369_sincosTest_b, sinPostNeg_uid369_sincosTest_s)
    BEGIN
        IF (sinPostNeg_uid369_sincosTest_s = "1") THEN
            sinPostNeg_uid369_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid369_sincosTest_a) + SIGNED(sinPostNeg_uid369_sincosTest_b));
        ELSE
            sinPostNeg_uid369_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid369_sincosTest_a) - SIGNED(sinPostNeg_uid369_sincosTest_b));
        END IF;
    END PROCESS;
    sinPostNeg_uid369_sincosTest_q <= sinPostNeg_uid369_sincosTest_o(18 downto 0);

    -- invCosNegCond_uid370_sincosTest(LOGICAL,369)@4
    invCosNegCond_uid370_sincosTest_q <= not (sinNegCond2_uid361_sincosTest_q);

    -- twoToMiSiYip_uid337_sincosTest(BITSELECT,336)@4
    twoToMiSiYip_uid337_sincosTest_b <= STD_LOGIC_VECTOR(yip1_17_uid329_sincosTest_b(38 downto 17));

    -- xip1E_18_uid340_sincosTest(ADDSUB,339)@4
    xip1E_18_uid340_sincosTest_s <= redist0_xMSB_uid331_sincosTest_b_1_q;
    xip1E_18_uid340_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 39 => xip1_17_uid328_sincosTest_b(38)) & xip1_17_uid328_sincosTest_b));
    xip1E_18_uid340_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((40 downto 22 => twoToMiSiYip_uid337_sincosTest_b(21)) & twoToMiSiYip_uid337_sincosTest_b));
    xip1E_18_uid340_sincosTest_combproc: PROCESS (xip1E_18_uid340_sincosTest_a, xip1E_18_uid340_sincosTest_b, xip1E_18_uid340_sincosTest_s)
    BEGIN
        IF (xip1E_18_uid340_sincosTest_s = "1") THEN
            xip1E_18_uid340_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_18_uid340_sincosTest_a) + SIGNED(xip1E_18_uid340_sincosTest_b));
        ELSE
            xip1E_18_uid340_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_18_uid340_sincosTest_a) - SIGNED(xip1E_18_uid340_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_18_uid340_sincosTest_q <= xip1E_18_uid340_sincosTest_o(39 downto 0);

    -- xip1_18_uid347_sincosTest(BITSELECT,346)@4
    xip1_18_uid347_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_18_uid340_sincosTest_q(38 downto 0));
    xip1_18_uid347_sincosTest_b <= STD_LOGIC_VECTOR(xip1_18_uid347_sincosTest_in(38 downto 0));

    -- xSumPreRnd_uid350_sincosTest(BITSELECT,349)@4
    xSumPreRnd_uid350_sincosTest_in <= xip1_18_uid347_sincosTest_b(37 downto 0);
    xSumPreRnd_uid350_sincosTest_b <= xSumPreRnd_uid350_sincosTest_in(37 downto 19);

    -- xSumPostRnd_uid353_sincosTest(ADD,352)@4
    xSumPostRnd_uid353_sincosTest_a <= STD_LOGIC_VECTOR("0" & xSumPreRnd_uid350_sincosTest_b);
    xSumPostRnd_uid353_sincosTest_b <= STD_LOGIC_VECTOR("0000000000000000000" & VCC_q);
    xSumPostRnd_uid353_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xSumPostRnd_uid353_sincosTest_a) + UNSIGNED(xSumPostRnd_uid353_sincosTest_b));
    xSumPostRnd_uid353_sincosTest_q <= xSumPostRnd_uid353_sincosTest_o(19 downto 0);

    -- xPostExc_uid358_sincosTest(BITSELECT,357)@4
    xPostExc_uid358_sincosTest_in <= STD_LOGIC_VECTOR(xSumPostRnd_uid353_sincosTest_q(18 downto 0));
    xPostExc_uid358_sincosTest_b <= STD_LOGIC_VECTOR(xPostExc_uid358_sincosTest_in(18 downto 1));

    -- cosPostNeg_uid371_sincosTest(ADDSUB,370)@4
    cosPostNeg_uid371_sincosTest_s <= invCosNegCond_uid370_sincosTest_q;
    cosPostNeg_uid371_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => cstZeroForAddSub_uid367_sincosTest_q(17)) & cstZeroForAddSub_uid367_sincosTest_q));
    cosPostNeg_uid371_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => xPostExc_uid358_sincosTest_b(17)) & xPostExc_uid358_sincosTest_b));
    cosPostNeg_uid371_sincosTest_combproc: PROCESS (cosPostNeg_uid371_sincosTest_a, cosPostNeg_uid371_sincosTest_b, cosPostNeg_uid371_sincosTest_s)
    BEGIN
        IF (cosPostNeg_uid371_sincosTest_s = "1") THEN
            cosPostNeg_uid371_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid371_sincosTest_a) + SIGNED(cosPostNeg_uid371_sincosTest_b));
        ELSE
            cosPostNeg_uid371_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid371_sincosTest_a) - SIGNED(cosPostNeg_uid371_sincosTest_b));
        END IF;
    END PROCESS;
    cosPostNeg_uid371_sincosTest_q <= cosPostNeg_uid371_sincosTest_o(18 downto 0);

    -- redist18_firstQuadrant_uid15_sincosTest_b_4(DELAY,393)
    redist18_firstQuadrant_uid15_sincosTest_b_4 : dspba_delay
    GENERIC MAP ( width => 1, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => firstQuadrant_uid15_sincosTest_b, xout => redist18_firstQuadrant_uid15_sincosTest_b_4_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- xPostRR_uid373_sincosTest(MUX,372)@4
    xPostRR_uid373_sincosTest_s <= redist18_firstQuadrant_uid15_sincosTest_b_4_q;
    xPostRR_uid373_sincosTest_combproc: PROCESS (xPostRR_uid373_sincosTest_s, cosPostNeg_uid371_sincosTest_q, sinPostNeg_uid369_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid373_sincosTest_s) IS
            WHEN "0" => xPostRR_uid373_sincosTest_q <= cosPostNeg_uid371_sincosTest_q;
            WHEN "1" => xPostRR_uid373_sincosTest_q <= sinPostNeg_uid369_sincosTest_q;
            WHEN OTHERS => xPostRR_uid373_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sin_uid375_sincosTest(BITSELECT,374)@4
    sin_uid375_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid373_sincosTest_q(17 downto 0));
    sin_uid375_sincosTest_b <= STD_LOGIC_VECTOR(sin_uid375_sincosTest_in(17 downto 0));

    -- xPostRR_uid372_sincosTest(MUX,371)@4
    xPostRR_uid372_sincosTest_s <= redist18_firstQuadrant_uid15_sincosTest_b_4_q;
    xPostRR_uid372_sincosTest_combproc: PROCESS (xPostRR_uid372_sincosTest_s, sinPostNeg_uid369_sincosTest_q, cosPostNeg_uid371_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid372_sincosTest_s) IS
            WHEN "0" => xPostRR_uid372_sincosTest_q <= sinPostNeg_uid369_sincosTest_q;
            WHEN "1" => xPostRR_uid372_sincosTest_q <= cosPostNeg_uid371_sincosTest_q;
            WHEN OTHERS => xPostRR_uid372_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cos_uid374_sincosTest(BITSELECT,373)@4
    cos_uid374_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid372_sincosTest_q(17 downto 0));
    cos_uid374_sincosTest_b <= STD_LOGIC_VECTOR(cos_uid374_sincosTest_in(17 downto 0));

    -- xOut(GPOUT,4)@4
    c <= cos_uid374_sincosTest_b;
    s <= sin_uid375_sincosTest_b;

END normal;
