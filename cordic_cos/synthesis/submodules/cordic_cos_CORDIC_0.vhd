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
-- VHDL created on Sun May  4 22:27:02 2025


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
        a : in std_logic_vector(10 downto 0);  -- sfix11_en8
        c : out std_logic_vector(9 downto 0);  -- sfix10_en8
        s : out std_logic_vector(9 downto 0);  -- sfix10_en8
        clk : in std_logic;
        areset : in std_logic
    );
end cordic_cos_CORDIC_0;

architecture normal of cordic_cos_CORDIC_0 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal constantZero_uid6_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal signA_uid7_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal invSignA_uid8_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_a : STD_LOGIC_VECTOR (12 downto 0);
    signal absAE_uid9_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal absAE_uid9_sincosTest_o : STD_LOGIC_VECTOR (12 downto 0);
    signal absAE_uid9_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absAE_uid9_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal absAR_uid10_sincosTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal absAR_uid10_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal cstPiO2_uid11_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal padACst_uid12_sincosTest_q : STD_LOGIC_VECTOR (4 downto 0);
    signal aPostPad_uid13_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal argMPiO2_uid14_sincosTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal argMPiO2_uid14_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal argMPiO2_uid14_sincosTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal argMPiO2_uid14_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal firstQuadrant_uid15_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_in : STD_LOGIC_VECTOR (8 downto 0);
    signal absARE_bottomRange_uid17_sincosTest_b : STD_LOGIC_VECTOR (8 downto 0);
    signal absARE_mergedSignalTM_uid18_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal argMPiO2_uid20_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal argMPiO2_uid20_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal absA_uid21_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal absA_uid21_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal cstOneOverK_uid22_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal cstArcTan2Mi_0_uid26_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1E_1_uid32_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_1CostZeroPaddingA_uid33_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal yip1E_1NA_uid34_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_a : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_o : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_1sumAHighB_uid35_sincosTest_q : STD_LOGIC_VECTOR (21 downto 0);
    signal invSignOfSelectionSignal_uid36_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1NA_uid38_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_1sumAHighB_uid39_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_1_topRange_uid41_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal xip1_1_mergedSignalTM_uid42_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal xMSB_uid44_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1_1_mergedSignalTM_uid48_sincosTest_q : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid50_sincosTest_in : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_uid50_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal xMSB_uid51_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid53_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid56_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal twoToMiSiYip_uid57_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal cstArcTan2Mi_1_uid58_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1E_2_uid60_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_2_uid60_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_2_uid60_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_2_uid60_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_2_uid60_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_2_uid61_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_2_uid61_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_2_uid61_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_2_uid61_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_2_uid61_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_2_uid63_sincosTest_a : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid63_sincosTest_b : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid63_sincosTest_o : STD_LOGIC_VECTOR (21 downto 0);
    signal aip1E_2_uid63_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_2_uid63_sincosTest_q : STD_LOGIC_VECTOR (20 downto 0);
    signal xip1_2_uid64_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_2_uid64_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_2_uid65_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_2_uid65_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid66_sincosTest_in : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_uid66_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal xMSB_uid67_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid69_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid72_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal twoToMiSiYip_uid73_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal cstArcTan2Mi_2_uid74_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1E_3_uid76_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_3_uid76_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_3_uid76_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_3_uid76_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_3_uid76_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_3_uid77_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_3_uid77_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_3_uid77_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_3_uid77_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_3_uid77_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_3_uid79_sincosTest_a : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_3_uid79_sincosTest_b : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_3_uid79_sincosTest_o : STD_LOGIC_VECTOR (20 downto 0);
    signal aip1E_3_uid79_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_3_uid79_sincosTest_q : STD_LOGIC_VECTOR (19 downto 0);
    signal xip1_3_uid80_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_3_uid80_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_3_uid81_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_3_uid81_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid82_sincosTest_in : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_uid82_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal xMSB_uid83_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid85_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid88_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal twoToMiSiYip_uid89_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal cstArcTan2Mi_3_uid90_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1E_4_uid92_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4_uid92_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4_uid92_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_4_uid92_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_4_uid92_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_4_uid93_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4_uid93_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4_uid93_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_4_uid93_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_4_uid93_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_4_uid95_sincosTest_a : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_4_uid95_sincosTest_b : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_4_uid95_sincosTest_o : STD_LOGIC_VECTOR (19 downto 0);
    signal aip1E_4_uid95_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_4_uid95_sincosTest_q : STD_LOGIC_VECTOR (18 downto 0);
    signal xip1_4_uid96_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_4_uid96_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_4_uid97_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_4_uid97_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid98_sincosTest_in : STD_LOGIC_VECTOR (16 downto 0);
    signal aip1E_uid98_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal xMSB_uid99_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid101_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid104_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal twoToMiSiYip_uid105_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal cstArcTan2Mi_4_uid106_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1E_5_uid108_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5_uid108_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5_uid108_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_5_uid108_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_5_uid108_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_5_uid109_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5_uid109_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5_uid109_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_5_uid109_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_5_uid109_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_5_uid111_sincosTest_a : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_5_uid111_sincosTest_b : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_5_uid111_sincosTest_o : STD_LOGIC_VECTOR (18 downto 0);
    signal aip1E_5_uid111_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_5_uid111_sincosTest_q : STD_LOGIC_VECTOR (17 downto 0);
    signal xip1_5_uid112_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_5_uid112_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_5_uid113_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_5_uid113_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid114_sincosTest_in : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_uid114_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal xMSB_uid115_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid117_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid120_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal twoToMiSiYip_uid121_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal cstArcTan2Mi_5_uid122_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_6_uid124_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_6_uid124_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_6_uid124_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_6_uid124_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_6_uid124_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_6_uid125_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6_uid125_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6_uid125_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_6_uid125_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_6_uid125_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal aip1E_6_uid127_sincosTest_a : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_6_uid127_sincosTest_b : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_6_uid127_sincosTest_o : STD_LOGIC_VECTOR (17 downto 0);
    signal aip1E_6_uid127_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_6_uid127_sincosTest_q : STD_LOGIC_VECTOR (16 downto 0);
    signal xip1_6_uid128_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_6_uid128_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_6_uid129_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_6_uid129_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid130_sincosTest_in : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_uid130_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal xMSB_uid131_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid133_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid136_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal twoToMiSiYip_uid137_sincosTest_b : STD_LOGIC_VECTOR (16 downto 0);
    signal cstArcTan2Mi_6_uid138_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal xip1E_7_uid140_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_7_uid140_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_7_uid140_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_7_uid140_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_7_uid140_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_7_uid141_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_7_uid141_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_7_uid141_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_7_uid141_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_7_uid141_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeA_uid143_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid143_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid144_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_7high_uid145_sincosTest_a : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_7high_uid145_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_7high_uid145_sincosTest_o : STD_LOGIC_VECTOR (15 downto 0);
    signal aip1E_7high_uid145_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_7high_uid145_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_7_uid146_sincosTest_q : STD_LOGIC_VECTOR (15 downto 0);
    signal xip1_7_uid147_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_7_uid147_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_7_uid148_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_7_uid148_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid149_sincosTest_in : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_uid149_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xMSB_uid150_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid152_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid155_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal twoToMiSiYip_uid156_sincosTest_b : STD_LOGIC_VECTOR (15 downto 0);
    signal cstArcTan2Mi_7_uid157_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xip1E_8_uid159_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_8_uid159_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_8_uid159_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_8_uid159_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_8_uid159_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_8_uid160_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_8_uid160_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_8_uid160_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_8_uid160_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_8_uid160_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeA_uid162_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid162_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid163_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_8high_uid164_sincosTest_a : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_8high_uid164_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_8high_uid164_sincosTest_o : STD_LOGIC_VECTOR (14 downto 0);
    signal aip1E_8high_uid164_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_8high_uid164_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_8_uid165_sincosTest_q : STD_LOGIC_VECTOR (14 downto 0);
    signal xip1_8_uid166_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_8_uid166_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_8_uid167_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_8_uid167_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid168_sincosTest_in : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_uid168_sincosTest_b : STD_LOGIC_VECTOR (12 downto 0);
    signal xMSB_uid169_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid171_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid174_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal twoToMiSiYip_uid175_sincosTest_b : STD_LOGIC_VECTOR (14 downto 0);
    signal cstArcTan2Mi_8_uid176_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xip1E_9_uid178_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_9_uid178_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_9_uid178_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_9_uid178_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_9_uid178_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_9_uid179_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_9_uid179_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_9_uid179_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_9_uid179_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_9_uid179_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal lowRangeA_uid181_sincosTest_in : STD_LOGIC_VECTOR (0 downto 0);
    signal lowRangeA_uid181_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal highABits_uid182_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_9high_uid183_sincosTest_a : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_9high_uid183_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_9high_uid183_sincosTest_o : STD_LOGIC_VECTOR (13 downto 0);
    signal aip1E_9high_uid183_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal aip1E_9high_uid183_sincosTest_q : STD_LOGIC_VECTOR (12 downto 0);
    signal aip1E_9_uid184_sincosTest_q : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1_9_uid185_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_9_uid185_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_9_uid186_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_9_uid186_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal aip1E_uid187_sincosTest_in : STD_LOGIC_VECTOR (11 downto 0);
    signal aip1E_uid187_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal xMSB_uid188_sincosTest_b : STD_LOGIC_VECTOR (0 downto 0);
    signal signOfSelectionSignal_uid190_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal twoToMiSiXip_uid193_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal twoToMiSiYip_uid194_sincosTest_b : STD_LOGIC_VECTOR (13 downto 0);
    signal xip1E_10_uid197_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_10_uid197_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_10_uid197_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal xip1E_10_uid197_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xip1E_10_uid197_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal yip1E_10_uid198_sincosTest_a : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_10_uid198_sincosTest_b : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_10_uid198_sincosTest_o : STD_LOGIC_VECTOR (24 downto 0);
    signal yip1E_10_uid198_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal yip1E_10_uid198_sincosTest_q : STD_LOGIC_VECTOR (23 downto 0);
    signal xip1_10_uid204_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal xip1_10_uid204_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_10_uid205_sincosTest_in : STD_LOGIC_VECTOR (22 downto 0);
    signal yip1_10_uid205_sincosTest_b : STD_LOGIC_VECTOR (22 downto 0);
    signal xSumPreRnd_uid207_sincosTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal xSumPreRnd_uid207_sincosTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal xSumPostRnd_uid210_sincosTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal xSumPostRnd_uid210_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal xSumPostRnd_uid210_sincosTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal xSumPostRnd_uid210_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal ySumPreRnd_uid211_sincosTest_in : STD_LOGIC_VECTOR (21 downto 0);
    signal ySumPreRnd_uid211_sincosTest_b : STD_LOGIC_VECTOR (10 downto 0);
    signal ySumPostRnd_uid214_sincosTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal ySumPostRnd_uid214_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal ySumPostRnd_uid214_sincosTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal ySumPostRnd_uid214_sincosTest_q : STD_LOGIC_VECTOR (11 downto 0);
    signal xPostExc_uid215_sincosTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal xPostExc_uid215_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal yPostExc_uid216_sincosTest_in : STD_LOGIC_VECTOR (10 downto 0);
    signal yPostExc_uid216_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal invFirstQuadrant_uid217_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond2_uid218_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond1_uid219_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond0_uid221_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid222_sincosTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal sinNegCond_uid222_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cstZeroForAddSub_uid224_sincosTest_q : STD_LOGIC_VECTOR (9 downto 0);
    signal invSinNegCond_uid225_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid226_sincosTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal sinPostNeg_uid226_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal sinPostNeg_uid226_sincosTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal sinPostNeg_uid226_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal sinPostNeg_uid226_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal invCosNegCond_uid227_sincosTest_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal invCosNegCond_uid227_sincosTest_q : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid228_sincosTest_a : STD_LOGIC_VECTOR (11 downto 0);
    signal cosPostNeg_uid228_sincosTest_b : STD_LOGIC_VECTOR (11 downto 0);
    signal cosPostNeg_uid228_sincosTest_o : STD_LOGIC_VECTOR (11 downto 0);
    signal cosPostNeg_uid228_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal cosPostNeg_uid228_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xPostRR_uid229_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid229_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal xPostRR_uid230_sincosTest_s : STD_LOGIC_VECTOR (0 downto 0);
    signal xPostRR_uid230_sincosTest_q : STD_LOGIC_VECTOR (10 downto 0);
    signal cos_uid231_sincosTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal cos_uid231_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal sin_uid232_sincosTest_in : STD_LOGIC_VECTOR (9 downto 0);
    signal sin_uid232_sincosTest_b : STD_LOGIC_VECTOR (9 downto 0);
    signal redist0_invCosNegCond_uid227_sincosTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist1_sinNegCond_uid222_sincosTest_q_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist2_ySumPreRnd_uid211_sincosTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist3_xSumPreRnd_uid207_sincosTest_b_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal redist4_xMSB_uid188_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist5_xMSB_uid169_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist6_xMSB_uid150_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist7_xMSB_uid131_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist8_xMSB_uid115_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist9_yip1_5_uid113_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist10_xip1_5_uid112_sincosTest_b_1_q : STD_LOGIC_VECTOR (22 downto 0);
    signal redist11_aip1E_uid98_sincosTest_b_1_q : STD_LOGIC_VECTOR (16 downto 0);
    signal redist12_xMSB_uid83_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist13_xMSB_uid67_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist14_xMSB_uid51_sincosTest_b_1_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist15_firstQuadrant_uid15_sincosTest_b_3_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist16_xIn_a_1_q : STD_LOGIC_VECTOR (10 downto 0);

