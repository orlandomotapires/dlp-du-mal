-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 25.1std.0 Build 1129 10/21/2025 SC Lite Edition"

-- DATE "10/15/2026 18:36:40"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Altera FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	controlador_esteira IS
    PORT (
	clk_50 : IN std_logic;
	rst : IN std_logic;
	sentido : IN std_logic;
	pausa : IN std_logic;
	modo : IN std_logic_vector(1 DOWNTO 0);
	led_cheio : BUFFER std_logic;
	led_vazio : BUFFER std_logic;
	led_alerta : BUFFER std_logic;
	led_erro : BUFFER std_logic;
	led_div : BUFFER std_logic;
	display1 : BUFFER std_logic_vector(6 DOWNTO 0);
	display0 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END controlador_esteira;

-- Design Ports Information
-- led_cheio	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_vazio	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_alerta	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_erro	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_div	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display1[0]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display1[1]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display1[2]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display1[3]	=>  Location: PIN_AA18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display1[4]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display1[5]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display1[6]	=>  Location: PIN_U22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display0[0]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display0[1]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display0[2]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display0[3]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display0[4]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display0[5]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- display0[6]	=>  Location: PIN_AA22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- modo[0]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- modo[1]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_50	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sentido	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pausa	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF controlador_esteira IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50 : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_sentido : std_logic;
SIGNAL ww_pausa : std_logic;
SIGNAL ww_modo : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_led_cheio : std_logic;
SIGNAL ww_led_vazio : std_logic;
SIGNAL ww_led_alerta : std_logic;
SIGNAL ww_led_erro : std_logic;
SIGNAL ww_led_div : std_logic;
SIGNAL ww_display1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_display0 : std_logic_vector(6 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk_50~input_o\ : std_logic;
SIGNAL \clk_50~inputCLKENA0_outclk\ : std_logic;
SIGNAL \Add2~17_sumout\ : std_logic;
SIGNAL \Add1~17_sumout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \sentido~input_o\ : std_logic;
SIGNAL \pausa~input_o\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \Add0~94\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \cont_div[6]~0_combout\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \sinal_div~0_combout\ : std_logic;
SIGNAL \sinal_div~q\ : std_logic;
SIGNAL \pulso_avanco~0_combout\ : std_logic;
SIGNAL \pulso_avanco~q\ : std_logic;
SIGNAL \Add2~26\ : std_logic;
SIGNAL \Add2~21_sumout\ : std_logic;
SIGNAL \Add1~18\ : std_logic;
SIGNAL \Add1~2\ : std_logic;
SIGNAL \Add1~26\ : std_logic;
SIGNAL \Add1~21_sumout\ : std_logic;
SIGNAL \Add2~22\ : std_logic;
SIGNAL \Add2~9_sumout\ : std_logic;
SIGNAL \Add1~22\ : std_logic;
SIGNAL \Add1~9_sumout\ : std_logic;
SIGNAL \Add2~10\ : std_logic;
SIGNAL \Add2~5_sumout\ : std_logic;
SIGNAL \Add1~10\ : std_logic;
SIGNAL \Add1~5_sumout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Add2~6\ : std_logic;
SIGNAL \Add2~13_sumout\ : std_logic;
SIGNAL \Add1~6\ : std_logic;
SIGNAL \Add1~13_sumout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \N[6]~0_combout\ : std_logic;
SIGNAL \Add2~18\ : std_logic;
SIGNAL \Add2~1_sumout\ : std_logic;
SIGNAL \Add1~1_sumout\ : std_logic;
SIGNAL \Add2~2\ : std_logic;
SIGNAL \Add2~25_sumout\ : std_logic;
SIGNAL \Add1~25_sumout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Equal2~1_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \erro~0_combout\ : std_logic;
SIGNAL \erro~q\ : std_logic;
SIGNAL \modo[1]~input_o\ : std_logic;
SIGNAL \modo[0]~input_o\ : std_logic;
SIGNAL \Add3~2\ : std_logic;
SIGNAL \Add3~6\ : std_logic;
SIGNAL \Add3~10\ : std_logic;
SIGNAL \Add3~14\ : std_logic;
SIGNAL \Add3~18\ : std_logic;
SIGNAL \Add3~22\ : std_logic;
SIGNAL \Add3~25_sumout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \Add1~14\ : std_logic;
SIGNAL \Add1~29_sumout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \P[6]~0_combout\ : std_logic;
SIGNAL \P[6]~1_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Add3~21_sumout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Add3~17_sumout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Add3~13_sumout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~22_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~18\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~10\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~14\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~6\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~1_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~5_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[18]~5_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~13_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~9_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~7_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_4~17_sumout\ : std_logic;
SIGNAL \Add3~9_sumout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~26_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~22\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~18\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~10\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~14\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~6_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~1_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~9_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~3_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~13_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[17]~4_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[16]~1_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[15]~9_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~17_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_5~21_sumout\ : std_logic;
SIGNAL \Add3~5_sumout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~26_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~22\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~18\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~14\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~10\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~6_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~1_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~9_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[22]~2_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[21]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~13_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|StageOut[20]~11_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~17_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_6~21_sumout\ : std_logic;
SIGNAL \Add3~1_sumout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_7~26_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_7~22_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_7~18_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_7~14_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_7~10_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_7~6_cout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|op_7~1_sumout\ : std_logic;
SIGNAL \DEC_DEZ|Mux6~0_combout\ : std_logic;
SIGNAL \DEC_DEZ|Mux5~0_combout\ : std_logic;
SIGNAL \DEC_DEZ|Mux4~0_combout\ : std_logic;
SIGNAL \DEC_DEZ|Mux3~0_combout\ : std_logic;
SIGNAL \DEC_DEZ|Mux2~0_combout\ : std_logic;
SIGNAL \DEC_DEZ|Mux1~0_combout\ : std_logic;
SIGNAL \DEC_DEZ|Mux0~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~14_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~6\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~22\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~18\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~10\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~1_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~9_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[24]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[24]~9_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~17_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[22]~18_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~21_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[22]~17_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_4~5_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~18_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~6\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~10\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~26\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~22\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~14\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~1_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~13_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~21_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[23]~11_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[23]~12_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[22]~15_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~25_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[21]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~9_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_5~5_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~22_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~6\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~10\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~14\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~30\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~26\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~18\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~1_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~17_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~7_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[32]~10_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[31]~13_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~25_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~29_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[30]~14_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[30]~16_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[29]~5_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~13_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[28]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~9_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_6~5_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~26_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~6\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~10\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~14\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~18\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~34_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~30_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~22_cout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~1_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~17_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~9_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~13_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|op_7~5_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ : std_logic;
SIGNAL \DEC_UNI|Mux6~0_combout\ : std_logic;
SIGNAL \DEC_UNI|Mux5~0_combout\ : std_logic;
SIGNAL \DEC_UNI|Mux4~0_combout\ : std_logic;
SIGNAL \DEC_UNI|Mux3~0_combout\ : std_logic;
SIGNAL \DEC_UNI|Mux2~0_combout\ : std_logic;
SIGNAL \DEC_UNI|Mux1~0_combout\ : std_logic;
SIGNAL \DEC_UNI|Mux0~0_combout\ : std_logic;
SIGNAL N : std_logic_vector(6 DOWNTO 0);
SIGNAL cont_div : std_logic_vector(24 DOWNTO 0);
SIGNAL P : std_logic_vector(6 DOWNTO 0);
SIGNAL ALT_INV_N : std_logic_vector(6 DOWNTO 0);
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~9_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_7~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~13_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~17_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~5_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~13_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_7~9_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~1_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_6~5_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~9_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_7~13_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_7~17_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\ : std_logic;
SIGNAL ALT_INV_cont_div : std_logic_vector(24 DOWNTO 0);
SIGNAL \ALT_INV_Add1~21_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~29_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add1~25_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~17_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~21_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_6~25_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ : std_logic;
SIGNAL \ALT_INV_Add3~25_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ : std_logic;
SIGNAL \ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[44]~3_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[21]~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[42]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_5~25_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[43]~1_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_4~21_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_op_6~21_sumout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[45]~6_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[28]~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL ALT_INV_P : std_logic_vector(6 DOWNTO 0);
SIGNAL \ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \DEC_UNI|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \ALT_INV_pulso_avanco~q\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[29]~5_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_op_6~29_sumout\ : std_logic;
SIGNAL \ALT_INV_Equal2~1_combout\ : std_logic;
SIGNAL \ALT_INV_erro~q\ : std_logic;
SIGNAL \ALT_INV_sinal_div~q\ : std_logic;
SIGNAL \DEC_DEZ|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_pausa~input_o\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[23]~12_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~5_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[23]~11_combout\ : std_logic;
SIGNAL \ALT_INV_P[6]~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~18_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~8_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[31]~13_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[21]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~4_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[30]~14_combout\ : std_logic;
SIGNAL \ALT_INV_sentido~input_o\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~3_combout\ : std_logic;
SIGNAL \ALT_INV_modo[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_modo[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Equal0~4_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[30]~16_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[22]~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[20]~11_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~15_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~3_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[22]~2_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[32]~7_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~9_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~8_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[15]~9_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~17_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[32]~10_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~6_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~1_combout\ : std_logic;
SIGNAL \Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~7_combout\ : std_logic;

BEGIN

ww_clk_50 <= clk_50;
ww_rst <= rst;
ww_sentido <= sentido;
ww_pausa <= pausa;
ww_modo <= modo;
led_cheio <= ww_led_cheio;
led_vazio <= ww_led_vazio;
led_alerta <= ww_led_alerta;
led_erro <= ww_led_erro;
led_div <= ww_led_div;
display1 <= ww_display1;
display0 <= ww_display0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
ALT_INV_N(3) <= NOT N(3);
\Mod0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_6~13_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_4~1_sumout\;
\ALT_INV_Add1~1_sumout\ <= NOT \Add1~1_sumout\;
\ALT_INV_Add1~9_sumout\ <= NOT \Add1~9_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_7~5_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_7~5_sumout\;
\ALT_INV_Add1~13_sumout\ <= NOT \Add1~13_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_7~1_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_5~5_sumout\;
ALT_INV_N(6) <= NOT N(6);
\ALT_INV_Add1~17_sumout\ <= NOT \Add1~17_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_7~1_sumout\;
\ALT_INV_Add1~5_sumout\ <= NOT \Add1~5_sumout\;
\ALT_INV_Add3~5_sumout\ <= NOT \Add3~5_sumout\;
ALT_INV_N(0) <= NOT N(0);
ALT_INV_N(1) <= NOT N(1);
\Mod0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_5~9_sumout\;
ALT_INV_N(4) <= NOT N(4);
ALT_INV_N(5) <= NOT N(5);
\Mod0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_6~9_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_6~1_sumout\;
\ALT_INV_Add3~13_sumout\ <= NOT \Add3~13_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_7~9_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_7~9_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_5~1_sumout\;
\ALT_INV_Add3~1_sumout\ <= NOT \Add3~1_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_6~5_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_6~5_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_4~5_sumout\;
\ALT_INV_Add3~9_sumout\ <= NOT \Add3~9_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_5~1_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_7~13_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_7~13_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_7~17_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_7~17_sumout\;
ALT_INV_N(2) <= NOT N(2);
\Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_4~1_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_6~1_sumout\;
ALT_INV_cont_div(19) <= NOT cont_div(19);
ALT_INV_cont_div(21) <= NOT cont_div(21);
ALT_INV_cont_div(15) <= NOT cont_div(15);
\ALT_INV_Add1~21_sumout\ <= NOT \Add1~21_sumout\;
ALT_INV_cont_div(12) <= NOT cont_div(12);
ALT_INV_cont_div(17) <= NOT cont_div(17);
ALT_INV_cont_div(5) <= NOT cont_div(5);
\ALT_INV_Add1~29_sumout\ <= NOT \Add1~29_sumout\;
ALT_INV_cont_div(23) <= NOT cont_div(23);
ALT_INV_cont_div(11) <= NOT cont_div(11);
ALT_INV_cont_div(10) <= NOT cont_div(10);
ALT_INV_cont_div(3) <= NOT cont_div(3);
ALT_INV_cont_div(0) <= NOT cont_div(0);
ALT_INV_cont_div(18) <= NOT cont_div(18);
ALT_INV_cont_div(20) <= NOT cont_div(20);
ALT_INV_cont_div(1) <= NOT cont_div(1);
\Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_4~5_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_6~17_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_5~13_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_4~9_sumout\;
ALT_INV_cont_div(8) <= NOT cont_div(8);
ALT_INV_cont_div(2) <= NOT cont_div(2);
ALT_INV_cont_div(24) <= NOT cont_div(24);
ALT_INV_cont_div(6) <= NOT cont_div(6);
ALT_INV_cont_div(9) <= NOT cont_div(9);
ALT_INV_cont_div(14) <= NOT cont_div(14);
ALT_INV_cont_div(16) <= NOT cont_div(16);
ALT_INV_cont_div(4) <= NOT cont_div(4);
ALT_INV_cont_div(7) <= NOT cont_div(7);
\ALT_INV_Add1~25_sumout\ <= NOT \Add1~25_sumout\;
ALT_INV_cont_div(13) <= NOT cont_div(13);
ALT_INV_cont_div(22) <= NOT cont_div(22);
\ALT_INV_Add3~17_sumout\ <= NOT \Add3~17_sumout\;
\ALT_INV_Add3~21_sumout\ <= NOT \Add3~21_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_6~13_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_5~17_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_4~9_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_4~17_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_4~13_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_6~9_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_6~25_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_6~25_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_5~9_sumout\;
\ALT_INV_Add3~25_sumout\ <= NOT \Add3~25_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_4~17_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_5~21_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_5~13_sumout\;
\ALT_INV_Mux4~0_combout\ <= NOT \Mux4~0_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[44]~3_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[21]~4_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[21]~4_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[42]~0_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_5~25_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_5~25_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[43]~1_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_6~17_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_4~21_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_4~21_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_5~21_sumout\;
\Div0|auto_generated|divider|divider|ALT_INV_op_6~21_sumout\ <= NOT \Div0|auto_generated|divider|divider|op_6~21_sumout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[45]~6_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[28]~2_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[28]~2_combout\;
\ALT_INV_Mux6~0_combout\ <= NOT \Mux6~0_combout\;
ALT_INV_P(3) <= NOT P(3);
ALT_INV_P(0) <= NOT P(0);
\ALT_INV_Mux5~0_combout\ <= NOT \Mux5~0_combout\;
\ALT_INV_Equal2~0_combout\ <= NOT \Equal2~0_combout\;
\DEC_UNI|ALT_INV_Mux0~0_combout\ <= NOT \DEC_UNI|Mux0~0_combout\;
\ALT_INV_LessThan0~0_combout\ <= NOT \LessThan0~0_combout\;
\ALT_INV_pulso_avanco~q\ <= NOT \pulso_avanco~q\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[29]~5_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[29]~5_combout\;
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_LessThan3~0_combout\ <= NOT \LessThan3~0_combout\;
\ALT_INV_Mux3~0_combout\ <= NOT \Mux3~0_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_op_6~29_sumout\ <= NOT \Mod0|auto_generated|divider|divider|op_6~29_sumout\;
\ALT_INV_Equal2~1_combout\ <= NOT \Equal2~1_combout\;
ALT_INV_P(1) <= NOT P(1);
\ALT_INV_erro~q\ <= NOT \erro~q\;
ALT_INV_P(2) <= NOT P(2);
\ALT_INV_sinal_div~q\ <= NOT \sinal_div~q\;
\DEC_DEZ|ALT_INV_Mux0~0_combout\ <= NOT \DEC_DEZ|Mux0~0_combout\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_pausa~input_o\ <= NOT \pausa~input_o\;
ALT_INV_P(6) <= NOT P(6);
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[23]~12_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[23]~12_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~5_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[18]~5_combout\;
\ALT_INV_Equal0~2_combout\ <= NOT \Equal0~2_combout\;
ALT_INV_P(4) <= NOT P(4);
\ALT_INV_Mux1~0_combout\ <= NOT \Mux1~0_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[23]~11_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[23]~11_combout\;
\ALT_INV_P[6]~0_combout\ <= NOT \P[6]~0_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~18_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[22]~18_combout\;
\ALT_INV_LessThan1~1_combout\ <= NOT \LessThan1~1_combout\;
\ALT_INV_LessThan1~2_combout\ <= NOT \LessThan1~2_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~8_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[24]~8_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[31]~13_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[31]~13_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[21]~10_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[21]~10_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~4_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[17]~4_combout\;
\ALT_INV_Mux2~0_combout\ <= NOT \Mux2~0_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[30]~14_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[30]~14_combout\;
ALT_INV_P(5) <= NOT P(5);
\ALT_INV_sentido~input_o\ <= NOT \sentido~input_o\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_LessThan1~3_combout\ <= NOT \LessThan1~3_combout\;
\ALT_INV_modo[0]~input_o\ <= NOT \modo[0]~input_o\;
\ALT_INV_modo[1]~input_o\ <= NOT \modo[1]~input_o\;
\ALT_INV_Equal0~4_combout\ <= NOT \Equal0~4_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[30]~16_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[30]~16_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[22]~0_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[22]~0_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[20]~11_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[20]~11_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~15_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[22]~15_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~3_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[17]~3_combout\;
\ALT_INV_LessThan1~0_combout\ <= NOT \LessThan1~0_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[22]~2_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[22]~2_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[32]~7_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[32]~7_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~9_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[24]~9_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~8_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[16]~8_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[15]~9_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[15]~9_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~17_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[22]~17_combout\;
\ALT_INV_Equal0~3_combout\ <= NOT \Equal0~3_combout\;
\Mod0|auto_generated|divider|divider|ALT_INV_StageOut[32]~10_combout\ <= NOT \Mod0|auto_generated|divider|divider|StageOut[32]~10_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~6_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[18]~6_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~1_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[16]~1_combout\;
\Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~7_combout\ <= NOT \Div0|auto_generated|divider|divider|StageOut[16]~7_combout\;

-- Location: IOOBUF_X0_Y18_N79
\led_cheio~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal1~1_combout\,
	devoe => ww_devoe,
	o => ww_led_cheio);

-- Location: IOOBUF_X0_Y18_N96
\led_vazio~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal2~1_combout\,
	devoe => ww_devoe,
	o => ww_led_vazio);

-- Location: IOOBUF_X0_Y18_N62
\led_alerta~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_LessThan3~0_combout\,
	devoe => ww_devoe,
	o => ww_led_alerta);

-- Location: IOOBUF_X0_Y18_N45
\led_erro~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \erro~q\,
	devoe => ww_devoe,
	o => ww_led_erro);

-- Location: IOOBUF_X0_Y19_N39
\led_div~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \sinal_div~q\,
	devoe => ww_devoe,
	o => ww_led_div);

-- Location: IOOBUF_X44_Y0_N36
\display1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_DEZ|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_display1(0));

-- Location: IOOBUF_X40_Y0_N93
\display1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_DEZ|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_display1(1));

-- Location: IOOBUF_X44_Y0_N53
\display1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_DEZ|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_display1(2));

-- Location: IOOBUF_X43_Y0_N36
\display1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_DEZ|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_display1(3));

-- Location: IOOBUF_X38_Y0_N36
\display1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_DEZ|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_display1(4));

-- Location: IOOBUF_X43_Y0_N53
\display1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_DEZ|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_display1(5));

-- Location: IOOBUF_X51_Y0_N53
\display1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_DEZ|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_display1(6));

-- Location: IOOBUF_X52_Y0_N53
\display0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_UNI|Mux6~0_combout\,
	devoe => ww_devoe,
	o => ww_display0(0));

-- Location: IOOBUF_X51_Y0_N36
\display0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_UNI|Mux5~0_combout\,
	devoe => ww_devoe,
	o => ww_display0(1));

-- Location: IOOBUF_X48_Y0_N76
\display0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_UNI|Mux4~0_combout\,
	devoe => ww_devoe,
	o => ww_display0(2));

-- Location: IOOBUF_X50_Y0_N36
\display0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_UNI|Mux3~0_combout\,
	devoe => ww_devoe,
	o => ww_display0(3));

-- Location: IOOBUF_X48_Y0_N93
\display0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_UNI|Mux2~0_combout\,
	devoe => ww_devoe,
	o => ww_display0(4));

-- Location: IOOBUF_X50_Y0_N53
\display0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_UNI|Mux1~0_combout\,
	devoe => ww_devoe,
	o => ww_display0(5));

-- Location: IOOBUF_X46_Y0_N36
\display0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \DEC_UNI|ALT_INV_Mux0~0_combout\,
	devoe => ww_devoe,
	o => ww_display0(6));

-- Location: IOIBUF_X22_Y0_N1
\clk_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_50,
	o => \clk_50~input_o\);

-- Location: CLKCTRL_G4
\clk_50~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50~input_o\,
	outclk => \clk_50~inputCLKENA0_outclk\);