begin


    -- cstPiO2_uid11_sincosTest(CONSTANT,10)
    cstPiO2_uid11_sincosTest_q <= "11001001000100";

    -- invSignA_uid8_sincosTest(LOGICAL,7)@1
    invSignA_uid8_sincosTest_q <= not (signA_uid7_sincosTest_b);

    -- redist16_xIn_a_1(DELAY,248)
    redist16_xIn_a_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => a, xout => redist16_xIn_a_1_q, clk => clk, aclr => areset );

    -- constantZero_uid6_sincosTest(CONSTANT,5)
    constantZero_uid6_sincosTest_q <= "00000000000";

    -- absAE_uid9_sincosTest(ADDSUB,8)@1
    absAE_uid9_sincosTest_s <= invSignA_uid8_sincosTest_q;
    absAE_uid9_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => constantZero_uid6_sincosTest_q(10)) & constantZero_uid6_sincosTest_q));
    absAE_uid9_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => redist16_xIn_a_1_q(10)) & redist16_xIn_a_1_q));
    absAE_uid9_sincosTest_combproc: PROCESS (absAE_uid9_sincosTest_a, absAE_uid9_sincosTest_b, absAE_uid9_sincosTest_s)
    BEGIN
        IF (absAE_uid9_sincosTest_s = "1") THEN
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) + SIGNED(absAE_uid9_sincosTest_b));
        ELSE
            absAE_uid9_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(absAE_uid9_sincosTest_a) - SIGNED(absAE_uid9_sincosTest_b));
        END IF;
    END PROCESS;
    absAE_uid9_sincosTest_q <= absAE_uid9_sincosTest_o(11 downto 0);

    -- absAR_uid10_sincosTest(BITSELECT,9)@1
    absAR_uid10_sincosTest_in <= absAE_uid9_sincosTest_q(9 downto 0);
    absAR_uid10_sincosTest_b <= absAR_uid10_sincosTest_in(9 downto 0);

    -- padACst_uid12_sincosTest(CONSTANT,11)
    padACst_uid12_sincosTest_q <= "00000";

    -- aPostPad_uid13_sincosTest(BITJOIN,12)@1
    aPostPad_uid13_sincosTest_q <= absAR_uid10_sincosTest_b & padACst_uid12_sincosTest_q;

    -- argMPiO2_uid14_sincosTest(SUB,13)@1
    argMPiO2_uid14_sincosTest_a <= STD_LOGIC_VECTOR("0" & aPostPad_uid13_sincosTest_q);
    argMPiO2_uid14_sincosTest_b <= STD_LOGIC_VECTOR("00" & cstPiO2_uid11_sincosTest_q);
    argMPiO2_uid14_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(argMPiO2_uid14_sincosTest_a) - UNSIGNED(argMPiO2_uid14_sincosTest_b));
    argMPiO2_uid14_sincosTest_q <= argMPiO2_uid14_sincosTest_o(15 downto 0);

    -- firstQuadrant_uid15_sincosTest(BITSELECT,14)@1
    firstQuadrant_uid15_sincosTest_b <= STD_LOGIC_VECTOR(argMPiO2_uid14_sincosTest_q(15 downto 15));

    -- invFirstQuadrant_uid217_sincosTest(LOGICAL,216)@1
    invFirstQuadrant_uid217_sincosTest_q <= not (firstQuadrant_uid15_sincosTest_b);

    -- signA_uid7_sincosTest(BITSELECT,6)@1
    signA_uid7_sincosTest_b <= STD_LOGIC_VECTOR(redist16_xIn_a_1_q(10 downto 10));

    -- sinNegCond2_uid218_sincosTest(LOGICAL,217)@1
    sinNegCond2_uid218_sincosTest_q <= signA_uid7_sincosTest_b and invFirstQuadrant_uid217_sincosTest_q;

    -- sinNegCond1_uid219_sincosTest(LOGICAL,218)@1
    sinNegCond1_uid219_sincosTest_q <= signA_uid7_sincosTest_b and firstQuadrant_uid15_sincosTest_b;

    -- sinNegCond0_uid221_sincosTest(LOGICAL,220)@1
    sinNegCond0_uid221_sincosTest_q <= invSignA_uid8_sincosTest_q and invFirstQuadrant_uid217_sincosTest_q;

    -- sinNegCond_uid222_sincosTest(LOGICAL,221)@1 + 1
    sinNegCond_uid222_sincosTest_qi <= sinNegCond0_uid221_sincosTest_q or sinNegCond1_uid219_sincosTest_q or sinNegCond2_uid218_sincosTest_q;
    sinNegCond_uid222_sincosTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => sinNegCond_uid222_sincosTest_qi, xout => sinNegCond_uid222_sincosTest_q, clk => clk, aclr => areset );

    -- redist1_sinNegCond_uid222_sincosTest_q_3(DELAY,233)
    redist1_sinNegCond_uid222_sincosTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => sinNegCond_uid222_sincosTest_q, xout => redist1_sinNegCond_uid222_sincosTest_q_3_q, clk => clk, aclr => areset );

    -- invSinNegCond_uid225_sincosTest(LOGICAL,224)@4
    invSinNegCond_uid225_sincosTest_q <= not (redist1_sinNegCond_uid222_sincosTest_q_3_q);

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- xMSB_uid115_sincosTest(BITSELECT,114)@2
    xMSB_uid115_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_b(15 downto 15));

    -- cstArcTan2Mi_5_uid122_sincosTest(CONSTANT,121)
    cstArcTan2Mi_5_uid122_sincosTest_q <= "01111111111101";

    -- xMSB_uid99_sincosTest(BITSELECT,98)@2
    xMSB_uid99_sincosTest_b <= STD_LOGIC_VECTOR(redist11_aip1E_uid98_sincosTest_b_1_q(16 downto 16));

    -- cstArcTan2Mi_4_uid106_sincosTest(CONSTANT,105)
    cstArcTan2Mi_4_uid106_sincosTest_q <= "011111111101011";

    -- xMSB_uid83_sincosTest(BITSELECT,82)@1
    xMSB_uid83_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid82_sincosTest_b(17 downto 17));

    -- cstArcTan2Mi_3_uid90_sincosTest(CONSTANT,89)
    cstArcTan2Mi_3_uid90_sincosTest_q <= "0111111101010111";

    -- xMSB_uid67_sincosTest(BITSELECT,66)@1
    xMSB_uid67_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid66_sincosTest_b(18 downto 18));

    -- cstArcTan2Mi_2_uid74_sincosTest(CONSTANT,73)
    cstArcTan2Mi_2_uid74_sincosTest_q <= "01111101011011100";

    -- xMSB_uid51_sincosTest(BITSELECT,50)@1
    xMSB_uid51_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_b(19 downto 19));

    -- cstArcTan2Mi_1_uid58_sincosTest(CONSTANT,57)
    cstArcTan2Mi_1_uid58_sincosTest_q <= "011101101011000110";

    -- invSignOfSelectionSignal_uid36_sincosTest(LOGICAL,35)@1
    invSignOfSelectionSignal_uid36_sincosTest_q <= not (VCC_q);

    -- cstArcTan2Mi_0_uid26_sincosTest(CONSTANT,25)
    cstArcTan2Mi_0_uid26_sincosTest_q <= "0110010010000111111";

    -- absARE_bottomRange_uid17_sincosTest(BITSELECT,16)@1
    absARE_bottomRange_uid17_sincosTest_in <= absAR_uid10_sincosTest_b(8 downto 0);
    absARE_bottomRange_uid17_sincosTest_b <= absARE_bottomRange_uid17_sincosTest_in(8 downto 0);

    -- absARE_mergedSignalTM_uid18_sincosTest(BITJOIN,17)@1
    absARE_mergedSignalTM_uid18_sincosTest_q <= absARE_bottomRange_uid17_sincosTest_b & padACst_uid12_sincosTest_q;

    -- argMPiO2_uid20_sincosTest(BITSELECT,19)@1
    argMPiO2_uid20_sincosTest_in <= argMPiO2_uid14_sincosTest_q(13 downto 0);
    argMPiO2_uid20_sincosTest_b <= argMPiO2_uid20_sincosTest_in(13 downto 0);

    -- absA_uid21_sincosTest(MUX,20)@1
    absA_uid21_sincosTest_s <= firstQuadrant_uid15_sincosTest_b;
    absA_uid21_sincosTest_combproc: PROCESS (absA_uid21_sincosTest_s, argMPiO2_uid20_sincosTest_b, absARE_mergedSignalTM_uid18_sincosTest_q)
    BEGIN
        CASE (absA_uid21_sincosTest_s) IS
            WHEN "0" => absA_uid21_sincosTest_q <= argMPiO2_uid20_sincosTest_b;
            WHEN "1" => absA_uid21_sincosTest_q <= absARE_mergedSignalTM_uid18_sincosTest_q;
            WHEN OTHERS => absA_uid21_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- aip1E_1NA_uid38_sincosTest(BITJOIN,37)@1
    aip1E_1NA_uid38_sincosTest_q <= absA_uid21_sincosTest_q & padACst_uid12_sincosTest_q;

    -- aip1E_1sumAHighB_uid39_sincosTest(ADDSUB,38)@1
    aip1E_1sumAHighB_uid39_sincosTest_s <= invSignOfSelectionSignal_uid36_sincosTest_q;
    aip1E_1sumAHighB_uid39_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR("000" & aip1E_1NA_uid38_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 19 => cstArcTan2Mi_0_uid26_sincosTest_q(18)) & cstArcTan2Mi_0_uid26_sincosTest_q));
    aip1E_1sumAHighB_uid39_sincosTest_combproc: PROCESS (aip1E_1sumAHighB_uid39_sincosTest_a, aip1E_1sumAHighB_uid39_sincosTest_b, aip1E_1sumAHighB_uid39_sincosTest_s)
    BEGIN
        IF (aip1E_1sumAHighB_uid39_sincosTest_s = "1") THEN
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) + SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        ELSE
            aip1E_1sumAHighB_uid39_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_1sumAHighB_uid39_sincosTest_a) - SIGNED(aip1E_1sumAHighB_uid39_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_1sumAHighB_uid39_sincosTest_q <= aip1E_1sumAHighB_uid39_sincosTest_o(20 downto 0);

    -- aip1E_uid50_sincosTest(BITSELECT,49)@1
    aip1E_uid50_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_1sumAHighB_uid39_sincosTest_q(19 downto 0));
    aip1E_uid50_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid50_sincosTest_in(19 downto 0));

    -- aip1E_2_uid63_sincosTest(ADDSUB,62)@1
    aip1E_2_uid63_sincosTest_s <= xMSB_uid51_sincosTest_b;
    aip1E_2_uid63_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 20 => aip1E_uid50_sincosTest_b(19)) & aip1E_uid50_sincosTest_b));
    aip1E_2_uid63_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 18 => cstArcTan2Mi_1_uid58_sincosTest_q(17)) & cstArcTan2Mi_1_uid58_sincosTest_q));
    aip1E_2_uid63_sincosTest_combproc: PROCESS (aip1E_2_uid63_sincosTest_a, aip1E_2_uid63_sincosTest_b, aip1E_2_uid63_sincosTest_s)
    BEGIN
        IF (aip1E_2_uid63_sincosTest_s = "1") THEN
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) + SIGNED(aip1E_2_uid63_sincosTest_b));
        ELSE
            aip1E_2_uid63_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_2_uid63_sincosTest_a) - SIGNED(aip1E_2_uid63_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_2_uid63_sincosTest_q <= aip1E_2_uid63_sincosTest_o(20 downto 0);

    -- aip1E_uid66_sincosTest(BITSELECT,65)@1
    aip1E_uid66_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_2_uid63_sincosTest_q(18 downto 0));
    aip1E_uid66_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid66_sincosTest_in(18 downto 0));

    -- aip1E_3_uid79_sincosTest(ADDSUB,78)@1
    aip1E_3_uid79_sincosTest_s <= xMSB_uid67_sincosTest_b;
    aip1E_3_uid79_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => aip1E_uid66_sincosTest_b(18)) & aip1E_uid66_sincosTest_b));
    aip1E_3_uid79_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 17 => cstArcTan2Mi_2_uid74_sincosTest_q(16)) & cstArcTan2Mi_2_uid74_sincosTest_q));
    aip1E_3_uid79_sincosTest_combproc: PROCESS (aip1E_3_uid79_sincosTest_a, aip1E_3_uid79_sincosTest_b, aip1E_3_uid79_sincosTest_s)
    BEGIN
        IF (aip1E_3_uid79_sincosTest_s = "1") THEN
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) + SIGNED(aip1E_3_uid79_sincosTest_b));
        ELSE
            aip1E_3_uid79_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_3_uid79_sincosTest_a) - SIGNED(aip1E_3_uid79_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_3_uid79_sincosTest_q <= aip1E_3_uid79_sincosTest_o(19 downto 0);

    -- aip1E_uid82_sincosTest(BITSELECT,81)@1
    aip1E_uid82_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_3_uid79_sincosTest_q(17 downto 0));
    aip1E_uid82_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid82_sincosTest_in(17 downto 0));

    -- aip1E_4_uid95_sincosTest(ADDSUB,94)@1
    aip1E_4_uid95_sincosTest_s <= xMSB_uid83_sincosTest_b;
    aip1E_4_uid95_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 18 => aip1E_uid82_sincosTest_b(17)) & aip1E_uid82_sincosTest_b));
    aip1E_4_uid95_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 16 => cstArcTan2Mi_3_uid90_sincosTest_q(15)) & cstArcTan2Mi_3_uid90_sincosTest_q));
    aip1E_4_uid95_sincosTest_combproc: PROCESS (aip1E_4_uid95_sincosTest_a, aip1E_4_uid95_sincosTest_b, aip1E_4_uid95_sincosTest_s)
    BEGIN
        IF (aip1E_4_uid95_sincosTest_s = "1") THEN
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) + SIGNED(aip1E_4_uid95_sincosTest_b));
        ELSE
            aip1E_4_uid95_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_4_uid95_sincosTest_a) - SIGNED(aip1E_4_uid95_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_4_uid95_sincosTest_q <= aip1E_4_uid95_sincosTest_o(18 downto 0);

    -- aip1E_uid98_sincosTest(BITSELECT,97)@1
    aip1E_uid98_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_4_uid95_sincosTest_q(16 downto 0));
    aip1E_uid98_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid98_sincosTest_in(16 downto 0));

    -- redist11_aip1E_uid98_sincosTest_b_1(DELAY,243)
    redist11_aip1E_uid98_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 17, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => aip1E_uid98_sincosTest_b, xout => redist11_aip1E_uid98_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- aip1E_5_uid111_sincosTest(ADDSUB,110)@2
    aip1E_5_uid111_sincosTest_s <= xMSB_uid99_sincosTest_b;
    aip1E_5_uid111_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => redist11_aip1E_uid98_sincosTest_b_1_q(16)) & redist11_aip1E_uid98_sincosTest_b_1_q));
    aip1E_5_uid111_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 15 => cstArcTan2Mi_4_uid106_sincosTest_q(14)) & cstArcTan2Mi_4_uid106_sincosTest_q));
    aip1E_5_uid111_sincosTest_combproc: PROCESS (aip1E_5_uid111_sincosTest_a, aip1E_5_uid111_sincosTest_b, aip1E_5_uid111_sincosTest_s)
    BEGIN
        IF (aip1E_5_uid111_sincosTest_s = "1") THEN
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) + SIGNED(aip1E_5_uid111_sincosTest_b));
        ELSE
            aip1E_5_uid111_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_5_uid111_sincosTest_a) - SIGNED(aip1E_5_uid111_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_5_uid111_sincosTest_q <= aip1E_5_uid111_sincosTest_o(17 downto 0);

    -- aip1E_uid114_sincosTest(BITSELECT,113)@2
    aip1E_uid114_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_5_uid111_sincosTest_q(15 downto 0));
    aip1E_uid114_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid114_sincosTest_in(15 downto 0));

    -- aip1E_6_uid127_sincosTest(ADDSUB,126)@2
    aip1E_6_uid127_sincosTest_s <= xMSB_uid115_sincosTest_b;
    aip1E_6_uid127_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => aip1E_uid114_sincosTest_b(15)) & aip1E_uid114_sincosTest_b));
    aip1E_6_uid127_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 14 => cstArcTan2Mi_5_uid122_sincosTest_q(13)) & cstArcTan2Mi_5_uid122_sincosTest_q));
    aip1E_6_uid127_sincosTest_combproc: PROCESS (aip1E_6_uid127_sincosTest_a, aip1E_6_uid127_sincosTest_b, aip1E_6_uid127_sincosTest_s)
    BEGIN
        IF (aip1E_6_uid127_sincosTest_s = "1") THEN
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) + SIGNED(aip1E_6_uid127_sincosTest_b));
        ELSE
            aip1E_6_uid127_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_6_uid127_sincosTest_a) - SIGNED(aip1E_6_uid127_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_6_uid127_sincosTest_q <= aip1E_6_uid127_sincosTest_o(16 downto 0);

    -- aip1E_uid130_sincosTest(BITSELECT,129)@2
    aip1E_uid130_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_6_uid127_sincosTest_q(14 downto 0));
    aip1E_uid130_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_in(14 downto 0));

    -- xMSB_uid131_sincosTest(BITSELECT,130)@2
    xMSB_uid131_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_b(14 downto 14));

    -- cstArcTan2Mi_6_uid138_sincosTest(CONSTANT,137)
    cstArcTan2Mi_6_uid138_sincosTest_q <= "0100000000000";

    -- highABits_uid144_sincosTest(BITSELECT,143)@2
    highABits_uid144_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid130_sincosTest_b(14 downto 1));

    -- aip1E_7high_uid145_sincosTest(ADDSUB,144)@2
    aip1E_7high_uid145_sincosTest_s <= xMSB_uid131_sincosTest_b;
    aip1E_7high_uid145_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => highABits_uid144_sincosTest_b(13)) & highABits_uid144_sincosTest_b));
    aip1E_7high_uid145_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => cstArcTan2Mi_6_uid138_sincosTest_q(12)) & cstArcTan2Mi_6_uid138_sincosTest_q));
    aip1E_7high_uid145_sincosTest_combproc: PROCESS (aip1E_7high_uid145_sincosTest_a, aip1E_7high_uid145_sincosTest_b, aip1E_7high_uid145_sincosTest_s)
    BEGIN
        IF (aip1E_7high_uid145_sincosTest_s = "1") THEN
            aip1E_7high_uid145_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid145_sincosTest_a) + SIGNED(aip1E_7high_uid145_sincosTest_b));
        ELSE
            aip1E_7high_uid145_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_7high_uid145_sincosTest_a) - SIGNED(aip1E_7high_uid145_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_7high_uid145_sincosTest_q <= aip1E_7high_uid145_sincosTest_o(14 downto 0);

    -- lowRangeA_uid143_sincosTest(BITSELECT,142)@2
    lowRangeA_uid143_sincosTest_in <= aip1E_uid130_sincosTest_b(0 downto 0);
    lowRangeA_uid143_sincosTest_b <= lowRangeA_uid143_sincosTest_in(0 downto 0);

    -- aip1E_7_uid146_sincosTest(BITJOIN,145)@2
    aip1E_7_uid146_sincosTest_q <= aip1E_7high_uid145_sincosTest_q & lowRangeA_uid143_sincosTest_b;

    -- aip1E_uid149_sincosTest(BITSELECT,148)@2
    aip1E_uid149_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_7_uid146_sincosTest_q(13 downto 0));
    aip1E_uid149_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid149_sincosTest_in(13 downto 0));

    -- xMSB_uid150_sincosTest(BITSELECT,149)@2
    xMSB_uid150_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid149_sincosTest_b(13 downto 13));

    -- cstArcTan2Mi_7_uid157_sincosTest(CONSTANT,156)
    cstArcTan2Mi_7_uid157_sincosTest_q <= "010000000000";

    -- highABits_uid163_sincosTest(BITSELECT,162)@2
    highABits_uid163_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid149_sincosTest_b(13 downto 1));

    -- aip1E_8high_uid164_sincosTest(ADDSUB,163)@2
    aip1E_8high_uid164_sincosTest_s <= xMSB_uid150_sincosTest_b;
    aip1E_8high_uid164_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => highABits_uid163_sincosTest_b(12)) & highABits_uid163_sincosTest_b));
    aip1E_8high_uid164_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => cstArcTan2Mi_7_uid157_sincosTest_q(11)) & cstArcTan2Mi_7_uid157_sincosTest_q));
    aip1E_8high_uid164_sincosTest_combproc: PROCESS (aip1E_8high_uid164_sincosTest_a, aip1E_8high_uid164_sincosTest_b, aip1E_8high_uid164_sincosTest_s)
    BEGIN
        IF (aip1E_8high_uid164_sincosTest_s = "1") THEN
            aip1E_8high_uid164_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid164_sincosTest_a) + SIGNED(aip1E_8high_uid164_sincosTest_b));
        ELSE
            aip1E_8high_uid164_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_8high_uid164_sincosTest_a) - SIGNED(aip1E_8high_uid164_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_8high_uid164_sincosTest_q <= aip1E_8high_uid164_sincosTest_o(13 downto 0);

    -- lowRangeA_uid162_sincosTest(BITSELECT,161)@2
    lowRangeA_uid162_sincosTest_in <= aip1E_uid149_sincosTest_b(0 downto 0);
    lowRangeA_uid162_sincosTest_b <= lowRangeA_uid162_sincosTest_in(0 downto 0);

    -- aip1E_8_uid165_sincosTest(BITJOIN,164)@2
    aip1E_8_uid165_sincosTest_q <= aip1E_8high_uid164_sincosTest_q & lowRangeA_uid162_sincosTest_b;

    -- aip1E_uid168_sincosTest(BITSELECT,167)@2
    aip1E_uid168_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_8_uid165_sincosTest_q(12 downto 0));
    aip1E_uid168_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid168_sincosTest_in(12 downto 0));

    -- xMSB_uid169_sincosTest(BITSELECT,168)@2
    xMSB_uid169_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid168_sincosTest_b(12 downto 12));

    -- cstArcTan2Mi_8_uid176_sincosTest(CONSTANT,175)
    cstArcTan2Mi_8_uid176_sincosTest_q <= "01000000000";

    -- highABits_uid182_sincosTest(BITSELECT,181)@2
    highABits_uid182_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid168_sincosTest_b(12 downto 1));

    -- aip1E_9high_uid183_sincosTest(ADDSUB,182)@2
    aip1E_9high_uid183_sincosTest_s <= xMSB_uid169_sincosTest_b;
    aip1E_9high_uid183_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => highABits_uid182_sincosTest_b(11)) & highABits_uid182_sincosTest_b));
    aip1E_9high_uid183_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 11 => cstArcTan2Mi_8_uid176_sincosTest_q(10)) & cstArcTan2Mi_8_uid176_sincosTest_q));
    aip1E_9high_uid183_sincosTest_combproc: PROCESS (aip1E_9high_uid183_sincosTest_a, aip1E_9high_uid183_sincosTest_b, aip1E_9high_uid183_sincosTest_s)
    BEGIN
        IF (aip1E_9high_uid183_sincosTest_s = "1") THEN
            aip1E_9high_uid183_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid183_sincosTest_a) + SIGNED(aip1E_9high_uid183_sincosTest_b));
        ELSE
            aip1E_9high_uid183_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(aip1E_9high_uid183_sincosTest_a) - SIGNED(aip1E_9high_uid183_sincosTest_b));
        END IF;
    END PROCESS;
    aip1E_9high_uid183_sincosTest_q <= aip1E_9high_uid183_sincosTest_o(12 downto 0);

    -- lowRangeA_uid181_sincosTest(BITSELECT,180)@2
    lowRangeA_uid181_sincosTest_in <= aip1E_uid168_sincosTest_b(0 downto 0);
    lowRangeA_uid181_sincosTest_b <= lowRangeA_uid181_sincosTest_in(0 downto 0);

    -- aip1E_9_uid184_sincosTest(BITJOIN,183)@2
    aip1E_9_uid184_sincosTest_q <= aip1E_9high_uid183_sincosTest_q & lowRangeA_uid181_sincosTest_b;

    -- aip1E_uid187_sincosTest(BITSELECT,186)@2
    aip1E_uid187_sincosTest_in <= STD_LOGIC_VECTOR(aip1E_9_uid184_sincosTest_q(11 downto 0));
    aip1E_uid187_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid187_sincosTest_in(11 downto 0));

    -- xMSB_uid188_sincosTest(BITSELECT,187)@2
    xMSB_uid188_sincosTest_b <= STD_LOGIC_VECTOR(aip1E_uid187_sincosTest_b(11 downto 11));

    -- redist4_xMSB_uid188_sincosTest_b_1(DELAY,236)
    redist4_xMSB_uid188_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid188_sincosTest_b, xout => redist4_xMSB_uid188_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid190_sincosTest(LOGICAL,189)@3
    signOfSelectionSignal_uid190_sincosTest_q <= not (redist4_xMSB_uid188_sincosTest_b_1_q);

    -- redist5_xMSB_uid169_sincosTest_b_1(DELAY,237)
    redist5_xMSB_uid169_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid169_sincosTest_b, xout => redist5_xMSB_uid169_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist6_xMSB_uid150_sincosTest_b_1(DELAY,238)
    redist6_xMSB_uid150_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid150_sincosTest_b, xout => redist6_xMSB_uid150_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid152_sincosTest(LOGICAL,151)@3
    signOfSelectionSignal_uid152_sincosTest_q <= not (redist6_xMSB_uid150_sincosTest_b_1_q);

    -- redist7_xMSB_uid131_sincosTest_b_1(DELAY,239)
    redist7_xMSB_uid131_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid131_sincosTest_b, xout => redist7_xMSB_uid131_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist8_xMSB_uid115_sincosTest_b_1(DELAY,240)
    redist8_xMSB_uid115_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid115_sincosTest_b, xout => redist8_xMSB_uid115_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid117_sincosTest(LOGICAL,116)@3
    signOfSelectionSignal_uid117_sincosTest_q <= not (redist8_xMSB_uid115_sincosTest_b_1_q);

    -- redist12_xMSB_uid83_sincosTest_b_1(DELAY,244)
    redist12_xMSB_uid83_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid83_sincosTest_b, xout => redist12_xMSB_uid83_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid85_sincosTest(LOGICAL,84)@2
    signOfSelectionSignal_uid85_sincosTest_q <= not (redist12_xMSB_uid83_sincosTest_b_1_q);

    -- redist13_xMSB_uid67_sincosTest_b_1(DELAY,245)
    redist13_xMSB_uid67_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid67_sincosTest_b, xout => redist13_xMSB_uid67_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- redist14_xMSB_uid51_sincosTest_b_1(DELAY,246)
    redist14_xMSB_uid51_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xMSB_uid51_sincosTest_b, xout => redist14_xMSB_uid51_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- signOfSelectionSignal_uid53_sincosTest(LOGICAL,52)@2
    signOfSelectionSignal_uid53_sincosTest_q <= not (redist14_xMSB_uid51_sincosTest_b_1_q);

    -- cstOneOverK_uid22_sincosTest(CONSTANT,21)
    cstOneOverK_uid22_sincosTest_q <= "10011011011101001111";

    -- xip1E_1_uid32_sincosTest(BITJOIN,31)@2
    xip1E_1_uid32_sincosTest_q <= STD_LOGIC_VECTOR((2 downto 1 => GND_q(0)) & GND_q) & cstOneOverK_uid22_sincosTest_q;

    -- xip1_1_topRange_uid41_sincosTest(BITSELECT,40)@2
    xip1_1_topRange_uid41_sincosTest_in <= xip1E_1_uid32_sincosTest_q(21 downto 0);
    xip1_1_topRange_uid41_sincosTest_b <= xip1_1_topRange_uid41_sincosTest_in(21 downto 0);

    -- xip1_1_mergedSignalTM_uid42_sincosTest(BITJOIN,41)@2
    xip1_1_mergedSignalTM_uid42_sincosTest_q <= GND_q & xip1_1_topRange_uid41_sincosTest_b;

    -- twoToMiSiXip_uid56_sincosTest(BITSELECT,55)@2
    twoToMiSiXip_uid56_sincosTest_b <= STD_LOGIC_VECTOR(xip1_1_mergedSignalTM_uid42_sincosTest_q(22 downto 1));

    -- xMSB_uid44_sincosTest(BITSELECT,43)@2
    xMSB_uid44_sincosTest_b <= STD_LOGIC_VECTOR(yip1E_1sumAHighB_uid35_sincosTest_q(21 downto 21));

    -- yip1E_1CostZeroPaddingA_uid33_sincosTest(CONSTANT,32)
    yip1E_1CostZeroPaddingA_uid33_sincosTest_q <= "00000000000000000000";

    -- yip1E_1NA_uid34_sincosTest(BITJOIN,33)@2
    yip1E_1NA_uid34_sincosTest_q <= GND_q & yip1E_1CostZeroPaddingA_uid33_sincosTest_q;

    -- yip1E_1sumAHighB_uid35_sincosTest(ADDSUB,34)@2
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
    yip1E_1sumAHighB_uid35_sincosTest_q <= yip1E_1sumAHighB_uid35_sincosTest_o(21 downto 0);

    -- yip1_1_mergedSignalTM_uid48_sincosTest(BITJOIN,47)@2
    yip1_1_mergedSignalTM_uid48_sincosTest_q <= xMSB_uid44_sincosTest_b & yip1E_1sumAHighB_uid35_sincosTest_q;

    -- yip1E_2_uid61_sincosTest(ADDSUB,60)@2
    yip1E_2_uid61_sincosTest_s <= signOfSelectionSignal_uid53_sincosTest_q;
    yip1E_2_uid61_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_1_mergedSignalTM_uid48_sincosTest_q(22)) & yip1_1_mergedSignalTM_uid48_sincosTest_q));
    yip1E_2_uid61_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 22 => twoToMiSiXip_uid56_sincosTest_b(21)) & twoToMiSiXip_uid56_sincosTest_b));
    yip1E_2_uid61_sincosTest_combproc: PROCESS (yip1E_2_uid61_sincosTest_a, yip1E_2_uid61_sincosTest_b, yip1E_2_uid61_sincosTest_s)
    BEGIN
        IF (yip1E_2_uid61_sincosTest_s = "1") THEN
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) + SIGNED(yip1E_2_uid61_sincosTest_b));
        ELSE
            yip1E_2_uid61_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_2_uid61_sincosTest_a) - SIGNED(yip1E_2_uid61_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_2_uid61_sincosTest_q <= yip1E_2_uid61_sincosTest_o(23 downto 0);

    -- yip1_2_uid65_sincosTest(BITSELECT,64)@2
    yip1_2_uid65_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_2_uid61_sincosTest_q(22 downto 0));
    yip1_2_uid65_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid65_sincosTest_in(22 downto 0));

    -- twoToMiSiYip_uid73_sincosTest(BITSELECT,72)@2
    twoToMiSiYip_uid73_sincosTest_b <= STD_LOGIC_VECTOR(yip1_2_uid65_sincosTest_b(22 downto 2));

    -- twoToMiSiYip_uid57_sincosTest(BITSELECT,56)@2
    twoToMiSiYip_uid57_sincosTest_b <= STD_LOGIC_VECTOR(yip1_1_mergedSignalTM_uid48_sincosTest_q(22 downto 1));

    -- xip1E_2_uid60_sincosTest(ADDSUB,59)@2
    xip1E_2_uid60_sincosTest_s <= redist14_xMSB_uid51_sincosTest_b_1_q;
    xip1E_2_uid60_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1_1_mergedSignalTM_uid42_sincosTest_q(22)) & xip1_1_mergedSignalTM_uid42_sincosTest_q));
    xip1E_2_uid60_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 22 => twoToMiSiYip_uid57_sincosTest_b(21)) & twoToMiSiYip_uid57_sincosTest_b));
    xip1E_2_uid60_sincosTest_combproc: PROCESS (xip1E_2_uid60_sincosTest_a, xip1E_2_uid60_sincosTest_b, xip1E_2_uid60_sincosTest_s)
    BEGIN
        IF (xip1E_2_uid60_sincosTest_s = "1") THEN
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) + SIGNED(xip1E_2_uid60_sincosTest_b));
        ELSE
            xip1E_2_uid60_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_2_uid60_sincosTest_a) - SIGNED(xip1E_2_uid60_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_2_uid60_sincosTest_q <= xip1E_2_uid60_sincosTest_o(23 downto 0);

    -- xip1_2_uid64_sincosTest(BITSELECT,63)@2
    xip1_2_uid64_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_2_uid60_sincosTest_q(22 downto 0));
    xip1_2_uid64_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid64_sincosTest_in(22 downto 0));

    -- xip1E_3_uid76_sincosTest(ADDSUB,75)@2
    xip1E_3_uid76_sincosTest_s <= redist13_xMSB_uid67_sincosTest_b_1_q;
    xip1E_3_uid76_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1_2_uid64_sincosTest_b(22)) & xip1_2_uid64_sincosTest_b));
    xip1E_3_uid76_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 21 => twoToMiSiYip_uid73_sincosTest_b(20)) & twoToMiSiYip_uid73_sincosTest_b));
    xip1E_3_uid76_sincosTest_combproc: PROCESS (xip1E_3_uid76_sincosTest_a, xip1E_3_uid76_sincosTest_b, xip1E_3_uid76_sincosTest_s)
    BEGIN
        IF (xip1E_3_uid76_sincosTest_s = "1") THEN
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) + SIGNED(xip1E_3_uid76_sincosTest_b));
        ELSE
            xip1E_3_uid76_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_3_uid76_sincosTest_a) - SIGNED(xip1E_3_uid76_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_3_uid76_sincosTest_q <= xip1E_3_uid76_sincosTest_o(23 downto 0);

    -- xip1_3_uid80_sincosTest(BITSELECT,79)@2
    xip1_3_uid80_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_3_uid76_sincosTest_q(22 downto 0));
    xip1_3_uid80_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid80_sincosTest_in(22 downto 0));

    -- twoToMiSiXip_uid88_sincosTest(BITSELECT,87)@2
    twoToMiSiXip_uid88_sincosTest_b <= STD_LOGIC_VECTOR(xip1_3_uid80_sincosTest_b(22 downto 3));

    -- signOfSelectionSignal_uid69_sincosTest(LOGICAL,68)@2
    signOfSelectionSignal_uid69_sincosTest_q <= not (redist13_xMSB_uid67_sincosTest_b_1_q);

    -- twoToMiSiXip_uid72_sincosTest(BITSELECT,71)@2
    twoToMiSiXip_uid72_sincosTest_b <= STD_LOGIC_VECTOR(xip1_2_uid64_sincosTest_b(22 downto 2));

    -- yip1E_3_uid77_sincosTest(ADDSUB,76)@2
    yip1E_3_uid77_sincosTest_s <= signOfSelectionSignal_uid69_sincosTest_q;
    yip1E_3_uid77_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_2_uid65_sincosTest_b(22)) & yip1_2_uid65_sincosTest_b));
    yip1E_3_uid77_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 21 => twoToMiSiXip_uid72_sincosTest_b(20)) & twoToMiSiXip_uid72_sincosTest_b));
    yip1E_3_uid77_sincosTest_combproc: PROCESS (yip1E_3_uid77_sincosTest_a, yip1E_3_uid77_sincosTest_b, yip1E_3_uid77_sincosTest_s)
    BEGIN
        IF (yip1E_3_uid77_sincosTest_s = "1") THEN
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) + SIGNED(yip1E_3_uid77_sincosTest_b));
        ELSE
            yip1E_3_uid77_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_3_uid77_sincosTest_a) - SIGNED(yip1E_3_uid77_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_3_uid77_sincosTest_q <= yip1E_3_uid77_sincosTest_o(23 downto 0);

    -- yip1_3_uid81_sincosTest(BITSELECT,80)@2
    yip1_3_uid81_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_3_uid77_sincosTest_q(22 downto 0));
    yip1_3_uid81_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid81_sincosTest_in(22 downto 0));

    -- yip1E_4_uid93_sincosTest(ADDSUB,92)@2
    yip1E_4_uid93_sincosTest_s <= signOfSelectionSignal_uid85_sincosTest_q;
    yip1E_4_uid93_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_3_uid81_sincosTest_b(22)) & yip1_3_uid81_sincosTest_b));
    yip1E_4_uid93_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => twoToMiSiXip_uid88_sincosTest_b(19)) & twoToMiSiXip_uid88_sincosTest_b));
    yip1E_4_uid93_sincosTest_combproc: PROCESS (yip1E_4_uid93_sincosTest_a, yip1E_4_uid93_sincosTest_b, yip1E_4_uid93_sincosTest_s)
    BEGIN
        IF (yip1E_4_uid93_sincosTest_s = "1") THEN
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) + SIGNED(yip1E_4_uid93_sincosTest_b));
        ELSE
            yip1E_4_uid93_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_4_uid93_sincosTest_a) - SIGNED(yip1E_4_uid93_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_4_uid93_sincosTest_q <= yip1E_4_uid93_sincosTest_o(23 downto 0);

    -- yip1_4_uid97_sincosTest(BITSELECT,96)@2
    yip1_4_uid97_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_4_uid93_sincosTest_q(22 downto 0));
    yip1_4_uid97_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid97_sincosTest_in(22 downto 0));

    -- twoToMiSiYip_uid105_sincosTest(BITSELECT,104)@2
    twoToMiSiYip_uid105_sincosTest_b <= STD_LOGIC_VECTOR(yip1_4_uid97_sincosTest_b(22 downto 4));

    -- twoToMiSiYip_uid89_sincosTest(BITSELECT,88)@2
    twoToMiSiYip_uid89_sincosTest_b <= STD_LOGIC_VECTOR(yip1_3_uid81_sincosTest_b(22 downto 3));

    -- xip1E_4_uid92_sincosTest(ADDSUB,91)@2
    xip1E_4_uid92_sincosTest_s <= redist12_xMSB_uid83_sincosTest_b_1_q;
    xip1E_4_uid92_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1_3_uid80_sincosTest_b(22)) & xip1_3_uid80_sincosTest_b));
    xip1E_4_uid92_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 20 => twoToMiSiYip_uid89_sincosTest_b(19)) & twoToMiSiYip_uid89_sincosTest_b));
    xip1E_4_uid92_sincosTest_combproc: PROCESS (xip1E_4_uid92_sincosTest_a, xip1E_4_uid92_sincosTest_b, xip1E_4_uid92_sincosTest_s)
    BEGIN
        IF (xip1E_4_uid92_sincosTest_s = "1") THEN
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) + SIGNED(xip1E_4_uid92_sincosTest_b));
        ELSE
            xip1E_4_uid92_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_4_uid92_sincosTest_a) - SIGNED(xip1E_4_uid92_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_4_uid92_sincosTest_q <= xip1E_4_uid92_sincosTest_o(23 downto 0);

    -- xip1_4_uid96_sincosTest(BITSELECT,95)@2
    xip1_4_uid96_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_4_uid92_sincosTest_q(22 downto 0));
    xip1_4_uid96_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid96_sincosTest_in(22 downto 0));

    -- xip1E_5_uid108_sincosTest(ADDSUB,107)@2
    xip1E_5_uid108_sincosTest_s <= xMSB_uid99_sincosTest_b;
    xip1E_5_uid108_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1_4_uid96_sincosTest_b(22)) & xip1_4_uid96_sincosTest_b));
    xip1E_5_uid108_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => twoToMiSiYip_uid105_sincosTest_b(18)) & twoToMiSiYip_uid105_sincosTest_b));
    xip1E_5_uid108_sincosTest_combproc: PROCESS (xip1E_5_uid108_sincosTest_a, xip1E_5_uid108_sincosTest_b, xip1E_5_uid108_sincosTest_s)
    BEGIN
        IF (xip1E_5_uid108_sincosTest_s = "1") THEN
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) + SIGNED(xip1E_5_uid108_sincosTest_b));
        ELSE
            xip1E_5_uid108_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_5_uid108_sincosTest_a) - SIGNED(xip1E_5_uid108_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_5_uid108_sincosTest_q <= xip1E_5_uid108_sincosTest_o(23 downto 0);

    -- xip1_5_uid112_sincosTest(BITSELECT,111)@2
    xip1_5_uid112_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_5_uid108_sincosTest_q(22 downto 0));
    xip1_5_uid112_sincosTest_b <= STD_LOGIC_VECTOR(xip1_5_uid112_sincosTest_in(22 downto 0));

    -- redist10_xip1_5_uid112_sincosTest_b_1(DELAY,242)
    redist10_xip1_5_uid112_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xip1_5_uid112_sincosTest_b, xout => redist10_xip1_5_uid112_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- twoToMiSiXip_uid120_sincosTest(BITSELECT,119)@3
    twoToMiSiXip_uid120_sincosTest_b <= STD_LOGIC_VECTOR(redist10_xip1_5_uid112_sincosTest_b_1_q(22 downto 5));

    -- signOfSelectionSignal_uid101_sincosTest(LOGICAL,100)@2
    signOfSelectionSignal_uid101_sincosTest_q <= not (xMSB_uid99_sincosTest_b);

    -- twoToMiSiXip_uid104_sincosTest(BITSELECT,103)@2
    twoToMiSiXip_uid104_sincosTest_b <= STD_LOGIC_VECTOR(xip1_4_uid96_sincosTest_b(22 downto 4));

    -- yip1E_5_uid109_sincosTest(ADDSUB,108)@2
    yip1E_5_uid109_sincosTest_s <= signOfSelectionSignal_uid101_sincosTest_q;
    yip1E_5_uid109_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_4_uid97_sincosTest_b(22)) & yip1_4_uid97_sincosTest_b));
    yip1E_5_uid109_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 19 => twoToMiSiXip_uid104_sincosTest_b(18)) & twoToMiSiXip_uid104_sincosTest_b));
    yip1E_5_uid109_sincosTest_combproc: PROCESS (yip1E_5_uid109_sincosTest_a, yip1E_5_uid109_sincosTest_b, yip1E_5_uid109_sincosTest_s)
    BEGIN
        IF (yip1E_5_uid109_sincosTest_s = "1") THEN
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) + SIGNED(yip1E_5_uid109_sincosTest_b));
        ELSE
            yip1E_5_uid109_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_5_uid109_sincosTest_a) - SIGNED(yip1E_5_uid109_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_5_uid109_sincosTest_q <= yip1E_5_uid109_sincosTest_o(23 downto 0);

    -- yip1_5_uid113_sincosTest(BITSELECT,112)@2
    yip1_5_uid113_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_5_uid109_sincosTest_q(22 downto 0));
    yip1_5_uid113_sincosTest_b <= STD_LOGIC_VECTOR(yip1_5_uid113_sincosTest_in(22 downto 0));

    -- redist9_yip1_5_uid113_sincosTest_b_1(DELAY,241)
    redist9_yip1_5_uid113_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 23, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => yip1_5_uid113_sincosTest_b, xout => redist9_yip1_5_uid113_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- yip1E_6_uid125_sincosTest(ADDSUB,124)@3
    yip1E_6_uid125_sincosTest_s <= signOfSelectionSignal_uid117_sincosTest_q;
    yip1E_6_uid125_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist9_yip1_5_uid113_sincosTest_b_1_q(22)) & redist9_yip1_5_uid113_sincosTest_b_1_q));
    yip1E_6_uid125_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 18 => twoToMiSiXip_uid120_sincosTest_b(17)) & twoToMiSiXip_uid120_sincosTest_b));
    yip1E_6_uid125_sincosTest_combproc: PROCESS (yip1E_6_uid125_sincosTest_a, yip1E_6_uid125_sincosTest_b, yip1E_6_uid125_sincosTest_s)
    BEGIN
        IF (yip1E_6_uid125_sincosTest_s = "1") THEN
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) + SIGNED(yip1E_6_uid125_sincosTest_b));
        ELSE
            yip1E_6_uid125_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_6_uid125_sincosTest_a) - SIGNED(yip1E_6_uid125_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_6_uid125_sincosTest_q <= yip1E_6_uid125_sincosTest_o(23 downto 0);

    -- yip1_6_uid129_sincosTest(BITSELECT,128)@3
    yip1_6_uid129_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_6_uid125_sincosTest_q(22 downto 0));
    yip1_6_uid129_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid129_sincosTest_in(22 downto 0));

    -- twoToMiSiYip_uid137_sincosTest(BITSELECT,136)@3
    twoToMiSiYip_uid137_sincosTest_b <= STD_LOGIC_VECTOR(yip1_6_uid129_sincosTest_b(22 downto 6));

    -- twoToMiSiYip_uid121_sincosTest(BITSELECT,120)@3
    twoToMiSiYip_uid121_sincosTest_b <= STD_LOGIC_VECTOR(redist9_yip1_5_uid113_sincosTest_b_1_q(22 downto 5));

    -- xip1E_6_uid124_sincosTest(ADDSUB,123)@3
    xip1E_6_uid124_sincosTest_s <= redist8_xMSB_uid115_sincosTest_b_1_q;
    xip1E_6_uid124_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => redist10_xip1_5_uid112_sincosTest_b_1_q(22)) & redist10_xip1_5_uid112_sincosTest_b_1_q));
    xip1E_6_uid124_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 18 => twoToMiSiYip_uid121_sincosTest_b(17)) & twoToMiSiYip_uid121_sincosTest_b));
    xip1E_6_uid124_sincosTest_combproc: PROCESS (xip1E_6_uid124_sincosTest_a, xip1E_6_uid124_sincosTest_b, xip1E_6_uid124_sincosTest_s)
    BEGIN
        IF (xip1E_6_uid124_sincosTest_s = "1") THEN
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) + SIGNED(xip1E_6_uid124_sincosTest_b));
        ELSE
            xip1E_6_uid124_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_6_uid124_sincosTest_a) - SIGNED(xip1E_6_uid124_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_6_uid124_sincosTest_q <= xip1E_6_uid124_sincosTest_o(23 downto 0);

    -- xip1_6_uid128_sincosTest(BITSELECT,127)@3
    xip1_6_uid128_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_6_uid124_sincosTest_q(22 downto 0));
    xip1_6_uid128_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid128_sincosTest_in(22 downto 0));

    -- xip1E_7_uid140_sincosTest(ADDSUB,139)@3
    xip1E_7_uid140_sincosTest_s <= redist7_xMSB_uid131_sincosTest_b_1_q;
    xip1E_7_uid140_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1_6_uid128_sincosTest_b(22)) & xip1_6_uid128_sincosTest_b));
    xip1E_7_uid140_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 17 => twoToMiSiYip_uid137_sincosTest_b(16)) & twoToMiSiYip_uid137_sincosTest_b));
    xip1E_7_uid140_sincosTest_combproc: PROCESS (xip1E_7_uid140_sincosTest_a, xip1E_7_uid140_sincosTest_b, xip1E_7_uid140_sincosTest_s)
    BEGIN
        IF (xip1E_7_uid140_sincosTest_s = "1") THEN
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) + SIGNED(xip1E_7_uid140_sincosTest_b));
        ELSE
            xip1E_7_uid140_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_7_uid140_sincosTest_a) - SIGNED(xip1E_7_uid140_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_7_uid140_sincosTest_q <= xip1E_7_uid140_sincosTest_o(23 downto 0);

    -- xip1_7_uid147_sincosTest(BITSELECT,146)@3
    xip1_7_uid147_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_7_uid140_sincosTest_q(22 downto 0));
    xip1_7_uid147_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid147_sincosTest_in(22 downto 0));

    -- twoToMiSiXip_uid155_sincosTest(BITSELECT,154)@3
    twoToMiSiXip_uid155_sincosTest_b <= STD_LOGIC_VECTOR(xip1_7_uid147_sincosTest_b(22 downto 7));

    -- signOfSelectionSignal_uid133_sincosTest(LOGICAL,132)@3
    signOfSelectionSignal_uid133_sincosTest_q <= not (redist7_xMSB_uid131_sincosTest_b_1_q);

    -- twoToMiSiXip_uid136_sincosTest(BITSELECT,135)@3
    twoToMiSiXip_uid136_sincosTest_b <= STD_LOGIC_VECTOR(xip1_6_uid128_sincosTest_b(22 downto 6));

    -- yip1E_7_uid141_sincosTest(ADDSUB,140)@3
    yip1E_7_uid141_sincosTest_s <= signOfSelectionSignal_uid133_sincosTest_q;
    yip1E_7_uid141_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_6_uid129_sincosTest_b(22)) & yip1_6_uid129_sincosTest_b));
    yip1E_7_uid141_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 17 => twoToMiSiXip_uid136_sincosTest_b(16)) & twoToMiSiXip_uid136_sincosTest_b));
    yip1E_7_uid141_sincosTest_combproc: PROCESS (yip1E_7_uid141_sincosTest_a, yip1E_7_uid141_sincosTest_b, yip1E_7_uid141_sincosTest_s)
    BEGIN
        IF (yip1E_7_uid141_sincosTest_s = "1") THEN
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) + SIGNED(yip1E_7_uid141_sincosTest_b));
        ELSE
            yip1E_7_uid141_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_7_uid141_sincosTest_a) - SIGNED(yip1E_7_uid141_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_7_uid141_sincosTest_q <= yip1E_7_uid141_sincosTest_o(23 downto 0);

    -- yip1_7_uid148_sincosTest(BITSELECT,147)@3
    yip1_7_uid148_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_7_uid141_sincosTest_q(22 downto 0));
    yip1_7_uid148_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid148_sincosTest_in(22 downto 0));

    -- yip1E_8_uid160_sincosTest(ADDSUB,159)@3
    yip1E_8_uid160_sincosTest_s <= signOfSelectionSignal_uid152_sincosTest_q;
    yip1E_8_uid160_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_7_uid148_sincosTest_b(22)) & yip1_7_uid148_sincosTest_b));
    yip1E_8_uid160_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 16 => twoToMiSiXip_uid155_sincosTest_b(15)) & twoToMiSiXip_uid155_sincosTest_b));
    yip1E_8_uid160_sincosTest_combproc: PROCESS (yip1E_8_uid160_sincosTest_a, yip1E_8_uid160_sincosTest_b, yip1E_8_uid160_sincosTest_s)
    BEGIN
        IF (yip1E_8_uid160_sincosTest_s = "1") THEN
            yip1E_8_uid160_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid160_sincosTest_a) + SIGNED(yip1E_8_uid160_sincosTest_b));
        ELSE
            yip1E_8_uid160_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_8_uid160_sincosTest_a) - SIGNED(yip1E_8_uid160_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_8_uid160_sincosTest_q <= yip1E_8_uid160_sincosTest_o(23 downto 0);

    -- yip1_8_uid167_sincosTest(BITSELECT,166)@3
    yip1_8_uid167_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_8_uid160_sincosTest_q(22 downto 0));
    yip1_8_uid167_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid167_sincosTest_in(22 downto 0));

    -- twoToMiSiYip_uid175_sincosTest(BITSELECT,174)@3
    twoToMiSiYip_uid175_sincosTest_b <= STD_LOGIC_VECTOR(yip1_8_uid167_sincosTest_b(22 downto 8));

    -- twoToMiSiYip_uid156_sincosTest(BITSELECT,155)@3
    twoToMiSiYip_uid156_sincosTest_b <= STD_LOGIC_VECTOR(yip1_7_uid148_sincosTest_b(22 downto 7));

    -- xip1E_8_uid159_sincosTest(ADDSUB,158)@3
    xip1E_8_uid159_sincosTest_s <= redist6_xMSB_uid150_sincosTest_b_1_q;
    xip1E_8_uid159_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1_7_uid147_sincosTest_b(22)) & xip1_7_uid147_sincosTest_b));
    xip1E_8_uid159_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 16 => twoToMiSiYip_uid156_sincosTest_b(15)) & twoToMiSiYip_uid156_sincosTest_b));
    xip1E_8_uid159_sincosTest_combproc: PROCESS (xip1E_8_uid159_sincosTest_a, xip1E_8_uid159_sincosTest_b, xip1E_8_uid159_sincosTest_s)
    BEGIN
        IF (xip1E_8_uid159_sincosTest_s = "1") THEN
            xip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid159_sincosTest_a) + SIGNED(xip1E_8_uid159_sincosTest_b));
        ELSE
            xip1E_8_uid159_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_8_uid159_sincosTest_a) - SIGNED(xip1E_8_uid159_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_8_uid159_sincosTest_q <= xip1E_8_uid159_sincosTest_o(23 downto 0);

    -- xip1_8_uid166_sincosTest(BITSELECT,165)@3
    xip1_8_uid166_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_8_uid159_sincosTest_q(22 downto 0));
    xip1_8_uid166_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid166_sincosTest_in(22 downto 0));

    -- xip1E_9_uid178_sincosTest(ADDSUB,177)@3
    xip1E_9_uid178_sincosTest_s <= redist5_xMSB_uid169_sincosTest_b_1_q;
    xip1E_9_uid178_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1_8_uid166_sincosTest_b(22)) & xip1_8_uid166_sincosTest_b));
    xip1E_9_uid178_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 15 => twoToMiSiYip_uid175_sincosTest_b(14)) & twoToMiSiYip_uid175_sincosTest_b));
    xip1E_9_uid178_sincosTest_combproc: PROCESS (xip1E_9_uid178_sincosTest_a, xip1E_9_uid178_sincosTest_b, xip1E_9_uid178_sincosTest_s)
    BEGIN
        IF (xip1E_9_uid178_sincosTest_s = "1") THEN
            xip1E_9_uid178_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid178_sincosTest_a) + SIGNED(xip1E_9_uid178_sincosTest_b));
        ELSE
            xip1E_9_uid178_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_9_uid178_sincosTest_a) - SIGNED(xip1E_9_uid178_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_9_uid178_sincosTest_q <= xip1E_9_uid178_sincosTest_o(23 downto 0);

    -- xip1_9_uid185_sincosTest(BITSELECT,184)@3
    xip1_9_uid185_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_9_uid178_sincosTest_q(22 downto 0));
    xip1_9_uid185_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid185_sincosTest_in(22 downto 0));

    -- twoToMiSiXip_uid193_sincosTest(BITSELECT,192)@3
    twoToMiSiXip_uid193_sincosTest_b <= STD_LOGIC_VECTOR(xip1_9_uid185_sincosTest_b(22 downto 9));

    -- signOfSelectionSignal_uid171_sincosTest(LOGICAL,170)@3
    signOfSelectionSignal_uid171_sincosTest_q <= not (redist5_xMSB_uid169_sincosTest_b_1_q);

    -- twoToMiSiXip_uid174_sincosTest(BITSELECT,173)@3
    twoToMiSiXip_uid174_sincosTest_b <= STD_LOGIC_VECTOR(xip1_8_uid166_sincosTest_b(22 downto 8));

    -- yip1E_9_uid179_sincosTest(ADDSUB,178)@3
    yip1E_9_uid179_sincosTest_s <= signOfSelectionSignal_uid171_sincosTest_q;
    yip1E_9_uid179_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_8_uid167_sincosTest_b(22)) & yip1_8_uid167_sincosTest_b));
    yip1E_9_uid179_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 15 => twoToMiSiXip_uid174_sincosTest_b(14)) & twoToMiSiXip_uid174_sincosTest_b));
    yip1E_9_uid179_sincosTest_combproc: PROCESS (yip1E_9_uid179_sincosTest_a, yip1E_9_uid179_sincosTest_b, yip1E_9_uid179_sincosTest_s)
    BEGIN
        IF (yip1E_9_uid179_sincosTest_s = "1") THEN
            yip1E_9_uid179_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid179_sincosTest_a) + SIGNED(yip1E_9_uid179_sincosTest_b));
        ELSE
            yip1E_9_uid179_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_9_uid179_sincosTest_a) - SIGNED(yip1E_9_uid179_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_9_uid179_sincosTest_q <= yip1E_9_uid179_sincosTest_o(23 downto 0);

    -- yip1_9_uid186_sincosTest(BITSELECT,185)@3
    yip1_9_uid186_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_9_uid179_sincosTest_q(22 downto 0));
    yip1_9_uid186_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid186_sincosTest_in(22 downto 0));

    -- yip1E_10_uid198_sincosTest(ADDSUB,197)@3
    yip1E_10_uid198_sincosTest_s <= signOfSelectionSignal_uid190_sincosTest_q;
    yip1E_10_uid198_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => yip1_9_uid186_sincosTest_b(22)) & yip1_9_uid186_sincosTest_b));
    yip1E_10_uid198_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 14 => twoToMiSiXip_uid193_sincosTest_b(13)) & twoToMiSiXip_uid193_sincosTest_b));
    yip1E_10_uid198_sincosTest_combproc: PROCESS (yip1E_10_uid198_sincosTest_a, yip1E_10_uid198_sincosTest_b, yip1E_10_uid198_sincosTest_s)
    BEGIN
        IF (yip1E_10_uid198_sincosTest_s = "1") THEN
            yip1E_10_uid198_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid198_sincosTest_a) + SIGNED(yip1E_10_uid198_sincosTest_b));
        ELSE
            yip1E_10_uid198_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(yip1E_10_uid198_sincosTest_a) - SIGNED(yip1E_10_uid198_sincosTest_b));
        END IF;
    END PROCESS;
    yip1E_10_uid198_sincosTest_q <= yip1E_10_uid198_sincosTest_o(23 downto 0);

    -- yip1_10_uid205_sincosTest(BITSELECT,204)@3
    yip1_10_uid205_sincosTest_in <= STD_LOGIC_VECTOR(yip1E_10_uid198_sincosTest_q(22 downto 0));
    yip1_10_uid205_sincosTest_b <= STD_LOGIC_VECTOR(yip1_10_uid205_sincosTest_in(22 downto 0));

    -- ySumPreRnd_uid211_sincosTest(BITSELECT,210)@3
    ySumPreRnd_uid211_sincosTest_in <= yip1_10_uid205_sincosTest_b(21 downto 0);
    ySumPreRnd_uid211_sincosTest_b <= ySumPreRnd_uid211_sincosTest_in(21 downto 11);

    -- redist2_ySumPreRnd_uid211_sincosTest_b_1(DELAY,234)
    redist2_ySumPreRnd_uid211_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => ySumPreRnd_uid211_sincosTest_b, xout => redist2_ySumPreRnd_uid211_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- ySumPostRnd_uid214_sincosTest(ADD,213)@4
    ySumPostRnd_uid214_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist2_ySumPreRnd_uid211_sincosTest_b_1_q);
    ySumPostRnd_uid214_sincosTest_b <= STD_LOGIC_VECTOR("00000000000" & VCC_q);
    ySumPostRnd_uid214_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(ySumPostRnd_uid214_sincosTest_a) + UNSIGNED(ySumPostRnd_uid214_sincosTest_b));
    ySumPostRnd_uid214_sincosTest_q <= ySumPostRnd_uid214_sincosTest_o(11 downto 0);

    -- yPostExc_uid216_sincosTest(BITSELECT,215)@4
    yPostExc_uid216_sincosTest_in <= STD_LOGIC_VECTOR(ySumPostRnd_uid214_sincosTest_q(10 downto 0));
    yPostExc_uid216_sincosTest_b <= STD_LOGIC_VECTOR(yPostExc_uid216_sincosTest_in(10 downto 1));

    -- cstZeroForAddSub_uid224_sincosTest(CONSTANT,223)
    cstZeroForAddSub_uid224_sincosTest_q <= "0000000000";

    -- sinPostNeg_uid226_sincosTest(ADDSUB,225)@4
    sinPostNeg_uid226_sincosTest_s <= invSinNegCond_uid225_sincosTest_q;
    sinPostNeg_uid226_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => cstZeroForAddSub_uid224_sincosTest_q(9)) & cstZeroForAddSub_uid224_sincosTest_q));
    sinPostNeg_uid226_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => yPostExc_uid216_sincosTest_b(9)) & yPostExc_uid216_sincosTest_b));
    sinPostNeg_uid226_sincosTest_combproc: PROCESS (sinPostNeg_uid226_sincosTest_a, sinPostNeg_uid226_sincosTest_b, sinPostNeg_uid226_sincosTest_s)
    BEGIN
        IF (sinPostNeg_uid226_sincosTest_s = "1") THEN
            sinPostNeg_uid226_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid226_sincosTest_a) + SIGNED(sinPostNeg_uid226_sincosTest_b));
        ELSE
            sinPostNeg_uid226_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(sinPostNeg_uid226_sincosTest_a) - SIGNED(sinPostNeg_uid226_sincosTest_b));
        END IF;
    END PROCESS;
    sinPostNeg_uid226_sincosTest_q <= sinPostNeg_uid226_sincosTest_o(10 downto 0);

    -- invCosNegCond_uid227_sincosTest(LOGICAL,226)@1 + 1
    invCosNegCond_uid227_sincosTest_qi <= not (sinNegCond2_uid218_sincosTest_q);
    invCosNegCond_uid227_sincosTest_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCosNegCond_uid227_sincosTest_qi, xout => invCosNegCond_uid227_sincosTest_q, clk => clk, aclr => areset );

    -- redist0_invCosNegCond_uid227_sincosTest_q_3(DELAY,232)
    redist0_invCosNegCond_uid227_sincosTest_q_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => invCosNegCond_uid227_sincosTest_q, xout => redist0_invCosNegCond_uid227_sincosTest_q_3_q, clk => clk, aclr => areset );

    -- twoToMiSiYip_uid194_sincosTest(BITSELECT,193)@3
    twoToMiSiYip_uid194_sincosTest_b <= STD_LOGIC_VECTOR(yip1_9_uid186_sincosTest_b(22 downto 9));

    -- xip1E_10_uid197_sincosTest(ADDSUB,196)@3
    xip1E_10_uid197_sincosTest_s <= redist4_xMSB_uid188_sincosTest_b_1_q;
    xip1E_10_uid197_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 23 => xip1_9_uid185_sincosTest_b(22)) & xip1_9_uid185_sincosTest_b));
    xip1E_10_uid197_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 14 => twoToMiSiYip_uid194_sincosTest_b(13)) & twoToMiSiYip_uid194_sincosTest_b));
    xip1E_10_uid197_sincosTest_combproc: PROCESS (xip1E_10_uid197_sincosTest_a, xip1E_10_uid197_sincosTest_b, xip1E_10_uid197_sincosTest_s)
    BEGIN
        IF (xip1E_10_uid197_sincosTest_s = "1") THEN
            xip1E_10_uid197_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid197_sincosTest_a) + SIGNED(xip1E_10_uid197_sincosTest_b));
        ELSE
            xip1E_10_uid197_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(xip1E_10_uid197_sincosTest_a) - SIGNED(xip1E_10_uid197_sincosTest_b));
        END IF;
    END PROCESS;
    xip1E_10_uid197_sincosTest_q <= xip1E_10_uid197_sincosTest_o(23 downto 0);

    -- xip1_10_uid204_sincosTest(BITSELECT,203)@3
    xip1_10_uid204_sincosTest_in <= STD_LOGIC_VECTOR(xip1E_10_uid197_sincosTest_q(22 downto 0));
    xip1_10_uid204_sincosTest_b <= STD_LOGIC_VECTOR(xip1_10_uid204_sincosTest_in(22 downto 0));

    -- xSumPreRnd_uid207_sincosTest(BITSELECT,206)@3
    xSumPreRnd_uid207_sincosTest_in <= xip1_10_uid204_sincosTest_b(21 downto 0);
    xSumPreRnd_uid207_sincosTest_b <= xSumPreRnd_uid207_sincosTest_in(21 downto 11);

    -- redist3_xSumPreRnd_uid207_sincosTest_b_1(DELAY,235)
    redist3_xSumPreRnd_uid207_sincosTest_b_1 : dspba_delay
    GENERIC MAP ( width => 11, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xSumPreRnd_uid207_sincosTest_b, xout => redist3_xSumPreRnd_uid207_sincosTest_b_1_q, clk => clk, aclr => areset );

    -- xSumPostRnd_uid210_sincosTest(ADD,209)@4
    xSumPostRnd_uid210_sincosTest_a <= STD_LOGIC_VECTOR("0" & redist3_xSumPreRnd_uid207_sincosTest_b_1_q);
    xSumPostRnd_uid210_sincosTest_b <= STD_LOGIC_VECTOR("00000000000" & VCC_q);
    xSumPostRnd_uid210_sincosTest_o <= STD_LOGIC_VECTOR(UNSIGNED(xSumPostRnd_uid210_sincosTest_a) + UNSIGNED(xSumPostRnd_uid210_sincosTest_b));
    xSumPostRnd_uid210_sincosTest_q <= xSumPostRnd_uid210_sincosTest_o(11 downto 0);

    -- xPostExc_uid215_sincosTest(BITSELECT,214)@4
    xPostExc_uid215_sincosTest_in <= STD_LOGIC_VECTOR(xSumPostRnd_uid210_sincosTest_q(10 downto 0));
    xPostExc_uid215_sincosTest_b <= STD_LOGIC_VECTOR(xPostExc_uid215_sincosTest_in(10 downto 1));

    -- cosPostNeg_uid228_sincosTest(ADDSUB,227)@4
    cosPostNeg_uid228_sincosTest_s <= redist0_invCosNegCond_uid227_sincosTest_q_3_q;
    cosPostNeg_uid228_sincosTest_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => cstZeroForAddSub_uid224_sincosTest_q(9)) & cstZeroForAddSub_uid224_sincosTest_q));
    cosPostNeg_uid228_sincosTest_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 10 => xPostExc_uid215_sincosTest_b(9)) & xPostExc_uid215_sincosTest_b));
    cosPostNeg_uid228_sincosTest_combproc: PROCESS (cosPostNeg_uid228_sincosTest_a, cosPostNeg_uid228_sincosTest_b, cosPostNeg_uid228_sincosTest_s)
    BEGIN
        IF (cosPostNeg_uid228_sincosTest_s = "1") THEN
            cosPostNeg_uid228_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid228_sincosTest_a) + SIGNED(cosPostNeg_uid228_sincosTest_b));
        ELSE
            cosPostNeg_uid228_sincosTest_o <= STD_LOGIC_VECTOR(SIGNED(cosPostNeg_uid228_sincosTest_a) - SIGNED(cosPostNeg_uid228_sincosTest_b));
        END IF;
    END PROCESS;
    cosPostNeg_uid228_sincosTest_q <= cosPostNeg_uid228_sincosTest_o(10 downto 0);

    -- redist15_firstQuadrant_uid15_sincosTest_b_3(DELAY,247)
    redist15_firstQuadrant_uid15_sincosTest_b_3 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => firstQuadrant_uid15_sincosTest_b, xout => redist15_firstQuadrant_uid15_sincosTest_b_3_q, clk => clk, aclr => areset );

    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- xPostRR_uid230_sincosTest(MUX,229)@4
    xPostRR_uid230_sincosTest_s <= redist15_firstQuadrant_uid15_sincosTest_b_3_q;
    xPostRR_uid230_sincosTest_combproc: PROCESS (xPostRR_uid230_sincosTest_s, cosPostNeg_uid228_sincosTest_q, sinPostNeg_uid226_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid230_sincosTest_s) IS
            WHEN "0" => xPostRR_uid230_sincosTest_q <= cosPostNeg_uid228_sincosTest_q;
            WHEN "1" => xPostRR_uid230_sincosTest_q <= sinPostNeg_uid226_sincosTest_q;
            WHEN OTHERS => xPostRR_uid230_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- sin_uid232_sincosTest(BITSELECT,231)@4
    sin_uid232_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid230_sincosTest_q(9 downto 0));
    sin_uid232_sincosTest_b <= STD_LOGIC_VECTOR(sin_uid232_sincosTest_in(9 downto 0));

    -- xPostRR_uid229_sincosTest(MUX,228)@4
    xPostRR_uid229_sincosTest_s <= redist15_firstQuadrant_uid15_sincosTest_b_3_q;
    xPostRR_uid229_sincosTest_combproc: PROCESS (xPostRR_uid229_sincosTest_s, sinPostNeg_uid226_sincosTest_q, cosPostNeg_uid228_sincosTest_q)
    BEGIN
        CASE (xPostRR_uid229_sincosTest_s) IS
            WHEN "0" => xPostRR_uid229_sincosTest_q <= sinPostNeg_uid226_sincosTest_q;
            WHEN "1" => xPostRR_uid229_sincosTest_q <= cosPostNeg_uid228_sincosTest_q;
            WHEN OTHERS => xPostRR_uid229_sincosTest_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- cos_uid231_sincosTest(BITSELECT,230)@4
    cos_uid231_sincosTest_in <= STD_LOGIC_VECTOR(xPostRR_uid229_sincosTest_q(9 downto 0));
    cos_uid231_sincosTest_b <= STD_LOGIC_VECTOR(cos_uid231_sincosTest_in(9 downto 0));

    -- xOut(GPOUT,4)@4
    c <= cos_uid231_sincosTest_b;
    s <= sin_uid232_sincosTest_b;

END normal;