-- Location: MLABCELL_X34_Y3_N30
\Add2~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~17_sumout\ = SUM(( N(0) ) + ( VCC ) + ( !VCC ))
-- \Add2~18\ = CARRY(( N(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_N(0),
	cin => GND,
	sumout => \Add2~17_sumout\,
	cout => \Add2~18\);

-- Location: LABCELL_X35_Y3_N30
\Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~17_sumout\ = SUM(( N(0) ) + ( VCC ) + ( !VCC ))
-- \Add1~18\ = CARRY(( N(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_N(0),
	cin => GND,
	sumout => \Add1~17_sumout\,
	cout => \Add1~18\);

-- Location: IOIBUF_X33_Y0_N75
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X33_Y0_N41
\sentido~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sentido,
	o => \sentido~input_o\);

-- Location: IOIBUF_X33_Y0_N58
\pausa~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pausa,
	o => \pausa~input_o\);

-- Location: LABCELL_X32_Y2_N30
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( cont_div(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~78\ = CARRY(( cont_div(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_cont_div(0),
	cin => GND,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: LABCELL_X32_Y2_N36
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( cont_div(2) ) + ( GND ) + ( \Add0~74\ ))
-- \Add0~66\ = CARRY(( cont_div(2) ) + ( GND ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(2),
	cin => \Add0~74\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: LABCELL_X32_Y2_N39
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( cont_div(3) ) + ( GND ) + ( \Add0~66\ ))
-- \Add0~30\ = CARRY(( cont_div(3) ) + ( GND ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(3),
	cin => \Add0~66\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X32_Y2_N41
\cont_div[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~29_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(3));

-- Location: LABCELL_X32_Y2_N42
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( cont_div(4) ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~62\ = CARRY(( cont_div(4) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_cont_div(4),
	cin => \Add0~30\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X32_Y2_N44
\cont_div[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~61_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(4));

-- Location: LABCELL_X32_Y2_N45
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( cont_div(5) ) + ( GND ) + ( \Add0~62\ ))
-- \Add0~58\ = CARRY(( cont_div(5) ) + ( GND ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(5),
	cin => \Add0~62\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X32_Y2_N47
\cont_div[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~57_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(5));

-- Location: LABCELL_X32_Y2_N48
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( cont_div(6) ) + ( GND ) + ( \Add0~58\ ))
-- \Add0~54\ = CARRY(( cont_div(6) ) + ( GND ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(6),
	cin => \Add0~58\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X32_Y2_N50
\cont_div[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~53_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(6));

-- Location: LABCELL_X32_Y2_N51
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( cont_div(7) ) + ( GND ) + ( \Add0~54\ ))
-- \Add0~2\ = CARRY(( cont_div(7) ) + ( GND ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(7),
	cin => \Add0~54\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: FF_X32_Y2_N53
\cont_div[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(7));

-- Location: LABCELL_X32_Y2_N54
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( cont_div(8) ) + ( GND ) + ( \Add0~2\ ))
-- \Add0~26\ = CARRY(( cont_div(8) ) + ( GND ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(8),
	cin => \Add0~2\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X32_Y2_N56
\cont_div[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(8));

-- Location: LABCELL_X32_Y2_N57
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( cont_div(9) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~22\ = CARRY(( cont_div(9) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(9),
	cin => \Add0~26\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X32_Y2_N59
\cont_div[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(9));

-- Location: LABCELL_X32_Y1_N0
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( cont_div(10) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~18\ = CARRY(( cont_div(10) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(10),
	cin => \Add0~22\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X32_Y1_N2
\cont_div[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(10));

-- Location: LABCELL_X32_Y1_N3
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( cont_div(11) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~14\ = CARRY(( cont_div(11) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(11),
	cin => \Add0~18\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X32_Y1_N5
\cont_div[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(11));

-- Location: LABCELL_X32_Y1_N6
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( cont_div(12) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~10\ = CARRY(( cont_div(12) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_cont_div(12),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X32_Y1_N8
\cont_div[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(12));

-- Location: LABCELL_X32_Y1_N9
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( cont_div(13) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~6\ = CARRY(( cont_div(13) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(13),
	cin => \Add0~10\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X32_Y1_N11
\cont_div[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(13));

-- Location: LABCELL_X32_Y2_N12
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !cont_div(8) & ( cont_div(11) & ( (!cont_div(10) & (cont_div(12) & (cont_div(13) & !cont_div(9)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(10),
	datab => ALT_INV_cont_div(12),
	datac => ALT_INV_cont_div(13),
	datad => ALT_INV_cont_div(9),
	datae => ALT_INV_cont_div(8),
	dataf => ALT_INV_cont_div(11),
	combout => \Equal0~0_combout\);

-- Location: LABCELL_X32_Y1_N12
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( cont_div(14) ) + ( GND ) + ( \Add0~6\ ))
-- \Add0~50\ = CARRY(( cont_div(14) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_cont_div(14),
	cin => \Add0~6\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: FF_X32_Y1_N14
\cont_div[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~49_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(14));

-- Location: LABCELL_X32_Y1_N15
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( cont_div(15) ) + ( GND ) + ( \Add0~50\ ))
-- \Add0~46\ = CARRY(( cont_div(15) ) + ( GND ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(15),
	cin => \Add0~50\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: FF_X32_Y1_N17
\cont_div[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~45_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(15));

-- Location: LABCELL_X32_Y1_N18
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( cont_div(16) ) + ( GND ) + ( \Add0~46\ ))
-- \Add0~42\ = CARRY(( cont_div(16) ) + ( GND ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(16),
	cin => \Add0~46\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: FF_X32_Y1_N20
\cont_div[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~41_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(16));

-- Location: LABCELL_X32_Y1_N21
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( cont_div(17) ) + ( GND ) + ( \Add0~42\ ))
-- \Add0~38\ = CARRY(( cont_div(17) ) + ( GND ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(17),
	cin => \Add0~42\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: FF_X32_Y1_N23
\cont_div[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~37_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(17));

-- Location: LABCELL_X32_Y1_N24
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( cont_div(18) ) + ( GND ) + ( \Add0~38\ ))
-- \Add0~34\ = CARRY(( cont_div(18) ) + ( GND ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(18),
	cin => \Add0~38\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: FF_X32_Y1_N26
\cont_div[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~33_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(18));

-- Location: LABCELL_X32_Y1_N48
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( cont_div(3) & ( cont_div(18) & ( (!cont_div(17) & (!cont_div(15) & (cont_div(16) & cont_div(14)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(17),
	datab => ALT_INV_cont_div(15),
	datac => ALT_INV_cont_div(16),
	datad => ALT_INV_cont_div(14),
	datae => ALT_INV_cont_div(3),
	dataf => ALT_INV_cont_div(18),
	combout => \Equal0~1_combout\);

-- Location: LABCELL_X32_Y1_N27
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( cont_div(19) ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~70\ = CARRY(( cont_div(19) ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(19),
	cin => \Add0~34\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X32_Y1_N29
\cont_div[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~69_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(19));

-- Location: LABCELL_X32_Y1_N30
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( cont_div(20) ) + ( GND ) + ( \Add0~70\ ))
-- \Add0~98\ = CARRY(( cont_div(20) ) + ( GND ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_cont_div(20),
	cin => \Add0~70\,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: FF_X32_Y1_N32
\cont_div[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~97_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(20));

-- Location: LABCELL_X32_Y1_N33
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( cont_div(21) ) + ( GND ) + ( \Add0~98\ ))
-- \Add0~94\ = CARRY(( cont_div(21) ) + ( GND ) + ( \Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(21),
	cin => \Add0~98\,
	sumout => \Add0~93_sumout\,
	cout => \Add0~94\);

-- Location: FF_X32_Y1_N35
\cont_div[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~93_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(21));

-- Location: LABCELL_X32_Y1_N36
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( cont_div(22) ) + ( GND ) + ( \Add0~94\ ))
-- \Add0~90\ = CARRY(( cont_div(22) ) + ( GND ) + ( \Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(22),
	cin => \Add0~94\,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: FF_X32_Y1_N38
\cont_div[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~89_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(22));

-- Location: LABCELL_X32_Y1_N39
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( cont_div(23) ) + ( GND ) + ( \Add0~90\ ))
-- \Add0~86\ = CARRY(( cont_div(23) ) + ( GND ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_cont_div(23),
	cin => \Add0~90\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: FF_X32_Y1_N41
\cont_div[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~85_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(23));

-- Location: LABCELL_X32_Y1_N42
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( cont_div(24) ) + ( GND ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_cont_div(24),
	cin => \Add0~86\,
	sumout => \Add0~81_sumout\);

-- Location: FF_X32_Y1_N44
\cont_div[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~81_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(24));

-- Location: LABCELL_X32_Y1_N54
\Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = ( cont_div(22) & ( cont_div(24) & ( (cont_div(0) & (!cont_div(23) & (cont_div(21) & cont_div(20)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(0),
	datab => ALT_INV_cont_div(23),
	datac => ALT_INV_cont_div(21),
	datad => ALT_INV_cont_div(20),
	datae => ALT_INV_cont_div(22),
	dataf => ALT_INV_cont_div(24),
	combout => \Equal0~3_combout\);

-- Location: LABCELL_X32_Y2_N24
\cont_div[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \cont_div[6]~0_combout\ = ( \Equal0~3_combout\ & ( \pausa~input_o\ ) ) # ( !\Equal0~3_combout\ & ( \pausa~input_o\ ) ) # ( \Equal0~3_combout\ & ( !\pausa~input_o\ & ( (\Equal0~2_combout\ & (\Equal0~0_combout\ & (!cont_div(7) & \Equal0~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~2_combout\,
	datab => \ALT_INV_Equal0~0_combout\,
	datac => ALT_INV_cont_div(7),
	datad => \ALT_INV_Equal0~1_combout\,
	datae => \ALT_INV_Equal0~3_combout\,
	dataf => \ALT_INV_pausa~input_o\,
	combout => \cont_div[6]~0_combout\);

-- Location: FF_X32_Y2_N32
\cont_div[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~77_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(0));

-- Location: LABCELL_X32_Y2_N33
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( cont_div(1) ) + ( GND ) + ( \Add0~78\ ))
-- \Add0~74\ = CARRY(( cont_div(1) ) + ( GND ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(1),
	cin => \Add0~78\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X32_Y2_N35
\cont_div[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~73_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(1));

-- Location: FF_X32_Y2_N38
\cont_div[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add0~65_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \cont_div[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => cont_div(2));

-- Location: LABCELL_X32_Y2_N18
\Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ( cont_div(5) & ( !cont_div(6) & ( (cont_div(2) & (cont_div(19) & (cont_div(1) & cont_div(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_cont_div(2),
	datab => ALT_INV_cont_div(19),
	datac => ALT_INV_cont_div(1),
	datad => ALT_INV_cont_div(4),
	datae => ALT_INV_cont_div(5),
	dataf => ALT_INV_cont_div(6),
	combout => \Equal0~2_combout\);

-- Location: LABCELL_X32_Y2_N0
\Equal0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = ( \Equal0~0_combout\ & ( (\Equal0~2_combout\ & (\Equal0~3_combout\ & (!cont_div(7) & \Equal0~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000100000000000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~2_combout\,
	datab => \ALT_INV_Equal0~3_combout\,
	datac => ALT_INV_cont_div(7),
	datad => \ALT_INV_Equal0~1_combout\,
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \Equal0~4_combout\);

-- Location: LABCELL_X32_Y2_N3
\sinal_div~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \sinal_div~0_combout\ = ( \Equal0~4_combout\ & ( (!\pausa~input_o\ & !\sinal_div~q\) ) ) # ( !\Equal0~4_combout\ & ( (!\pausa~input_o\ & \sinal_div~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_pausa~input_o\,
	datad => \ALT_INV_sinal_div~q\,
	dataf => \ALT_INV_Equal0~4_combout\,
	combout => \sinal_div~0_combout\);

-- Location: FF_X32_Y2_N5
sinal_div : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \sinal_div~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sinal_div~q\);

-- Location: LABCELL_X32_Y2_N6
\pulso_avanco~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \pulso_avanco~0_combout\ = ( \Equal0~4_combout\ & ( (!\pausa~input_o\ & !\sinal_div~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000101000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pausa~input_o\,
	datac => \ALT_INV_sinal_div~q\,
	dataf => \ALT_INV_Equal0~4_combout\,
	combout => \pulso_avanco~0_combout\);

-- Location: FF_X32_Y2_N8
pulso_avanco : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \pulso_avanco~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulso_avanco~q\);

-- Location: MLABCELL_X34_Y3_N36
\Add2~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~25_sumout\ = SUM(( N(2) ) + ( VCC ) + ( \Add2~2\ ))
-- \Add2~26\ = CARRY(( N(2) ) + ( VCC ) + ( \Add2~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_N(2),
	cin => \Add2~2\,
	sumout => \Add2~25_sumout\,
	cout => \Add2~26\);

-- Location: MLABCELL_X34_Y3_N39
\Add2~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~21_sumout\ = SUM(( N(3) ) + ( VCC ) + ( \Add2~26\ ))
-- \Add2~22\ = CARRY(( N(3) ) + ( VCC ) + ( \Add2~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_N(3),
	cin => \Add2~26\,
	sumout => \Add2~21_sumout\,
	cout => \Add2~22\);

-- Location: LABCELL_X35_Y3_N33
\Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~1_sumout\ = SUM(( N(1) ) + ( GND ) + ( \Add1~18\ ))
-- \Add1~2\ = CARRY(( N(1) ) + ( GND ) + ( \Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_N(1),
	cin => \Add1~18\,
	sumout => \Add1~1_sumout\,
	cout => \Add1~2\);

-- Location: LABCELL_X35_Y3_N36
\Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~25_sumout\ = SUM(( N(2) ) + ( GND ) + ( \Add1~2\ ))
-- \Add1~26\ = CARRY(( N(2) ) + ( GND ) + ( \Add1~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_N(2),
	cin => \Add1~2\,
	sumout => \Add1~25_sumout\,
	cout => \Add1~26\);

-- Location: LABCELL_X35_Y3_N39
\Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~21_sumout\ = SUM(( N(3) ) + ( GND ) + ( \Add1~26\ ))
-- \Add1~22\ = CARRY(( N(3) ) + ( GND ) + ( \Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_N(3),
	cin => \Add1~26\,
	sumout => \Add1~21_sumout\,
	cout => \Add1~22\);

-- Location: FF_X34_Y3_N41
\N[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add2~21_sumout\,
	asdata => \Add1~21_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_sentido~input_o\,
	ena => \N[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N(3));

-- Location: MLABCELL_X34_Y3_N42
\Add2~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~9_sumout\ = SUM(( N(4) ) + ( VCC ) + ( \Add2~22\ ))
-- \Add2~10\ = CARRY(( N(4) ) + ( VCC ) + ( \Add2~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_N(4),
	cin => \Add2~22\,
	sumout => \Add2~9_sumout\,
	cout => \Add2~10\);

-- Location: LABCELL_X35_Y3_N42
\Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~9_sumout\ = SUM(( N(4) ) + ( GND ) + ( \Add1~22\ ))
-- \Add1~10\ = CARRY(( N(4) ) + ( GND ) + ( \Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_N(4),
	cin => \Add1~22\,
	sumout => \Add1~9_sumout\,
	cout => \Add1~10\);

-- Location: FF_X34_Y3_N44
\N[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add2~9_sumout\,
	asdata => \Add1~9_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_sentido~input_o\,
	ena => \N[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N(4));

-- Location: MLABCELL_X34_Y3_N45
\Add2~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~5_sumout\ = SUM(( N(5) ) + ( VCC ) + ( \Add2~10\ ))
-- \Add2~6\ = CARRY(( N(5) ) + ( VCC ) + ( \Add2~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_N(5),
	cin => \Add2~10\,
	sumout => \Add2~5_sumout\,
	cout => \Add2~6\);

-- Location: LABCELL_X35_Y3_N45
\Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~5_sumout\ = SUM(( N(5) ) + ( GND ) + ( \Add1~10\ ))
-- \Add1~6\ = CARRY(( N(5) ) + ( GND ) + ( \Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_N(5),
	cin => \Add1~10\,
	sumout => \Add1~5_sumout\,
	cout => \Add1~6\);

-- Location: FF_X34_Y3_N47
\N[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add2~5_sumout\,
	asdata => \Add1~5_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_sentido~input_o\,
	ena => \N[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N(5));

-- Location: MLABCELL_X34_Y3_N12
\Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!N(1) & (!N(4) & !N(5)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000100010000000000010001000000000001000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_N(1),
	datab => ALT_INV_N(4),
	datad => ALT_INV_N(5),
	combout => \Equal2~0_combout\);

-- Location: MLABCELL_X34_Y3_N48
\Add2~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~13_sumout\ = SUM(( N(6) ) + ( VCC ) + ( \Add2~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_N(6),
	cin => \Add2~6\,
	sumout => \Add2~13_sumout\);

-- Location: LABCELL_X35_Y3_N48
\Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~13_sumout\ = SUM(( N(6) ) + ( GND ) + ( \Add1~6\ ))
-- \Add1~14\ = CARRY(( N(6) ) + ( GND ) + ( \Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_N(6),
	cin => \Add1~6\,
	sumout => \Add1~13_sumout\,
	cout => \Add1~14\);

-- Location: FF_X34_Y3_N50
\N[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add2~13_sumout\,
	asdata => \Add1~13_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_sentido~input_o\,
	ena => \N[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N(6));

-- Location: MLABCELL_X34_Y3_N24
\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ( N(2) & ( N(1) & ( (!N(6) & ((!N(5)) # (!N(4)))) ) ) ) # ( !N(2) & ( N(1) & ( (!N(6) & ((!N(5)) # (!N(4)))) ) ) ) # ( N(2) & ( !N(1) & ( (!N(6) & ((!N(5)) # (!N(4)))) ) ) ) # ( !N(2) & ( !N(1) & ( (!N(6) & ((!N(3)) # ((!N(5)) # 
-- (!N(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011100000111100001100000011110000110000001111000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_N(3),
	datab => ALT_INV_N(5),
	datac => ALT_INV_N(6),
	datad => ALT_INV_N(4),
	datae => ALT_INV_N(2),
	dataf => ALT_INV_N(1),
	combout => \LessThan0~0_combout\);

-- Location: MLABCELL_X34_Y3_N54
\N[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \N[6]~0_combout\ = ( \Equal1~0_combout\ & ( \LessThan0~0_combout\ & ( (!\pausa~input_o\ & (\pulso_avanco~q\ & ((!\sentido~input_o\) # (!\Equal2~0_combout\)))) ) ) ) # ( !\Equal1~0_combout\ & ( \LessThan0~0_combout\ & ( (!\pausa~input_o\ & 
-- \pulso_avanco~q\) ) ) ) # ( \Equal1~0_combout\ & ( !\LessThan0~0_combout\ & ( (!\pausa~input_o\ & (\pulso_avanco~q\ & (\sentido~input_o\ & !\Equal2~0_combout\))) ) ) ) # ( !\Equal1~0_combout\ & ( !\LessThan0~0_combout\ & ( (!\pausa~input_o\ & 
-- (\pulso_avanco~q\ & \sentido~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000010000000100000000000100010001000100010001000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pausa~input_o\,
	datab => \ALT_INV_pulso_avanco~q\,
	datac => \ALT_INV_sentido~input_o\,
	datad => \ALT_INV_Equal2~0_combout\,
	datae => \ALT_INV_Equal1~0_combout\,
	dataf => \ALT_INV_LessThan0~0_combout\,
	combout => \N[6]~0_combout\);

-- Location: FF_X34_Y3_N32
\N[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add2~17_sumout\,
	asdata => \Add1~17_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_sentido~input_o\,
	ena => \N[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N(0));

-- Location: MLABCELL_X34_Y3_N33
\Add2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add2~1_sumout\ = SUM(( N(1) ) + ( VCC ) + ( \Add2~18\ ))
-- \Add2~2\ = CARRY(( N(1) ) + ( VCC ) + ( \Add2~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_N(1),
	cin => \Add2~18\,
	sumout => \Add2~1_sumout\,
	cout => \Add2~2\);

-- Location: FF_X34_Y3_N35
\N[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add2~1_sumout\,
	asdata => \Add1~1_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_sentido~input_o\,
	ena => \N[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N(1));

-- Location: FF_X34_Y3_N38
\N[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add2~25_sumout\,
	asdata => \Add1~25_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => \ALT_INV_sentido~input_o\,
	ena => \N[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => N(2));

-- Location: MLABCELL_X34_Y3_N3
\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( !N(3) & ( (!N(2) & (!N(0) & !N(6))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100000000000100010000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_N(2),
	datab => ALT_INV_N(0),
	datad => ALT_INV_N(6),
	dataf => ALT_INV_N(3),
	combout => \Equal1~0_combout\);

-- Location: MLABCELL_X34_Y3_N6
\Equal1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = ( N(4) & ( (\Equal1~0_combout\ & (N(1) & N(5))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal1~0_combout\,
	datac => ALT_INV_N(1),
	datad => ALT_INV_N(5),
	dataf => ALT_INV_N(4),
	combout => \Equal1~1_combout\);

-- Location: MLABCELL_X34_Y3_N9
\Equal2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal2~1_combout\ = (\Equal1~0_combout\ & \Equal2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal1~0_combout\,
	datac => \ALT_INV_Equal2~0_combout\,
	combout => \Equal2~1_combout\);

-- Location: MLABCELL_X34_Y3_N15
\LessThan3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = ( N(3) & ( (!N(5) & !N(6)) ) ) # ( !N(3) & ( (!N(6) & ((!N(4)) # (!N(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110000000000111111000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_N(4),
	datac => ALT_INV_N(5),
	datad => ALT_INV_N(6),
	dataf => ALT_INV_N(3),
	combout => \LessThan3~0_combout\);

-- Location: MLABCELL_X34_Y3_N18
\erro~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \erro~0_combout\ = ( \erro~q\ & ( \LessThan0~0_combout\ ) ) # ( !\erro~q\ & ( \LessThan0~0_combout\ & ( (!\pausa~input_o\ & (\pulso_avanco~q\ & (\sentido~input_o\ & \Equal2~1_combout\))) ) ) ) # ( \erro~q\ & ( !\LessThan0~0_combout\ ) ) # ( !\erro~q\ & ( 
-- !\LessThan0~0_combout\ & ( (!\pausa~input_o\ & (\pulso_avanco~q\ & ((!\sentido~input_o\) # (\Equal2~1_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100010111111111111111100000000000000101111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pausa~input_o\,
	datab => \ALT_INV_pulso_avanco~q\,
	datac => \ALT_INV_sentido~input_o\,
	datad => \ALT_INV_Equal2~1_combout\,
	datae => \ALT_INV_erro~q\,
	dataf => \ALT_INV_LessThan0~0_combout\,
	combout => \erro~0_combout\);

-- Location: FF_X34_Y3_N20
erro : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \erro~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \erro~q\);

-- Location: IOIBUF_X34_Y0_N18
\modo[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_modo(1),
	o => \modo[1]~input_o\);

-- Location: IOIBUF_X34_Y0_N1
\modo[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_modo(0),
	o => \modo[0]~input_o\);

-- Location: LABCELL_X36_Y3_N30
\Add3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~1_sumout\ = SUM(( !N(0) ) + ( VCC ) + ( !VCC ))
-- \Add3~2\ = CARRY(( !N(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_N(0),
	cin => GND,
	sumout => \Add3~1_sumout\,
	cout => \Add3~2\);

-- Location: LABCELL_X36_Y3_N33
\Add3~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~5_sumout\ = SUM(( !N(1) ) + ( VCC ) + ( \Add3~2\ ))
-- \Add3~6\ = CARRY(( !N(1) ) + ( VCC ) + ( \Add3~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_N(1),
	cin => \Add3~2\,
	sumout => \Add3~5_sumout\,
	cout => \Add3~6\);

-- Location: LABCELL_X36_Y3_N36
\Add3~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~9_sumout\ = SUM(( !N(2) ) + ( GND ) + ( \Add3~6\ ))
-- \Add3~10\ = CARRY(( !N(2) ) + ( GND ) + ( \Add3~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_N(2),
	cin => \Add3~6\,
	sumout => \Add3~9_sumout\,
	cout => \Add3~10\);

-- Location: LABCELL_X36_Y3_N39
\Add3~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~13_sumout\ = SUM(( !N(3) ) + ( GND ) + ( \Add3~10\ ))
-- \Add3~14\ = CARRY(( !N(3) ) + ( GND ) + ( \Add3~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_N(3),
	cin => \Add3~10\,
	sumout => \Add3~13_sumout\,
	cout => \Add3~14\);

-- Location: LABCELL_X36_Y3_N42
\Add3~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~17_sumout\ = SUM(( !N(4) ) + ( VCC ) + ( \Add3~14\ ))
-- \Add3~18\ = CARRY(( !N(4) ) + ( VCC ) + ( \Add3~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_N(4),
	cin => \Add3~14\,
	sumout => \Add3~17_sumout\,
	cout => \Add3~18\);

-- Location: LABCELL_X36_Y3_N45
\Add3~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~21_sumout\ = SUM(( !N(5) ) + ( VCC ) + ( \Add3~18\ ))
-- \Add3~22\ = CARRY(( !N(5) ) + ( VCC ) + ( \Add3~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_N(5),
	cin => \Add3~18\,
	sumout => \Add3~21_sumout\,
	cout => \Add3~22\);

-- Location: LABCELL_X36_Y3_N48
\Add3~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add3~25_sumout\ = SUM(( !N(6) ) + ( GND ) + ( \Add3~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_N(6),
	cin => \Add3~22\,
	sumout => \Add3~25_sumout\);

-- Location: FF_X35_Y3_N32
\P[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add1~17_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \P[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => P(0));

-- Location: FF_X35_Y3_N38
\P[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add1~25_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \P[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => P(2));

-- Location: FF_X35_Y3_N35
\P[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add1~1_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \P[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => P(1));

-- Location: LABCELL_X35_Y3_N12
\LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = ( \Add1~25_sumout\ & ( P(1) & ( (!P(2)) # ((\Add1~1_sumout\ & (!P(0) & \Add1~17_sumout\))) ) ) ) # ( !\Add1~25_sumout\ & ( P(1) & ( (\Add1~1_sumout\ & (!P(0) & (!P(2) & \Add1~17_sumout\))) ) ) ) # ( \Add1~25_sumout\ & ( !P(1) & ( 
-- ((!P(2)) # ((!P(0) & \Add1~17_sumout\))) # (\Add1~1_sumout\) ) ) ) # ( !\Add1~25_sumout\ & ( !P(1) & ( (!P(2) & (((!P(0) & \Add1~17_sumout\)) # (\Add1~1_sumout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011010000111101011111110100000000010000001111000011110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Add1~1_sumout\,
	datab => ALT_INV_P(0),
	datac => ALT_INV_P(2),
	datad => \ALT_INV_Add1~17_sumout\,
	datae => \ALT_INV_Add1~25_sumout\,
	dataf => ALT_INV_P(1),
	combout => \LessThan1~1_combout\);

-- Location: FF_X35_Y3_N41
\P[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add1~21_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \P[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => P(3));

-- Location: FF_X35_Y3_N44
\P[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add1~9_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \P[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => P(4));

-- Location: LABCELL_X35_Y3_N18
\LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = ( \Add1~9_sumout\ & ( (!P(4)) # ((!\LessThan1~1_combout\ & (!P(3) & \Add1~21_sumout\)) # (\LessThan1~1_combout\ & ((!P(3)) # (\Add1~21_sumout\)))) ) ) # ( !\Add1~9_sumout\ & ( (!P(4) & ((!\LessThan1~1_combout\ & (!P(3) & 
-- \Add1~21_sumout\)) # (\LessThan1~1_combout\ & ((!P(3)) # (\Add1~21_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100110100000000010011010000000011111111010011011111111101001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan1~1_combout\,
	datab => ALT_INV_P(3),
	datac => \ALT_INV_Add1~21_sumout\,
	datad => ALT_INV_P(4),
	dataf => \ALT_INV_Add1~9_sumout\,
	combout => \LessThan1~2_combout\);

-- Location: FF_X35_Y3_N47
\P[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	d => \Add1~5_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \P[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => P(5));

-- Location: LABCELL_X35_Y3_N51
\Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add1~29_sumout\ = SUM(( GND ) + ( GND ) + ( \Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Add1~14\,
	sumout => \Add1~29_sumout\);

-- Location: LABCELL_X35_Y3_N21
\LessThan1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = ( \Add1~13_sumout\ & ( (P(6) & !\Add1~29_sumout\) ) ) # ( !\Add1~13_sumout\ & ( !\Add1~29_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_P(6),
	datad => \ALT_INV_Add1~29_sumout\,
	dataf => \ALT_INV_Add1~13_sumout\,
	combout => \LessThan1~3_combout\);

-- Location: MLABCELL_X34_Y3_N0
\LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = ( \Add1~13_sumout\ & ( !P(6) ) ) # ( !\Add1~13_sumout\ & ( P(6) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_P(6),
	dataf => \ALT_INV_Add1~13_sumout\,
	combout => \LessThan1~0_combout\);

-- Location: LABCELL_X32_Y2_N9
\P[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \P[6]~0_combout\ = ( \pulso_avanco~q\ & ( (!\pausa~input_o\ & (!\sentido~input_o\ & \LessThan0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000101000000000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_pausa~input_o\,
	datac => \ALT_INV_sentido~input_o\,
	datad => \ALT_INV_LessThan0~0_combout\,
	dataf => \ALT_INV_pulso_avanco~q\,
	combout => \P[6]~0_combout\);

-- Location: LABCELL_X35_Y3_N54
\P[6]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \P[6]~1_combout\ = ( \P[6]~0_combout\ & ( \Add1~5_sumout\ & ( (!\LessThan1~3_combout\) # ((!\LessThan1~0_combout\ & ((!P(5)) # (\LessThan1~2_combout\)))) ) ) ) # ( \P[6]~0_combout\ & ( !\Add1~5_sumout\ & ( (!\LessThan1~3_combout\) # 
-- ((\LessThan1~2_combout\ & (!P(5) & !\LessThan1~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111101001111000000000000000000001111110111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan1~2_combout\,
	datab => ALT_INV_P(5),
	datac => \ALT_INV_LessThan1~3_combout\,
	datad => \ALT_INV_LessThan1~0_combout\,
	datae => \ALT_INV_P[6]~0_combout\,
	dataf => \ALT_INV_Add1~5_sumout\,
	combout => \P[6]~1_combout\);

-- Location: FF_X35_Y3_N17
\P[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50~inputCLKENA0_outclk\,
	asdata => \Add1~13_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \P[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => P(6));

-- Location: LABCELL_X35_Y3_N27
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( P(6) & ( (!\modo[1]~input_o\ & ((!\modo[0]~input_o\ & (N(6))) # (\modo[0]~input_o\ & ((\Add3~25_sumout\))))) # (\modo[1]~input_o\ & (!\modo[0]~input_o\)) ) ) # ( !P(6) & ( (!\modo[1]~input_o\ & ((!\modo[0]~input_o\ & (N(6))) # 
-- (\modo[0]~input_o\ & ((\Add3~25_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101001001100011011100100110001101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_modo[1]~input_o\,
	datab => \ALT_INV_modo[0]~input_o\,
	datac => ALT_INV_N(6),
	datad => \ALT_INV_Add3~25_sumout\,
	dataf => ALT_INV_P(6),
	combout => \Mux0~0_combout\);

-- Location: LABCELL_X35_Y3_N24
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \Add3~21_sumout\ & ( ((!\modo[1]~input_o\ & (N(5))) # (\modo[1]~input_o\ & ((P(5))))) # (\modo[0]~input_o\) ) ) # ( !\Add3~21_sumout\ & ( (!\modo[1]~input_o\ & (!\modo[0]~input_o\ & (N(5)))) # (\modo[1]~input_o\ & (((P(5))) # 
-- (\modo[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100101011101000110010101110100111011011111110011101101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_modo[1]~input_o\,
	datab => \ALT_INV_modo[0]~input_o\,
	datac => ALT_INV_N(5),
	datad => ALT_INV_P(5),
	dataf => \ALT_INV_Add3~21_sumout\,
	combout => \Mux1~0_combout\);

-- Location: LABCELL_X36_Y3_N18
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \modo[0]~input_o\ & ( (\Add3~17_sumout\) # (\modo[1]~input_o\) ) ) # ( !\modo[0]~input_o\ & ( (!\modo[1]~input_o\ & ((N(4)))) # (\modo[1]~input_o\ & (P(4))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110101111000001011010111101110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_modo[1]~input_o\,
	datab => \ALT_INV_Add3~17_sumout\,
	datac => ALT_INV_P(4),
	datad => ALT_INV_N(4),
	dataf => \ALT_INV_modo[0]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LABCELL_X35_Y3_N9
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( P(3) & ( (!\modo[1]~input_o\ & ((!\modo[0]~input_o\ & (N(3))) # (\modo[0]~input_o\ & ((\Add3~13_sumout\))))) # (\modo[1]~input_o\ & (!\modo[0]~input_o\)) ) ) # ( !P(3) & ( (!\modo[1]~input_o\ & ((!\modo[0]~input_o\ & (N(3))) # 
-- (\modo[0]~input_o\ & ((\Add3~13_sumout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000101010000010000010101001001100011011100100110001101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_modo[1]~input_o\,
	datab => \ALT_INV_modo[0]~input_o\,
	datac => ALT_INV_N(3),
	datad => \ALT_INV_Add3~13_sumout\,
	dataf => ALT_INV_P(3),
	combout => \Mux3~0_combout\);

-- Location: LABCELL_X43_Y3_N18
\Div0|auto_generated|divider|divider|op_4~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_4~22_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \Div0|auto_generated|divider|divider|op_4~22_cout\);

-- Location: LABCELL_X43_Y3_N21
\Div0|auto_generated|divider|divider|op_4~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_4~17_sumout\ = SUM(( \Mux3~0_combout\ ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_4~22_cout\ ))
-- \Div0|auto_generated|divider|divider|op_4~18\ = CARRY(( \Mux3~0_combout\ ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_4~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux3~0_combout\,
	cin => \Div0|auto_generated|divider|divider|op_4~22_cout\,
	sumout => \Div0|auto_generated|divider|divider|op_4~17_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_4~18\);

-- Location: LABCELL_X43_Y3_N24
\Div0|auto_generated|divider|divider|op_4~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_4~9_sumout\ = SUM(( \Mux2~0_combout\ ) + ( GND ) + ( \Div0|auto_generated|divider|divider|op_4~18\ ))
-- \Div0|auto_generated|divider|divider|op_4~10\ = CARRY(( \Mux2~0_combout\ ) + ( GND ) + ( \Div0|auto_generated|divider|divider|op_4~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux2~0_combout\,
	cin => \Div0|auto_generated|divider|divider|op_4~18\,
	sumout => \Div0|auto_generated|divider|divider|op_4~9_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_4~10\);

-- Location: LABCELL_X43_Y3_N27
\Div0|auto_generated|divider|divider|op_4~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_4~13_sumout\ = SUM(( \Mux1~0_combout\ ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_4~10\ ))
-- \Div0|auto_generated|divider|divider|op_4~14\ = CARRY(( \Mux1~0_combout\ ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_4~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux1~0_combout\,
	cin => \Div0|auto_generated|divider|divider|op_4~10\,
	sumout => \Div0|auto_generated|divider|divider|op_4~13_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_4~14\);

-- Location: LABCELL_X43_Y3_N30
\Div0|auto_generated|divider|divider|op_4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_4~5_sumout\ = SUM(( \Mux0~0_combout\ ) + ( GND ) + ( \Div0|auto_generated|divider|divider|op_4~14\ ))
-- \Div0|auto_generated|divider|divider|op_4~6\ = CARRY(( \Mux0~0_combout\ ) + ( GND ) + ( \Div0|auto_generated|divider|divider|op_4~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux0~0_combout\,
	cin => \Div0|auto_generated|divider|divider|op_4~14\,
	sumout => \Div0|auto_generated|divider|divider|op_4~5_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_4~6\);

-- Location: LABCELL_X43_Y3_N33
\Div0|auto_generated|divider|divider|op_4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_4~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \Div0|auto_generated|divider|divider|op_4~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|op_4~6\,
	sumout => \Div0|auto_generated|divider|divider|op_4~1_sumout\);

-- Location: LABCELL_X43_Y3_N57
\Div0|auto_generated|divider|divider|StageOut[18]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~6_combout\ = (\Div0|auto_generated|divider|divider|op_4~1_sumout\ & \Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datad => \ALT_INV_Mux0~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~6_combout\);

-- Location: LABCELL_X43_Y3_N54
\Div0|auto_generated|divider|divider|StageOut[18]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[18]~5_combout\ = ( \Div0|auto_generated|divider|divider|op_4~5_sumout\ & ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[18]~5_combout\);

-- Location: LABCELL_X41_Y1_N0
\Div0|auto_generated|divider|divider|StageOut[16]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~7_combout\ = ( \Div0|auto_generated|divider|divider|op_4~9_sumout\ & ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~7_combout\);

-- Location: LABCELL_X41_Y1_N3
\Div0|auto_generated|divider|divider|StageOut[16]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~8_combout\ = (\Div0|auto_generated|divider|divider|op_4~1_sumout\ & \Mux2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datad => \ALT_INV_Mux2~0_combout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~8_combout\);

-- Location: LABCELL_X35_Y3_N6
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( \Add3~9_sumout\ & ( (!\modo[1]~input_o\ & (((N(2))) # (\modo[0]~input_o\))) # (\modo[1]~input_o\ & (!\modo[0]~input_o\ & ((P(2))))) ) ) # ( !\Add3~9_sumout\ & ( (!\modo[0]~input_o\ & ((!\modo[1]~input_o\ & (N(2))) # (\modo[1]~input_o\ 
-- & ((P(2)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100001001100000010000100110000101010011011100010101001101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_modo[1]~input_o\,
	datab => \ALT_INV_modo[0]~input_o\,
	datac => ALT_INV_N(2),
	datad => ALT_INV_P(2),
	dataf => \ALT_INV_Add3~9_sumout\,
	combout => \Mux4~0_combout\);

-- Location: LABCELL_X40_Y1_N6
\Div0|auto_generated|divider|divider|op_5~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_5~26_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \Div0|auto_generated|divider|divider|op_5~26_cout\);

-- Location: LABCELL_X40_Y1_N9
\Div0|auto_generated|divider|divider|op_5~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_5~21_sumout\ = SUM(( \Mux4~0_combout\ ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_5~26_cout\ ))
-- \Div0|auto_generated|divider|divider|op_5~22\ = CARRY(( \Mux4~0_combout\ ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_5~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux4~0_combout\,
	cin => \Div0|auto_generated|divider|divider|op_5~26_cout\,
	sumout => \Div0|auto_generated|divider|divider|op_5~21_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_5~22\);

-- Location: LABCELL_X40_Y1_N12
\Div0|auto_generated|divider|divider|op_5~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_5~17_sumout\ = SUM(( GND ) + ( (!\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_4~17_sumout\))) # (\Div0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (\Mux3~0_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_5~22\ ))
-- \Div0|auto_generated|divider|divider|op_5~18\ = CARRY(( GND ) + ( (!\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_4~17_sumout\))) # (\Div0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (\Mux3~0_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_5~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000000110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mux3~0_combout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\,
	cin => \Div0|auto_generated|divider|divider|op_5~22\,
	sumout => \Div0|auto_generated|divider|divider|op_5~17_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_5~18\);

-- Location: LABCELL_X40_Y1_N15
\Div0|auto_generated|divider|divider|op_5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_5~9_sumout\ = SUM(( (\Div0|auto_generated|divider|divider|StageOut[16]~8_combout\) # (\Div0|auto_generated|divider|divider|StageOut[16]~7_combout\) ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_5~18\ ))
-- \Div0|auto_generated|divider|divider|op_5~10\ = CARRY(( (\Div0|auto_generated|divider|divider|StageOut[16]~8_combout\) # (\Div0|auto_generated|divider|divider|StageOut[16]~7_combout\) ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_5~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~7_combout\,
	datad => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~8_combout\,
	cin => \Div0|auto_generated|divider|divider|op_5~18\,
	sumout => \Div0|auto_generated|divider|divider|op_5~9_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_5~10\);

-- Location: LABCELL_X40_Y1_N18
\Div0|auto_generated|divider|divider|op_5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_5~13_sumout\ = SUM(( (!\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_4~13_sumout\))) # (\Div0|auto_generated|divider|divider|op_4~1_sumout\ & (\Mux1~0_combout\)) ) + 
-- ( GND ) + ( \Div0|auto_generated|divider|divider|op_5~10\ ))
-- \Div0|auto_generated|divider|divider|op_5~14\ = CARRY(( (!\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_4~13_sumout\))) # (\Div0|auto_generated|divider|divider|op_4~1_sumout\ & (\Mux1~0_combout\)) ) + ( 
-- GND ) + ( \Div0|auto_generated|divider|divider|op_5~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mux1~0_combout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datad => \Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\,
	cin => \Div0|auto_generated|divider|divider|op_5~10\,
	sumout => \Div0|auto_generated|divider|divider|op_5~13_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_5~14\);

-- Location: LABCELL_X40_Y1_N21
\Div0|auto_generated|divider|divider|op_5~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_5~6_cout\ = CARRY(( (\Div0|auto_generated|divider|divider|StageOut[18]~5_combout\) # (\Div0|auto_generated|divider|divider|StageOut[18]~6_combout\) ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_5~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~6_combout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[18]~5_combout\,
	cin => \Div0|auto_generated|divider|divider|op_5~14\,
	cout => \Div0|auto_generated|divider|divider|op_5~6_cout\);

-- Location: LABCELL_X40_Y1_N24
\Div0|auto_generated|divider|divider|op_5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_5~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \Div0|auto_generated|divider|divider|op_5~6_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|op_5~6_cout\,
	sumout => \Div0|auto_generated|divider|divider|op_5~1_sumout\);

-- Location: LABCELL_X41_Y1_N21
\Div0|auto_generated|divider|divider|StageOut[22]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~0_combout\ = (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & \Div0|auto_generated|divider|divider|op_5~9_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~0_combout\);

-- Location: LABCELL_X40_Y1_N3
\Div0|auto_generated|divider|divider|StageOut[17]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~3_combout\ = ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( \Div0|auto_generated|divider|divider|op_4~13_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~3_combout\);

-- Location: LABCELL_X43_Y3_N48
\Div0|auto_generated|divider|divider|StageOut[17]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[17]~4_combout\ = ( \Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( \Mux1~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux1~0_combout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[17]~4_combout\);

-- Location: LABCELL_X41_Y1_N27
\Div0|auto_generated|divider|divider|StageOut[16]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[16]~1_combout\ = ( \Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( \Mux2~0_combout\ ) ) # ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( \Div0|auto_generated|divider|divider|op_4~9_sumout\ 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux2~0_combout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[16]~1_combout\);

-- Location: LABCELL_X40_Y1_N54
\Div0|auto_generated|divider|divider|StageOut[15]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[15]~9_combout\ = ( \Div0|auto_generated|divider|divider|op_4~17_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_4~1_sumout\) # (\Mux3~0_combout\) ) ) # ( 
-- !\Div0|auto_generated|divider|divider|op_4~17_sumout\ & ( (\Mux3~0_combout\ & \Div0|auto_generated|divider|divider|op_4~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111110011111100111111001111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mux3~0_combout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[15]~9_combout\);

-- Location: LABCELL_X35_Y3_N0
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( \Add3~5_sumout\ & ( ((!\modo[1]~input_o\ & ((N(1)))) # (\modo[1]~input_o\ & (P(1)))) # (\modo[0]~input_o\) ) ) # ( !\Add3~5_sumout\ & ( (!\modo[1]~input_o\ & (!\modo[0]~input_o\ & ((N(1))))) # (\modo[1]~input_o\ & (((P(1))) # 
-- (\modo[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010110011101000101011001110100110111101111110011011110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_modo[1]~input_o\,
	datab => \ALT_INV_modo[0]~input_o\,
	datac => ALT_INV_P(1),
	datad => ALT_INV_N(1),
	dataf => \ALT_INV_Add3~5_sumout\,
	combout => \Mux5~0_combout\);

-- Location: LABCELL_X40_Y1_N30
\Div0|auto_generated|divider|divider|op_6~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_6~26_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \Div0|auto_generated|divider|divider|op_6~26_cout\);

-- Location: LABCELL_X40_Y1_N33
\Div0|auto_generated|divider|divider|op_6~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_6~21_sumout\ = SUM(( \Mux5~0_combout\ ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_6~26_cout\ ))
-- \Div0|auto_generated|divider|divider|op_6~22\ = CARRY(( \Mux5~0_combout\ ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_6~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux5~0_combout\,
	cin => \Div0|auto_generated|divider|divider|op_6~26_cout\,
	sumout => \Div0|auto_generated|divider|divider|op_6~21_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_6~22\);

-- Location: LABCELL_X40_Y1_N36
\Div0|auto_generated|divider|divider|op_6~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_6~17_sumout\ = SUM(( GND ) + ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_5~21_sumout\))) # (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Mux4~0_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_6~22\ ))
-- \Div0|auto_generated|divider|divider|op_6~18\ = CARRY(( GND ) + ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_5~21_sumout\))) # (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Mux4~0_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_6~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \ALT_INV_Mux4~0_combout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\,
	cin => \Div0|auto_generated|divider|divider|op_6~22\,
	sumout => \Div0|auto_generated|divider|divider|op_6~17_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_6~18\);

-- Location: LABCELL_X40_Y1_N39
\Div0|auto_generated|divider|divider|op_6~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_6~13_sumout\ = SUM(( VCC ) + ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_5~17_sumout\))) # (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[15]~9_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_6~18\ ))
-- \Div0|auto_generated|divider|divider|op_6~14\ = CARRY(( VCC ) + ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_5~17_sumout\))) # (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[15]~9_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_6~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011100010001000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[15]~9_combout\,
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\,
	cin => \Div0|auto_generated|divider|divider|op_6~18\,
	sumout => \Div0|auto_generated|divider|divider|op_6~13_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_6~14\);

-- Location: LABCELL_X40_Y1_N42
\Div0|auto_generated|divider|divider|op_6~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_6~9_sumout\ = SUM(( GND ) + ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_5~9_sumout\))) # (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[16]~1_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_6~14\ ))
-- \Div0|auto_generated|divider|divider|op_6~10\ = CARRY(( GND ) + ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_5~9_sumout\))) # (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[16]~1_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_6~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~1_combout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\,
	cin => \Div0|auto_generated|divider|divider|op_6~14\,
	sumout => \Div0|auto_generated|divider|divider|op_6~9_sumout\,
	cout => \Div0|auto_generated|divider|divider|op_6~10\);

-- Location: LABCELL_X40_Y1_N45
\Div0|auto_generated|divider|divider|op_6~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_6~6_cout\ = CARRY(( VCC ) + ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & (((\Div0|auto_generated|divider|divider|op_5~13_sumout\)))) # (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (((\Div0|auto_generated|divider|divider|StageOut[17]~4_combout\)) # (\Div0|auto_generated|divider|divider|StageOut[17]~3_combout\))) ) + ( \Div0|auto_generated|divider|divider|op_6~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111000101100000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~3_combout\,
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~4_combout\,
	cin => \Div0|auto_generated|divider|divider|op_6~10\,
	cout => \Div0|auto_generated|divider|divider|op_6~6_cout\);

-- Location: LABCELL_X40_Y1_N48
\Div0|auto_generated|divider|divider|op_6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_6~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \Div0|auto_generated|divider|divider|op_6~6_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|op_6~6_cout\,
	sumout => \Div0|auto_generated|divider|divider|op_6~1_sumout\);

-- Location: LABCELL_X41_Y1_N24
\Div0|auto_generated|divider|divider|StageOut[22]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[22]~2_combout\ = ( \Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( \Div0|auto_generated|divider|divider|StageOut[16]~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[16]~1_combout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[22]~2_combout\);

-- Location: LABCELL_X40_Y1_N57
\Div0|auto_generated|divider|divider|StageOut[21]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[21]~10_combout\ = ( \Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( \Div0|auto_generated|divider|divider|StageOut[15]~9_combout\ ) ) # ( !\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( 
-- \Div0|auto_generated|divider|divider|op_5~17_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[15]~9_combout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[21]~10_combout\);

-- Location: LABCELL_X40_Y1_N0
\Div0|auto_generated|divider|divider|StageOut[20]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|StageOut[20]~11_combout\ = ( \Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( \Mux4~0_combout\ ) ) # ( !\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ( 
-- \Div0|auto_generated|divider|divider|op_5~21_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\,
	datac => \ALT_INV_Mux4~0_combout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \Div0|auto_generated|divider|divider|StageOut[20]~11_combout\);

-- Location: LABCELL_X35_Y3_N3
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \Add3~1_sumout\ & ( (!\modo[1]~input_o\ & (((N(0))) # (\modo[0]~input_o\))) # (\modo[1]~input_o\ & (!\modo[0]~input_o\ & (P(0)))) ) ) # ( !\Add3~1_sumout\ & ( (!\modo[0]~input_o\ & ((!\modo[1]~input_o\ & ((N(0)))) # (\modo[1]~input_o\ 
-- & (P(0))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010010001100000001001000110000100110101011100010011010101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_modo[1]~input_o\,
	datab => \ALT_INV_modo[0]~input_o\,
	datac => ALT_INV_P(0),
	datad => ALT_INV_N(0),
	dataf => \ALT_INV_Add3~1_sumout\,
	combout => \Mux6~0_combout\);

-- Location: LABCELL_X41_Y1_N36
\Div0|auto_generated|divider|divider|op_7~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_7~26_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \Div0|auto_generated|divider|divider|op_7~26_cout\);

-- Location: LABCELL_X41_Y1_N39
\Div0|auto_generated|divider|divider|op_7~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_7~22_cout\ = CARRY(( \Mux6~0_combout\ ) + ( VCC ) + ( \Div0|auto_generated|divider|divider|op_7~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux6~0_combout\,
	cin => \Div0|auto_generated|divider|divider|op_7~26_cout\,
	cout => \Div0|auto_generated|divider|divider|op_7~22_cout\);

-- Location: LABCELL_X41_Y1_N42
\Div0|auto_generated|divider|divider|op_7~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_7~18_cout\ = CARRY(( (!\Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_6~21_sumout\))) # (\Div0|auto_generated|divider|divider|op_6~1_sumout\ & (\Mux5~0_combout\)) ) + 
-- ( GND ) + ( \Div0|auto_generated|divider|divider|op_7~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \ALT_INV_Mux5~0_combout\,
	datad => \Div0|auto_generated|divider|divider|ALT_INV_op_6~21_sumout\,
	cin => \Div0|auto_generated|divider|divider|op_7~22_cout\,
	cout => \Div0|auto_generated|divider|divider|op_7~18_cout\);

-- Location: LABCELL_X41_Y1_N45
\Div0|auto_generated|divider|divider|op_7~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_7~14_cout\ = CARRY(( VCC ) + ( (!\Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_6~17_sumout\))) # (\Div0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[20]~11_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_7~18_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000011000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[20]~11_combout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\,
	cin => \Div0|auto_generated|divider|divider|op_7~18_cout\,
	cout => \Div0|auto_generated|divider|divider|op_7~14_cout\);

-- Location: LABCELL_X41_Y1_N48
\Div0|auto_generated|divider|divider|op_7~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_7~10_cout\ = CARRY(( GND ) + ( (!\Div0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_6~13_sumout\))) # (\Div0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Div0|auto_generated|divider|divider|StageOut[21]~10_combout\)) ) + ( \Div0|auto_generated|divider|divider|op_7~14_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[21]~10_combout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\,
	cin => \Div0|auto_generated|divider|divider|op_7~14_cout\,
	cout => \Div0|auto_generated|divider|divider|op_7~10_cout\);

-- Location: LABCELL_X41_Y1_N51
\Div0|auto_generated|divider|divider|op_7~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_7~6_cout\ = CARRY(( VCC ) + ( (!\Div0|auto_generated|divider|divider|op_6~1_sumout\ & (((\Div0|auto_generated|divider|divider|op_6~9_sumout\)))) # (\Div0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (((\Div0|auto_generated|divider|divider|StageOut[22]~2_combout\)) # (\Div0|auto_generated|divider|divider|StageOut[22]~0_combout\))) ) + ( \Div0|auto_generated|divider|divider|op_7~10_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111000101100000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[22]~0_combout\,
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_StageOut[22]~2_combout\,
	cin => \Div0|auto_generated|divider|divider|op_7~10_cout\,
	cout => \Div0|auto_generated|divider|divider|op_7~6_cout\);

-- Location: LABCELL_X41_Y1_N54
\Div0|auto_generated|divider|divider|op_7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Div0|auto_generated|divider|divider|op_7~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \Div0|auto_generated|divider|divider|op_7~6_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Div0|auto_generated|divider|divider|op_7~6_cout\,
	sumout => \Div0|auto_generated|divider|divider|op_7~1_sumout\);

-- Location: LABCELL_X41_Y1_N30
\DEC_DEZ|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_DEZ|Mux6~0_combout\ = ( \Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (\Div0|auto_generated|divider|divider|op_6~1_sumout\ & (!\Div0|auto_generated|divider|divider|op_7~1_sumout\ $ (!\Div0|auto_generated|divider|divider|op_5~1_sumout\))) ) 
-- ) # ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\) # (!\Div0|auto_generated|divider|divider|op_6~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111001100111111111100110000000000011001100000000001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datad => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \DEC_DEZ|Mux6~0_combout\);

-- Location: LABCELL_X41_Y1_N33
\DEC_DEZ|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_DEZ|Mux5~0_combout\ = ( \Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & (!\Div0|auto_generated|divider|divider|op_7~1_sumout\ $ (!\Div0|auto_generated|divider|divider|op_6~1_sumout\))) ) 
-- ) # ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\) # (!\Div0|auto_generated|divider|divider|op_6~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011111100111111001111110001001000010010000100100001001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \DEC_DEZ|Mux5~0_combout\);

-- Location: LABCELL_X41_Y1_N6
\DEC_DEZ|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_DEZ|Mux4~0_combout\ = ( \Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (\Div0|auto_generated|divider|divider|op_7~1_sumout\ & (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & !\Div0|auto_generated|divider|divider|op_6~1_sumout\)) ) ) # 
-- ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\) # (!\Div0|auto_generated|divider|divider|op_6~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111001100111111111100110000010001000000000001000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datad => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \DEC_DEZ|Mux4~0_combout\);

-- Location: LABCELL_X41_Y1_N9
\DEC_DEZ|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_DEZ|Mux3~0_combout\ = ( \Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_7~1_sumout\ & (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ $ (\Div0|auto_generated|divider|divider|op_6~1_sumout\))) # 
-- (\Div0|auto_generated|divider|divider|op_7~1_sumout\ & (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & \Div0|auto_generated|divider|divider|op_6~1_sumout\)) ) ) # ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( 
-- (!\Div0|auto_generated|divider|divider|op_5~1_sumout\) # (!\Div0|auto_generated|divider|divider|op_6~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111001100111111111100110010001000011001101000100001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datad => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \DEC_DEZ|Mux3~0_combout\);

-- Location: LABCELL_X41_Y1_N12
\DEC_DEZ|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_DEZ|Mux2~0_combout\ = ( \Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_7~1_sumout\) # ((!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & \Div0|auto_generated|divider|divider|op_6~1_sumout\)) ) 
-- ) # ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_7~1_sumout\) # ((!\Div0|auto_generated|divider|divider|op_5~1_sumout\) # (!\Div0|auto_generated|divider|divider|op_6~1_sumout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111101110111111111110111010101010111011101010101011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datad => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \DEC_DEZ|Mux2~0_combout\);

-- Location: LABCELL_X41_Y1_N15
\DEC_DEZ|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_DEZ|Mux1~0_combout\ = ( \Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_7~1_sumout\ & ((!\Div0|auto_generated|divider|divider|op_6~1_sumout\) # (\Div0|auto_generated|divider|divider|op_5~1_sumout\))) 
-- # (\Div0|auto_generated|divider|divider|op_7~1_sumout\ & (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & !\Div0|auto_generated|divider|divider|op_6~1_sumout\)) ) ) # ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( 
-- (!\Div0|auto_generated|divider|divider|op_5~1_sumout\) # (!\Div0|auto_generated|divider|divider|op_6~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011111100111111001111110010110010101100101011001010110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \DEC_DEZ|Mux1~0_combout\);

-- Location: LABCELL_X41_Y1_N18
\DEC_DEZ|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_DEZ|Mux0~0_combout\ = ( \Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (!\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Div0|auto_generated|divider|divider|op_6~1_sumout\) # (\Div0|auto_generated|divider|divider|op_7~1_sumout\))) # 
-- (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & ((!\Div0|auto_generated|divider|divider|op_6~1_sumout\))) ) ) # ( !\Div0|auto_generated|divider|divider|op_4~1_sumout\ & ( (\Div0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- \Div0|auto_generated|divider|divider|op_6~1_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001100111111110011000011111111001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Div0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datad => \Div0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \DEC_DEZ|Mux0~0_combout\);

-- Location: LABCELL_X36_Y3_N0
\Mod0|auto_generated|divider|divider|op_4~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_4~14_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \Mod0|auto_generated|divider|divider|op_4~14_cout\);

-- Location: LABCELL_X36_Y3_N3
\Mod0|auto_generated|divider|divider|op_4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_4~5_sumout\ = SUM(( \Mux3~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_4~14_cout\ ))
-- \Mod0|auto_generated|divider|divider|op_4~6\ = CARRY(( \Mux3~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_4~14_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux3~0_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_4~14_cout\,
	sumout => \Mod0|auto_generated|divider|divider|op_4~5_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_4~6\);

-- Location: LABCELL_X36_Y3_N6
\Mod0|auto_generated|divider|divider|op_4~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_4~21_sumout\ = SUM(( \Mux2~0_combout\ ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_4~6\ ))
-- \Mod0|auto_generated|divider|divider|op_4~22\ = CARRY(( \Mux2~0_combout\ ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_4~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux2~0_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_4~6\,
	sumout => \Mod0|auto_generated|divider|divider|op_4~21_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_4~22\);

-- Location: LABCELL_X36_Y3_N9
\Mod0|auto_generated|divider|divider|op_4~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_4~17_sumout\ = SUM(( \Mux1~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_4~22\ ))
-- \Mod0|auto_generated|divider|divider|op_4~18\ = CARRY(( \Mux1~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_4~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux1~0_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_4~22\,
	sumout => \Mod0|auto_generated|divider|divider|op_4~17_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_4~18\);

-- Location: LABCELL_X36_Y3_N12
\Mod0|auto_generated|divider|divider|op_4~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_4~9_sumout\ = SUM(( \Mux0~0_combout\ ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_4~18\ ))
-- \Mod0|auto_generated|divider|divider|op_4~10\ = CARRY(( \Mux0~0_combout\ ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_4~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux0~0_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_4~18\,
	sumout => \Mod0|auto_generated|divider|divider|op_4~9_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_4~10\);

-- Location: LABCELL_X36_Y3_N15
\Mod0|auto_generated|divider|divider|op_4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_4~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_4~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|op_4~10\,
	sumout => \Mod0|auto_generated|divider|divider|op_4~1_sumout\);

-- Location: LABCELL_X36_Y3_N54
\Mod0|auto_generated|divider|divider|StageOut[24]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[24]~8_combout\ = ( \Mod0|auto_generated|divider|divider|op_4~9_sumout\ & ( !\Mod0|auto_generated|divider|divider|op_4~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[24]~8_combout\);

-- Location: LABCELL_X36_Y3_N57
\Mod0|auto_generated|divider|divider|StageOut[24]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[24]~9_combout\ = (\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & \Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000000011001100000000001100110000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datad => \ALT_INV_Mux0~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[24]~9_combout\);

-- Location: LABCELL_X36_Y3_N27
\Mod0|auto_generated|divider|divider|StageOut[22]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[22]~18_combout\ = ( \Mux2~0_combout\ & ( \Mod0|auto_generated|divider|divider|op_4~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[22]~18_combout\);

-- Location: LABCELL_X36_Y3_N24
\Mod0|auto_generated|divider|divider|StageOut[22]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[22]~17_combout\ = ( \Mod0|auto_generated|divider|divider|op_4~21_sumout\ & ( !\Mod0|auto_generated|divider|divider|op_4~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~21_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[22]~17_combout\);

-- Location: LABCELL_X39_Y4_N24
\Mod0|auto_generated|divider|divider|op_5~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_5~18_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \Mod0|auto_generated|divider|divider|op_5~18_cout\);

-- Location: LABCELL_X39_Y4_N27
\Mod0|auto_generated|divider|divider|op_5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_5~5_sumout\ = SUM(( \Mux4~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_5~18_cout\ ))
-- \Mod0|auto_generated|divider|divider|op_5~6\ = CARRY(( \Mux4~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_5~18_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux4~0_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_5~18_cout\,
	sumout => \Mod0|auto_generated|divider|divider|op_5~5_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_5~6\);

-- Location: LABCELL_X39_Y4_N30
\Mod0|auto_generated|divider|divider|op_5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_5~9_sumout\ = SUM(( GND ) + ( (!\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_4~5_sumout\))) # (\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (\Mux3~0_combout\)) ) + ( \Mod0|auto_generated|divider|divider|op_5~6\ ))
-- \Mod0|auto_generated|divider|divider|op_5~10\ = CARRY(( GND ) + ( (!\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_4~5_sumout\))) # (\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (\Mux3~0_combout\)) 
-- ) + ( \Mod0|auto_generated|divider|divider|op_5~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110100000101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux3~0_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_5~6\,
	sumout => \Mod0|auto_generated|divider|divider|op_5~9_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_5~10\);

-- Location: LABCELL_X39_Y4_N33
\Mod0|auto_generated|divider|divider|op_5~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_5~25_sumout\ = SUM(( (\Mod0|auto_generated|divider|divider|StageOut[22]~17_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[22]~18_combout\) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_5~10\ ))
-- \Mod0|auto_generated|divider|divider|op_5~26\ = CARRY(( (\Mod0|auto_generated|divider|divider|StageOut[22]~17_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[22]~18_combout\) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_5~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~18_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~17_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_5~10\,
	sumout => \Mod0|auto_generated|divider|divider|op_5~25_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_5~26\);

-- Location: LABCELL_X39_Y4_N36
\Mod0|auto_generated|divider|divider|op_5~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_5~21_sumout\ = SUM(( GND ) + ( (!\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_4~17_sumout\))) # (\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (\Mux1~0_combout\)) ) + ( \Mod0|auto_generated|divider|divider|op_5~26\ ))
-- \Mod0|auto_generated|divider|divider|op_5~22\ = CARRY(( GND ) + ( (!\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_4~17_sumout\))) # (\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & 
-- (\Mux1~0_combout\)) ) + ( \Mod0|auto_generated|divider|divider|op_5~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000000110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Mux1~0_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_5~26\,
	sumout => \Mod0|auto_generated|divider|divider|op_5~21_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_5~22\);

-- Location: LABCELL_X39_Y4_N39
\Mod0|auto_generated|divider|divider|op_5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_5~13_sumout\ = SUM(( (\Mod0|auto_generated|divider|divider|StageOut[24]~9_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[24]~8_combout\) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_5~22\ ))
-- \Mod0|auto_generated|divider|divider|op_5~14\ = CARRY(( (\Mod0|auto_generated|divider|divider|StageOut[24]~9_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[24]~8_combout\) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_5~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~8_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~9_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_5~22\,
	sumout => \Mod0|auto_generated|divider|divider|op_5~13_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_5~14\);

-- Location: LABCELL_X39_Y4_N42
\Mod0|auto_generated|divider|divider|op_5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_5~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_5~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|op_5~14\,
	sumout => \Mod0|auto_generated|divider|divider|op_5~1_sumout\);

-- Location: LABCELL_X39_Y4_N54
\Mod0|auto_generated|divider|divider|StageOut[23]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[23]~11_combout\ = ( \Mod0|auto_generated|divider|divider|op_4~17_sumout\ & ( !\Mod0|auto_generated|divider|divider|op_4~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[23]~11_combout\);

-- Location: LABCELL_X39_Y4_N57
\Mod0|auto_generated|divider|divider|StageOut[23]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[23]~12_combout\ = (\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & \Mux1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000001010000010100000101000001010000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \ALT_INV_Mux1~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[23]~12_combout\);

-- Location: LABCELL_X36_Y3_N21
\Mod0|auto_generated|divider|divider|StageOut[22]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[22]~15_combout\ = ( \Mux2~0_combout\ & ( (\Mod0|auto_generated|divider|divider|op_4~21_sumout\) # (\Mod0|auto_generated|divider|divider|op_4~1_sumout\) ) ) # ( !\Mux2~0_combout\ & ( 
-- (!\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & \Mod0|auto_generated|divider|divider|op_4~21_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~21_sumout\,
	dataf => \ALT_INV_Mux2~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[22]~15_combout\);

-- Location: LABCELL_X39_Y4_N51
\Mod0|auto_generated|divider|divider|StageOut[21]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[21]~4_combout\ = (!\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (\Mod0|auto_generated|divider|divider|op_4~5_sumout\)) # (\Mod0|auto_generated|divider|divider|op_4~1_sumout\ & ((\Mux3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100001111010101010000111101010101000011110101010100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\,
	datac => \ALT_INV_Mux3~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[21]~4_combout\);

-- Location: LABCELL_X39_Y4_N0
\Mod0|auto_generated|divider|divider|op_6~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_6~22_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \Mod0|auto_generated|divider|divider|op_6~22_cout\);

-- Location: LABCELL_X39_Y4_N3
\Mod0|auto_generated|divider|divider|op_6~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_6~5_sumout\ = SUM(( \Mux5~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_6~22_cout\ ))
-- \Mod0|auto_generated|divider|divider|op_6~6\ = CARRY(( \Mux5~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_6~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux5~0_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_6~22_cout\,
	sumout => \Mod0|auto_generated|divider|divider|op_6~5_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_6~6\);

-- Location: LABCELL_X39_Y4_N6
\Mod0|auto_generated|divider|divider|op_6~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_6~9_sumout\ = SUM(( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_5~5_sumout\))) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\Mux4~0_combout\)) ) + ( 
-- GND ) + ( \Mod0|auto_generated|divider|divider|op_6~6\ ))
-- \Mod0|auto_generated|divider|divider|op_6~10\ = CARRY(( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_5~5_sumout\))) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\Mux4~0_combout\)) ) + ( GND 
-- ) + ( \Mod0|auto_generated|divider|divider|op_6~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \ALT_INV_Mux4~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_6~6\,
	sumout => \Mod0|auto_generated|divider|divider|op_6~9_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_6~10\);

-- Location: LABCELL_X39_Y4_N9
\Mod0|auto_generated|divider|divider|op_6~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_6~13_sumout\ = SUM(( VCC ) + ( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_5~9_sumout\))) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[21]~4_combout\)) ) + ( \Mod0|auto_generated|divider|divider|op_6~10\ ))
-- \Mod0|auto_generated|divider|divider|op_6~14\ = CARRY(( VCC ) + ( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_5~9_sumout\))) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[21]~4_combout\)) ) + ( \Mod0|auto_generated|divider|divider|op_6~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111011100010001000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[21]~4_combout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_6~10\,
	sumout => \Mod0|auto_generated|divider|divider|op_6~13_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_6~14\);

-- Location: LABCELL_X39_Y4_N12
\Mod0|auto_generated|divider|divider|op_6~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_6~29_sumout\ = SUM(( GND ) + ( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_5~25_sumout\))) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[22]~15_combout\)) ) + ( \Mod0|auto_generated|divider|divider|op_6~14\ ))
-- \Mod0|auto_generated|divider|divider|op_6~30\ = CARRY(( GND ) + ( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_5~25_sumout\))) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[22]~15_combout\)) ) + ( \Mod0|auto_generated|divider|divider|op_6~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111000011000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~15_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~25_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_6~14\,
	sumout => \Mod0|auto_generated|divider|divider|op_6~29_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_6~30\);

-- Location: LABCELL_X39_Y4_N15
\Mod0|auto_generated|divider|divider|op_6~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_6~25_sumout\ = SUM(( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\Mod0|auto_generated|divider|divider|op_5~21_sumout\)) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (((\Mod0|auto_generated|divider|divider|StageOut[23]~12_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[23]~11_combout\)))) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_6~30\ ))
-- \Mod0|auto_generated|divider|divider|op_6~26\ = CARRY(( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\Mod0|auto_generated|divider|divider|op_5~21_sumout\)) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (((\Mod0|auto_generated|divider|divider|StageOut[23]~12_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[23]~11_combout\)))) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_6~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000100011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[23]~11_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[23]~12_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_6~30\,
	sumout => \Mod0|auto_generated|divider|divider|op_6~25_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_6~26\);

-- Location: LABCELL_X39_Y4_N18
\Mod0|auto_generated|divider|divider|op_6~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_6~17_sumout\ = SUM(( VCC ) + ( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (((\Mod0|auto_generated|divider|divider|op_5~13_sumout\)))) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (((\Mod0|auto_generated|divider|divider|StageOut[24]~8_combout\)) # (\Mod0|auto_generated|divider|divider|StageOut[24]~9_combout\))) ) + ( \Mod0|auto_generated|divider|divider|op_6~26\ ))
-- \Mod0|auto_generated|divider|divider|op_6~18\ = CARRY(( VCC ) + ( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (((\Mod0|auto_generated|divider|divider|op_5~13_sumout\)))) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- (((\Mod0|auto_generated|divider|divider|StageOut[24]~8_combout\)) # (\Mod0|auto_generated|divider|divider|StageOut[24]~9_combout\))) ) + ( \Mod0|auto_generated|divider|divider|op_6~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111010100100000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~9_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~8_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_6~26\,
	sumout => \Mod0|auto_generated|divider|divider|op_6~17_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_6~18\);

-- Location: LABCELL_X39_Y4_N21
\Mod0|auto_generated|divider|divider|op_6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_6~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_6~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|op_6~18\,
	sumout => \Mod0|auto_generated|divider|divider|op_6~1_sumout\);

-- Location: LABCELL_X40_Y4_N54
\Mod0|auto_generated|divider|divider|StageOut[32]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~7_combout\ = ( \Mod0|auto_generated|divider|divider|op_5~13_sumout\ & ( !\Mod0|auto_generated|divider|divider|op_5~1_sumout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~7_combout\);

-- Location: LABCELL_X39_Y4_N48
\Mod0|auto_generated|divider|divider|StageOut[32]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[32]~10_combout\ = ( \Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ( (\Mod0|auto_generated|divider|divider|StageOut[24]~8_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[24]~9_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~9_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[24]~8_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[32]~10_combout\);

-- Location: LABCELL_X40_Y4_N48
\Mod0|auto_generated|divider|divider|StageOut[31]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[31]~13_combout\ = ( \Mod0|auto_generated|divider|divider|StageOut[23]~11_combout\ & ( (\Mod0|auto_generated|divider|divider|op_5~21_sumout\) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\) ) ) # ( 
-- !\Mod0|auto_generated|divider|divider|StageOut[23]~11_combout\ & ( (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\Mod0|auto_generated|divider|divider|op_5~21_sumout\)) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- ((\Mod0|auto_generated|divider|divider|StageOut[23]~12_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000111111000011000011111100111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~21_sumout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[23]~12_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[23]~11_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[31]~13_combout\);

-- Location: LABCELL_X40_Y4_N39
\Mod0|auto_generated|divider|divider|StageOut[30]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[30]~14_combout\ = (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & \Mod0|auto_generated|divider|divider|op_5~25_sumout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000001100000011000000110000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~25_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[30]~14_combout\);

-- Location: LABCELL_X40_Y4_N57
\Mod0|auto_generated|divider|divider|StageOut[30]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[30]~16_combout\ = (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & \Mod0|auto_generated|divider|divider|StageOut[22]~15_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[22]~15_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[30]~16_combout\);

-- Location: LABCELL_X40_Y4_N51
\Mod0|auto_generated|divider|divider|StageOut[29]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[29]~5_combout\ = (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\Mod0|auto_generated|divider|divider|op_5~9_sumout\)) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & 
-- ((\Mod0|auto_generated|divider|divider|StageOut[21]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100011101000111010001110100011101000111010001110100011101000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[21]~4_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[29]~5_combout\);

-- Location: LABCELL_X40_Y4_N36
\Mod0|auto_generated|divider|divider|StageOut[28]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[28]~2_combout\ = (!\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_5~5_sumout\))) # (\Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\Mux4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000111100111100000011110011110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \ALT_INV_Mux4~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[28]~2_combout\);

-- Location: LABCELL_X40_Y4_N0
\Mod0|auto_generated|divider|divider|op_7~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_7~26_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \Mod0|auto_generated|divider|divider|op_7~26_cout\);

-- Location: LABCELL_X40_Y4_N3
\Mod0|auto_generated|divider|divider|op_7~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_7~5_sumout\ = SUM(( \Mux6~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_7~26_cout\ ))
-- \Mod0|auto_generated|divider|divider|op_7~6\ = CARRY(( \Mux6~0_combout\ ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_7~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Mux6~0_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_7~26_cout\,
	sumout => \Mod0|auto_generated|divider|divider|op_7~5_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_7~6\);

-- Location: LABCELL_X40_Y4_N6
\Mod0|auto_generated|divider|divider|op_7~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_7~9_sumout\ = SUM(( GND ) + ( (!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_6~5_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Mux5~0_combout\)) ) + ( \Mod0|auto_generated|divider|divider|op_7~6\ ))
-- \Mod0|auto_generated|divider|divider|op_7~10\ = CARRY(( GND ) + ( (!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_6~5_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & (\Mux5~0_combout\)) 
-- ) + ( \Mod0|auto_generated|divider|divider|op_7~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110100101000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \ALT_INV_Mux5~0_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~5_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_7~6\,
	sumout => \Mod0|auto_generated|divider|divider|op_7~9_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_7~10\);

-- Location: LABCELL_X40_Y4_N9
\Mod0|auto_generated|divider|divider|op_7~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_7~13_sumout\ = SUM(( (!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_6~9_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[28]~2_combout\)) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_7~10\ ))
-- \Mod0|auto_generated|divider|divider|op_7~14\ = CARRY(( (!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_6~9_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[28]~2_combout\)) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_7~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[28]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_7~10\,
	sumout => \Mod0|auto_generated|divider|divider|op_7~13_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_7~14\);

-- Location: LABCELL_X40_Y4_N12
\Mod0|auto_generated|divider|divider|op_7~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_7~17_sumout\ = SUM(( (!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_6~13_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[29]~5_combout\)) ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_7~14\ ))
-- \Mod0|auto_generated|divider|divider|op_7~18\ = CARRY(( (!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_6~13_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[29]~5_combout\)) ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_7~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[29]~5_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_7~14\,
	sumout => \Mod0|auto_generated|divider|divider|op_7~17_sumout\,
	cout => \Mod0|auto_generated|divider|divider|op_7~18\);

-- Location: LABCELL_X40_Y4_N15
\Mod0|auto_generated|divider|divider|op_7~34\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_7~34_cout\ = CARRY(( (!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & (\Mod0|auto_generated|divider|divider|op_6~29_sumout\)) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (((\Mod0|auto_generated|divider|divider|StageOut[30]~16_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[30]~14_combout\)))) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_7~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000010011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~29_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[30]~14_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[30]~16_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_7~18\,
	cout => \Mod0|auto_generated|divider|divider|op_7~34_cout\);

-- Location: LABCELL_X40_Y4_N18
\Mod0|auto_generated|divider|divider|op_7~30\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_7~30_cout\ = CARRY(( VCC ) + ( (!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_6~25_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[31]~13_combout\)) ) + ( \Mod0|auto_generated|divider|divider|op_7~34_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110100101000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[31]~13_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~25_sumout\,
	cin => \Mod0|auto_generated|divider|divider|op_7~34_cout\,
	cout => \Mod0|auto_generated|divider|divider|op_7~30_cout\);

-- Location: LABCELL_X40_Y4_N21
\Mod0|auto_generated|divider|divider|op_7~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_7~22_cout\ = CARRY(( (!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & (\Mod0|auto_generated|divider|divider|op_6~17_sumout\)) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (((\Mod0|auto_generated|divider|divider|StageOut[32]~10_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[32]~7_combout\)))) ) + ( VCC ) + ( \Mod0|auto_generated|divider|divider|op_7~30_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000010011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~17_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[32]~7_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[32]~10_combout\,
	cin => \Mod0|auto_generated|divider|divider|op_7~30_cout\,
	cout => \Mod0|auto_generated|divider|divider|op_7~22_cout\);

-- Location: LABCELL_X40_Y4_N24
\Mod0|auto_generated|divider|divider|op_7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|op_7~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \Mod0|auto_generated|divider|divider|op_7~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \Mod0|auto_generated|divider|divider|op_7~22_cout\,
	sumout => \Mod0|auto_generated|divider|divider|op_7~1_sumout\);

-- Location: LABCELL_X40_Y4_N42
\Mod0|auto_generated|divider|divider|StageOut[45]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\ = ( \Mod0|auto_generated|divider|divider|op_7~17_sumout\ & ( (!\Mod0|auto_generated|divider|divider|op_7~1_sumout\) # ((!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- ((\Mod0|auto_generated|divider|divider|op_6~13_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & (\Mod0|auto_generated|divider|divider|StageOut[29]~5_combout\))) ) ) # ( !\Mod0|auto_generated|divider|divider|op_7~17_sumout\ & ( 
-- (\Mod0|auto_generated|divider|divider|op_7~1_sumout\ & ((!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_6~13_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[29]~5_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010110101011111011111010101111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[29]~5_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~13_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_7~17_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\);

-- Location: LABCELL_X40_Y4_N30
\Mod0|auto_generated|divider|divider|StageOut[43]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ = ( \Mod0|auto_generated|divider|divider|op_7~9_sumout\ & ( (!\Mod0|auto_generated|divider|divider|op_7~1_sumout\) # ((!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|op_6~5_sumout\)) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mux5~0_combout\)))) ) ) # ( !\Mod0|auto_generated|divider|divider|op_7~9_sumout\ & ( (\Mod0|auto_generated|divider|divider|op_7~1_sumout\ & 
-- ((!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & (\Mod0|auto_generated|divider|divider|op_6~5_sumout\)) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mux5~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100000101000100010000010110111011101011111011101110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~5_sumout\,
	datac => \ALT_INV_Mux5~0_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_7~9_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\);

-- Location: LABCELL_X40_Y4_N45
\Mod0|auto_generated|divider|divider|StageOut[44]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ = ( \Mod0|auto_generated|divider|divider|op_7~13_sumout\ & ( (!\Mod0|auto_generated|divider|divider|op_7~1_sumout\) # ((!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- ((\Mod0|auto_generated|divider|divider|op_6~9_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & (\Mod0|auto_generated|divider|divider|StageOut[28]~2_combout\))) ) ) # ( !\Mod0|auto_generated|divider|divider|op_7~13_sumout\ & ( 
-- (\Mod0|auto_generated|divider|divider|op_7~1_sumout\ & ((!\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & ((\Mod0|auto_generated|divider|divider|op_6~9_sumout\))) # (\Mod0|auto_generated|divider|divider|op_6~1_sumout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[28]~2_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010110101011111011111010101111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~1_sumout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[28]~2_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_6~9_sumout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_op_7~13_sumout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\);

-- Location: LABCELL_X40_Y4_N33
\Mod0|auto_generated|divider|divider|StageOut[42]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ = ( \Mux6~0_combout\ & ( (\Mod0|auto_generated|divider|divider|op_7~5_sumout\) # (\Mod0|auto_generated|divider|divider|op_7~1_sumout\) ) ) # ( !\Mux6~0_combout\ & ( 
-- (!\Mod0|auto_generated|divider|divider|op_7~1_sumout\ & \Mod0|auto_generated|divider|divider|op_7~5_sumout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101001010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_op_7~1_sumout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_op_7~5_sumout\,
	dataf => \ALT_INV_Mux6~0_combout\,
	combout => \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\);

-- Location: LABCELL_X43_Y3_N0
\DEC_UNI|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_UNI|Mux6~0_combout\ = ( \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\ ) ) ) # ( 
-- !\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( !\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\ $ 
-- (\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\) ) ) ) # ( \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( 
-- (!\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\) ) ) ) # ( !\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( 
-- !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\ & \Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011111111110011001111001100001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[45]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[43]~1_combout\,
	datae => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[44]~3_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[42]~0_combout\,
	combout => \DEC_UNI|Mux6~0_combout\);

-- Location: LABCELL_X43_Y3_N9
\DEC_UNI|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_UNI|Mux5~0_combout\ = ( \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (!\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\) ) ) ) # ( !\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( 
-- (\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ & \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\) ) ) ) # ( \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( 
-- !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\) ) ) ) # ( 
-- !\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ & 
-- \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011001111110011111100000011000000111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[43]~1_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[45]~6_combout\,
	datae => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[44]~3_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[42]~0_combout\,
	combout => \DEC_UNI|Mux5~0_combout\);

-- Location: LABCELL_X43_Y3_N42
\DEC_UNI|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_UNI|Mux4~0_combout\ = ( \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\ ) ) ) # ( 
-- !\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\ & 
-- \Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\) ) ) ) # ( \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( 
-- \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\ ) ) ) # ( !\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( 
-- \Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111001100110011001100000000001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[45]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[43]~1_combout\,
	datae => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[44]~3_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[42]~0_combout\,
	combout => \DEC_UNI|Mux4~0_combout\);

-- Location: LABCELL_X43_Y3_N39
\DEC_UNI|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_UNI|Mux3~0_combout\ = ( \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\) ) ) ) # ( !\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( 
-- !\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ $ (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\) ) ) ) # ( \Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( 
-- !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (!\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\) # (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\) ) ) ) # ( 
-- !\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & ( !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ & 
-- \Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011110011111100111111000011110000110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[43]~1_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[45]~6_combout\,
	datae => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[44]~3_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[42]~0_combout\,
	combout => \DEC_UNI|Mux3~0_combout\);

-- Location: LABCELL_X43_Y3_N15
\DEC_UNI|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_UNI|Mux2~0_combout\ = ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ ) # ( !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (!\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ & 
-- (\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\)) # (\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ & ((\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001101010011010100110101001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[44]~3_combout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[45]~6_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[43]~1_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[42]~0_combout\,
	combout => \DEC_UNI|Mux2~0_combout\);

-- Location: LABCELL_X43_Y3_N12
\DEC_UNI|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_UNI|Mux1~0_combout\ = ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (!\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ $ (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\)) # 
-- (\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\) ) ) # ( !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (!\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & 
-- ((\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\))) # (\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & (\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110111011000100011011101110011001111111111001100111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[44]~3_combout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[45]~6_combout\,
	datad => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[43]~1_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[42]~0_combout\,
	combout => \DEC_UNI|Mux1~0_combout\);

-- Location: LABCELL_X43_Y3_N51
\DEC_UNI|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \DEC_UNI|Mux0~0_combout\ = ( \Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( (!\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ $ 
-- (!\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\))) # (\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & (!\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\ & 
-- !\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\)) ) ) # ( !\Mod0|auto_generated|divider|divider|StageOut[42]~0_combout\ & ( !\Mod0|auto_generated|divider|divider|StageOut[45]~6_combout\ $ 
-- (((!\Mod0|auto_generated|divider|divider|StageOut[44]~3_combout\ & !\Mod0|auto_generated|divider|divider|StageOut[43]~1_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111100001111000011110000111100001101000011010000110100001101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[44]~3_combout\,
	datab => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[43]~1_combout\,
	datac => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[45]~6_combout\,
	dataf => \Mod0|auto_generated|divider|divider|ALT_INV_StageOut[42]~0_combout\,
	combout => \DEC_UNI|Mux0~0_combout\);

-- Location: LABCELL_X12_Y38_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


