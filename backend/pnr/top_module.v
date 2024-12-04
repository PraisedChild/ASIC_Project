module top_module (
	clk, 
	rst_n, 
	i_sensor_1_1, 
	i_sensor_1_5, 
	i_sensor_2_1, 
	i_sensor_2_5, 
	i_sensor_3_1, 
	i_sensor_3_5, 
	i_sensor_4_1, 
	i_sensor_4_5, 
	SI, 
	SE, 
	test_mode, 
	scan_clk, 
	scan_rst, 
	SO, 
	LED_RED_1, 
	LED_RED_2, 
	LED_RED_3, 
	LED_RED_4, 
	LED_GREEN_1, 
	LED_GREEN_2, 
	LED_GREEN_3, 
	LED_GREEN_4, 
	LED_YELLOW_1, 
	LED_YELLOW_2, 
	LED_YELLOW_3, 
	LED_YELLOW_4);
   input clk;
   input rst_n;
   input i_sensor_1_1;
   input i_sensor_1_5;
   input i_sensor_2_1;
   input i_sensor_2_5;
   input i_sensor_3_1;
   input i_sensor_3_5;
   input i_sensor_4_1;
   input i_sensor_4_5;
   input SI;
   input SE;
   input test_mode;
   input scan_clk;
   input scan_rst;
   output SO;
   output LED_RED_1;
   output LED_RED_2;
   output LED_RED_3;
   output LED_RED_4;
   output LED_GREEN_1;
   output LED_GREEN_2;
   output LED_GREEN_3;
   output LED_GREEN_4;
   output LED_YELLOW_1;
   output LED_YELLOW_2;
   output LED_YELLOW_3;
   output LED_YELLOW_4;

   // Internal wires
   wire FE_PHN1_scan_rst;
   wire FE_PHN0_rst_n;
   wire clk__L2_N0;
   wire clk__L1_N0;
   wire scan_clk__L2_N0;
   wire scan_clk__L1_N0;
   wire clk_dft__L3_N0;
   wire clk_dft__L2_N0;
   wire clk_dft__L1_N0;
   wire clk_dft;
   wire rst_n_dft;
   wire short_counter;
   wire long_counter;
   wire FSM_done;
   wire almost_done;
   wire n3;
   wire n5;
   wire n6;
   wire n7;
   wire [3:0] state;

   BUFX2M FE_PHC1_scan_rst (.Y(FE_PHN1_scan_rst), 
	.A(scan_rst));
   BUFX2M FE_PHC0_rst_n (.Y(FE_PHN0_rst_n), 
	.A(rst_n));
   CLKINVX40M clk__L2_I0 (.Y(clk__L2_N0), 
	.A(clk__L1_N0));
   CLKINVX40M clk__L1_I0 (.Y(clk__L1_N0), 
	.A(clk));
   CLKINVX8M scan_clk__L2_I0 (.Y(scan_clk__L2_N0), 
	.A(scan_clk__L1_N0));
   CLKINVX40M scan_clk__L1_I0 (.Y(scan_clk__L1_N0), 
	.A(scan_clk));
   CLKINVX32M clk_dft__L3_I0 (.Y(clk_dft__L3_N0), 
	.A(clk_dft__L2_N0));
   CLKINVX24M clk_dft__L2_I0 (.Y(clk_dft__L2_N0), 
	.A(clk_dft__L1_N0));
   BUFX16M clk_dft__L1_I0 (.Y(clk_dft__L1_N0), 
	.A(clk_dft));
   MX2X2M U3 (.Y(rst_n_dft), 
	.S0(test_mode), 
	.B(FE_PHN1_scan_rst), 
	.A(FE_PHN0_rst_n));
   MX2X6M U4 (.Y(clk_dft), 
	.S0(test_mode), 
	.B(scan_clk__L2_N0), 
	.A(clk__L2_N0));
   DLY1X1M U5 (.Y(n5), 
	.A(n7));
   INVXLM U6 (.Y(n6), 
	.A(SE));
   INVXLM U7 (.Y(n7), 
	.A(n6));
   counter_test_1 count_mod (.i_short_counter(short_counter), 
	.i_long_counter(long_counter), 
	.clk(clk_dft__L3_N0), 
	.rst_n(rst_n_dft), 
	.done_FSM(FSM_done), 
	.almost_done(almost_done), 
	.test_si(SI), 
	.test_so(n3), 
	.test_se(SE));
   traffic_lights_test_1 traff_mod (.clk(clk_dft__L3_N0), 
	.rst_n(rst_n_dft), 
	.i_sensor_1_1(i_sensor_1_1), 
	.i_sensor_1_5(i_sensor_1_5), 
	.i_sensor_2_1(i_sensor_2_1), 
	.i_sensor_2_5(i_sensor_2_5), 
	.i_sensor_3_1(i_sensor_3_1), 
	.i_sensor_3_5(i_sensor_3_5), 
	.i_sensor_4_1(i_sensor_4_1), 
	.i_sensor_4_5(i_sensor_4_5), 
	.counter_done(FSM_done), 
	.short_counter(short_counter), 
	.long_counter(long_counter), 
	.current_state({ state[3],
		state[2],
		state[1],
		state[0] }), 
	.test_si(n3), 
	.test_so(SO), 
	.test_se(n5));
   actuator act_mod (.state({ state[3],
		state[2],
		state[1],
		state[0] }), 
	.almost_done(almost_done), 
	.LED_RED_1(LED_RED_1), 
	.LED_RED_2(LED_RED_2), 
	.LED_RED_3(LED_RED_3), 
	.LED_RED_4(LED_RED_4), 
	.LED_GREEN_1(LED_GREEN_1), 
	.LED_GREEN_2(LED_GREEN_2), 
	.LED_GREEN_3(LED_GREEN_3), 
	.LED_GREEN_4(LED_GREEN_4), 
	.LED_YELLOW_1(LED_YELLOW_1), 
	.LED_YELLOW_2(LED_YELLOW_2), 
	.LED_YELLOW_3(LED_YELLOW_3), 
	.LED_YELLOW_4(LED_YELLOW_4));
endmodule

/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Dec  4 03:07:07 2024
/////////////////////////////////////////////////////////////
module counter_test_1 (
	i_short_counter, 
	i_long_counter, 
	clk, 
	rst_n, 
	done_FSM, 
	almost_done, 
	test_si, 
	test_so, 
	test_se);
   input i_short_counter;
   input i_long_counter;
   input clk;
   input rst_n;
   output done_FSM;
   output almost_done;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire N34;
   wire N35;
   wire N36;
   wire N37;
   wire N38;
   wire N39;
   wire N56;
   wire N57;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire \add_62/carry[5] ;
   wire \add_62/carry[4] ;
   wire \add_62/carry[3] ;
   wire \add_62/carry[2] ;
   wire n18;
   wire n19;
   wire n20;
   wire n24;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n77;
   wire n78;
   wire n80;
   wire n81;
   wire n82;
   wire n85;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n3;
   wire [3:0] short_counter;
   wire [1:0] counter_state;
   wire [5:0] long_counter;

   OAI2B11X2M U35 (.Y(n34), 
	.C0(n40), 
	.B0(n39), 
	.A1N(n36), 
	.A0(n38));
   SDFFRX2M \long_counter_reg[3]  (.SI(n77), 
	.SE(n100), 
	.RN(rst_n), 
	.QN(n78), 
	.Q(long_counter[3]), 
	.D(n53), 
	.CK(clk));
   OAI21X2M U17 (.Y(n30), 
	.B0(short_counter[1]), 
	.A1(n74), 
	.A0(n24));
   NAND4X2M U18 (.Y(n38), 
	.D(n41), 
	.C(long_counter[2]), 
	.B(long_counter[0]), 
	.A(long_counter[1]));
   OAI31X1M U20 (.Y(N56), 
	.B0(n46), 
	.A2(n81), 
	.A1(n80), 
	.A0(n45));
   OAI31X1M U21 (.Y(n48), 
	.B0(n30), 
	.A2(n24), 
	.A1(short_counter[1]), 
	.A0(n74));
   NAND4X1M U27 (.Y(n43), 
	.D(n102), 
	.C(n78), 
	.B(n36), 
	.A(n44));
   INVX2M U32 (.Y(n24), 
	.A(short_counter[0]));
   OR3X1M U33 (.Y(n42), 
	.C(test_so), 
	.B(n24), 
	.A(short_counter[1]));
   NAND3XLM U34 (.Y(n45), 
	.C(n31), 
	.B(n24), 
	.A(short_counter[1]));
   OAI32X1M U51 (.Y(n58), 
	.B1(n34), 
	.B0(n75), 
	.A2(n73), 
	.A1(i_long_counter), 
	.A0(n72));
   OAI22X1M U52 (.Y(n51), 
	.B1(n35), 
	.B0(n73), 
	.A1(n34), 
	.A0(n20));
   NOR2X2M U53 (.Y(n35), 
	.B(n72), 
	.A(i_long_counter));
   INVX2M U54 (.Y(n72), 
	.A(i_short_counter));
   CLKINVX2M U55 (.Y(n74), 
	.A(n31));
   INVX2M U56 (.Y(n73), 
	.A(n34));
   AND2X2M U57 (.Y(n37), 
	.B(n38), 
	.A(n36));
   OAI2BB2X1M U58 (.Y(n53), 
	.B1(n78), 
	.B0(n36), 
	.A1N(n37), 
	.A0N(N37));
   OAI2BB2X1M U59 (.Y(n55), 
	.B1(n102), 
	.B0(n36), 
	.A1N(n37), 
	.A0N(N35));
   OAI2BB2X1M U60 (.Y(n54), 
	.B1(n77), 
	.B0(n36), 
	.A1N(n37), 
	.A0N(N36));
   XNOR2X2M U61 (.Y(n40), 
	.B(n20), 
	.A(counter_state[0]));
   OR4X1M U62 (.Y(n39), 
	.D(n74), 
	.C(n80), 
	.B(n81), 
	.A(n28));
   NOR2X2M U63 (.Y(n31), 
	.B(counter_state[1]), 
	.A(n75));
   NAND2X2M U64 (.Y(n28), 
	.B(short_counter[0]), 
	.A(short_counter[1]));
   NOR2X2M U66 (.Y(n36), 
	.B(counter_state[0]), 
	.A(n20));
   OAI31X1M U67 (.Y(N57), 
	.B0(n43), 
	.A2(n80), 
	.A1(n74), 
	.A0(n42));
   OAI31X1M U68 (.Y(n47), 
	.B0(n29), 
	.A2(n74), 
	.A1(short_counter[2]), 
	.A0(n28));
   OAI21X2M U69 (.Y(n29), 
	.B0(short_counter[2]), 
	.A1(n28), 
	.A0(n74));
   NAND4X2M U70 (.Y(n46), 
	.D(long_counter[1]), 
	.C(long_counter[3]), 
	.B(n36), 
	.A(n44));
   OAI22X1M U71 (.Y(n50), 
	.B1(n74), 
	.B0(n32), 
	.A1(n81), 
	.A0(n31));
   XNOR2X2M U72 (.Y(n32), 
	.B(n33), 
	.A(test_so));
   NOR2X2M U73 (.Y(n33), 
	.B(n80), 
	.A(n28));
   XNOR2X2M U74 (.Y(n49), 
	.B(n74), 
	.A(short_counter[0]));
   OAI2BB2X1M U75 (.Y(n52), 
	.B1(n18), 
	.B0(n36), 
	.A1N(n37), 
	.A0N(N38));
   OAI2BB2X1M U76 (.Y(n57), 
	.B1(n19), 
	.B0(n36), 
	.A1N(n37), 
	.A0N(N39));
   AO2B2X2M U77 (.Y(n56), 
	.B1(n37), 
	.B0(N34), 
	.A1N(n36), 
	.A0(long_counter[0]));
   ADDHX1M U78 (.S(N35), 
	.CO(\add_62/carry[2] ), 
	.B(long_counter[0]), 
	.A(long_counter[1]));
   ADDHX1M U79 (.S(N36), 
	.CO(\add_62/carry[3] ), 
	.B(\add_62/carry[2] ), 
	.A(long_counter[2]));
   ADDHX1M U80 (.S(N37), 
	.CO(\add_62/carry[4] ), 
	.B(\add_62/carry[3] ), 
	.A(long_counter[3]));
   ADDHX1M U81 (.S(N38), 
	.CO(\add_62/carry[5] ), 
	.B(\add_62/carry[4] ), 
	.A(long_counter[4]));
   CLKXOR2X2M U82 (.Y(N39), 
	.B(long_counter[5]), 
	.A(\add_62/carry[5] ));
   DLY1X1M U83 (.Y(n90), 
	.A(test_se));
   DLY1X1M U84 (.Y(n91), 
	.A(test_se));
   DLY1X1M U85 (.Y(n92), 
	.A(test_se));
   DLY1X1M U86 (.Y(n93), 
	.A(n97));
   DLY1X1M U87 (.Y(n94), 
	.A(n98));
   DLY1X1M U88 (.Y(n95), 
	.A(n100));
   DLY1X1M U89 (.Y(n96), 
	.A(n101));
   DLY1X1M U90 (.Y(n97), 
	.A(n92));
   DLY1X1M U91 (.Y(n98), 
	.A(n90));
   DLY1X1M U93 (.Y(n100), 
	.A(n90));
   DLY1X1M U94 (.Y(n101), 
	.A(n91));
   SDFFSX1M \counter_state_reg[1]  (.SN(rst_n), 
	.SI(counter_state[0]), 
	.SE(n96), 
	.QN(n20), 
	.Q(counter_state[1]), 
	.D(n51), 
	.CK(clk));
   SDFFRX1M \short_counter_reg[3]  (.SI(short_counter[2]), 
	.SE(n97), 
	.RN(rst_n), 
	.QN(n81), 
	.Q(short_counter[3]), 
	.D(n50), 
	.CK(clk));
   SDFFRX1M \long_counter_reg[2]  (.SI(n102), 
	.SE(n101), 
	.RN(rst_n), 
	.QN(n77), 
	.Q(long_counter[2]), 
	.D(n54), 
	.CK(clk));
   SDFFRX1M almost_done_reg (.SI(test_si), 
	.SE(n98), 
	.RN(rst_n), 
	.Q(almost_done), 
	.D(N57), 
	.CK(clk));
   SDFFRX1M \short_counter_reg[1]  (.SI(n24), 
	.SE(n99), 
	.RN(rst_n), 
	.QN(n82), 
	.Q(short_counter[1]), 
	.D(n48), 
	.CK(clk));
   SDFFRX1M \long_counter_reg[4]  (.SI(long_counter[3]), 
	.SE(n93), 
	.RN(rst_n), 
	.QN(n18), 
	.Q(long_counter[4]), 
	.D(n52), 
	.CK(clk));
   SDFFRX1M \long_counter_reg[1]  (.SI(N34), 
	.SE(n94), 
	.RN(rst_n), 
	.QN(n102), 
	.Q(long_counter[1]), 
	.D(n55), 
	.CK(clk));
   SDFFRX1M done_FSM_reg (.SI(n20), 
	.SE(n94), 
	.RN(rst_n), 
	.QN(n85), 
	.Q(done_FSM), 
	.D(N56), 
	.CK(clk));
   SDFFRX1M \counter_state_reg[0]  (.SI(almost_done), 
	.SE(n95), 
	.RN(rst_n), 
	.QN(n75), 
	.Q(counter_state[0]), 
	.D(n58), 
	.CK(clk));
   SDFFRX2M \long_counter_reg[0]  (.SI(n85), 
	.SE(n95), 
	.RN(rst_n), 
	.QN(N34), 
	.Q(long_counter[0]), 
	.D(n56), 
	.CK(clk));
   SDFFRX2M \short_counter_reg[2]  (.SI(n82), 
	.SE(n99), 
	.RN(rst_n), 
	.QN(n80), 
	.Q(short_counter[2]), 
	.D(n47), 
	.CK(clk));
   SDFFRX2M \long_counter_reg[5]  (.SI(n18), 
	.SE(n96), 
	.RN(rst_n), 
	.QN(n19), 
	.Q(long_counter[5]), 
	.D(n57), 
	.CK(clk));
   SDFFRX2M \short_counter_reg[0]  (.SI(n19), 
	.SE(n93), 
	.RN(rst_n), 
	.Q(short_counter[0]), 
	.D(n49), 
	.CK(clk));
   NOR3X2M U3 (.Y(n41), 
	.C(n18), 
	.B(n78), 
	.A(n19));
   NOR4X1M U4 (.Y(n44), 
	.D(long_counter[0]), 
	.C(n19), 
	.B(n18), 
	.A(n77));
   INVXLM U7 (.Y(n3), 
	.A(short_counter[3]));
   INVX2M U8 (.Y(test_so), 
	.A(n3));
   BUFX2M U13 (.Y(n99), 
	.A(n91));
endmodule

module traffic_lights_test_1 (
	clk, 
	rst_n, 
	i_sensor_1_1, 
	i_sensor_1_5, 
	i_sensor_2_1, 
	i_sensor_2_5, 
	i_sensor_3_1, 
	i_sensor_3_5, 
	i_sensor_4_1, 
	i_sensor_4_5, 
	counter_done, 
	short_counter, 
	long_counter, 
	current_state, 
	test_si, 
	test_so, 
	test_se);
   input clk;
   input rst_n;
   input i_sensor_1_1;
   input i_sensor_1_5;
   input i_sensor_2_1;
   input i_sensor_2_5;
   input i_sensor_3_1;
   input i_sensor_3_5;
   input i_sensor_4_1;
   input i_sensor_4_5;
   input counter_done;
   output short_counter;
   output long_counter;
   output [3:0] current_state;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire n36;
   wire n37;
   wire n17;
   wire n18;
   wire n19;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n5;
   wire n6;
   wire n7;
   wire n11;
   wire n20;
   wire n26;
   wire n27;
   wire n29;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n39;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n48;
   wire [3:0] ns;

   AOI2BB1X2M U12 (.Y(n17), 
	.B0(counter_done), 
	.A1N(long_counter), 
	.A0N(short_counter));
   OAI221X1M U16 (.Y(long_counter), 
	.C0(n25), 
	.B1(n33), 
	.B0(n27), 
	.A1(n34), 
	.A0(n29));
   OR4X1M U8 (.Y(n5), 
	.D(current_state[2]), 
	.C(current_state[1]), 
	.B(current_state[0]), 
	.A(n45));
   INVX2M U9 (.Y(n6), 
	.A(n5));
   CLKINVX2M U10 (.Y(n27), 
	.A(n24));
   AOI33X1M U13 (.Y(n21), 
	.B2(i_sensor_2_1), 
	.B1(n33), 
	.B0(n24), 
	.A2(i_sensor_3_1), 
	.A1(n34), 
	.A0(n23));
   CLKINVX2M U15 (.Y(current_state[0]), 
	.A(n7));
   INVXLM U19 (.Y(n11), 
	.A(n37));
   CLKINVX2M U20 (.Y(current_state[1]), 
	.A(n11));
   INVX2M U25 (.Y(n29), 
	.A(n23));
   OAI221X1M U26 (.Y(ns[0]), 
	.C0(n19), 
	.B1(n20), 
	.B0(n27), 
	.A1(n5), 
	.A0(n17));
   NAND4X2M U27 (.Y(n19), 
	.D(n27), 
	.C(n29), 
	.B(n18), 
	.A(n5));
   INVX2M U28 (.Y(n20), 
	.A(n17));
   OAI22X1M U29 (.Y(ns[2]), 
	.B1(n20), 
	.B0(n18), 
	.A1(n29), 
	.A0(n17));
   OAI22X1M U30 (.Y(ns[3]), 
	.B1(n20), 
	.B0(n5), 
	.A1(n18), 
	.A0(n17));
   OAI22X1M U31 (.Y(ns[1]), 
	.B1(n20), 
	.B0(n29), 
	.A1(n27), 
	.A0(n17));
   INVX2M U32 (.Y(n26), 
	.A(n18));
   AOI22X1M U33 (.Y(n25), 
	.B1(n26), 
	.B0(i_sensor_4_5), 
	.A1(n6), 
	.A0(i_sensor_1_5));
   NAND2X2M U34 (.Y(short_counter), 
	.B(n22), 
	.A(n21));
   AOI33X2M U35 (.Y(n22), 
	.B2(i_sensor_4_1), 
	.B1(n35), 
	.B0(n26), 
	.A2(i_sensor_1_1), 
	.A1(n32), 
	.A0(n6));
   INVX2M U36 (.Y(n32), 
	.A(i_sensor_1_5));
   INVX2M U37 (.Y(n35), 
	.A(i_sensor_4_5));
   INVX2M U38 (.Y(n34), 
	.A(i_sensor_3_5));
   INVX2M U39 (.Y(n33), 
	.A(i_sensor_2_5));
   DLY1X1M U17 (.Y(n42), 
	.A(test_se));
   DLY1X1M U41 (.Y(n43), 
	.A(test_se));
   CLKINVX2M U44 (.Y(current_state[3]), 
	.A(n45));
   SDFFRX1M \cs_reg[3]  (.SI(n39), 
	.SE(n42), 
	.RN(rst_n), 
	.QN(n45), 
	.Q(n36), 
	.D(ns[3]), 
	.CK(clk));
   SDFFRX4M \cs_reg[2]  (.SI(n48), 
	.SE(n42), 
	.RN(rst_n), 
	.QN(n39), 
	.Q(current_state[2]), 
	.D(ns[2]), 
	.CK(clk));
   SDFFSX2M \cs_reg[0]  (.SN(rst_n), 
	.SI(test_si), 
	.SE(n43), 
	.QN(n7), 
	.D(ns[0]), 
	.CK(clk));
   SDFFRX2M \cs_reg[1]  (.SI(n7), 
	.SE(n43), 
	.RN(rst_n), 
	.QN(n48), 
	.Q(n37), 
	.D(ns[1]), 
	.CK(clk));
   NOR4X1M U5 (.Y(n23), 
	.D(n48), 
	.C(current_state[2]), 
	.B(current_state[0]), 
	.A(current_state[3]));
   CLKINVX12M U11 (.Y(test_so), 
	.A(n44));
   INVX2M U14 (.Y(n44), 
	.A(n36));
   NOR4X1M U18 (.Y(n24), 
	.D(current_state[3]), 
	.C(current_state[2]), 
	.B(current_state[1]), 
	.A(n7));
   NAND4X2M U21 (.Y(n18), 
	.D(n45), 
	.C(current_state[2]), 
	.B(n48), 
	.A(n7));
endmodule

module actuator (
	state, 
	almost_done, 
	LED_RED_1, 
	LED_RED_2, 
	LED_RED_3, 
	LED_RED_4, 
	LED_GREEN_1, 
	LED_GREEN_2, 
	LED_GREEN_3, 
	LED_GREEN_4, 
	LED_YELLOW_1, 
	LED_YELLOW_2, 
	LED_YELLOW_3, 
	LED_YELLOW_4);
   input [3:0] state;
   input almost_done;
   output LED_RED_1;
   output LED_RED_2;
   output LED_RED_3;
   output LED_RED_4;
   output LED_GREEN_1;
   output LED_GREEN_2;
   output LED_GREEN_3;
   output LED_GREEN_4;
   output LED_YELLOW_1;
   output LED_YELLOW_2;
   output LED_YELLOW_3;
   output LED_YELLOW_4;

   // Internal wires
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire almost_done_flag;
   wire N32;
   wire N33;
   wire n3;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire [3:0] state_mem;

   TLATX4M almost_done_flag_reg (.QN(n3), 
	.Q(almost_done_flag), 
	.G(N32), 
	.D(N33));
   NAND3X12M U14 (.Y(LED_RED_4), 
	.C(n17), 
	.B(n14), 
	.A(n15));
   NAND3X12M U15 (.Y(LED_RED_3), 
	.C(n17), 
	.B(n13), 
	.A(n15));
   NAND3X12M U16 (.Y(LED_RED_2), 
	.C(n17), 
	.B(n13), 
	.A(n14));
   NAND4X12M U18 (.Y(LED_RED_1), 
	.D(n18), 
	.C(n13), 
	.B(n14), 
	.A(n15));
   TLATX2M \state_mem_reg[2]  (.Q(state_mem[2]), 
	.G(almost_done), 
	.D(state[2]));
   TLATX2M \state_mem_reg[1]  (.Q(state_mem[1]), 
	.G(almost_done), 
	.D(state[1]));
   TLATX2M \state_mem_reg[0]  (.Q(state_mem[0]), 
	.G(almost_done), 
	.D(state[0]));
   TLATX2M \state_mem_reg[3]  (.Q(state_mem[3]), 
	.G(almost_done), 
	.D(state[3]));
   NAND4X2M U3 (.Y(n16), 
	.D(n23), 
	.C(n24), 
	.B(n22), 
	.A(state[0]));
   NAND4X2M U4 (.Y(n13), 
	.D(n24), 
	.C(n22), 
	.B(n21), 
	.A(state[3]));
   NAND4X2M U5 (.Y(n15), 
	.D(n23), 
	.C(n24), 
	.B(n21), 
	.A(state[1]));
   OR2X2M U6 (.Y(n25), 
	.B(n16), 
	.A(almost_done_flag));
   CLKINVX12M U7 (.Y(LED_GREEN_1), 
	.A(n25));
   OR2X2M U8 (.Y(n26), 
	.B(n15), 
	.A(almost_done_flag));
   CLKINVX12M U9 (.Y(LED_GREEN_2), 
	.A(n26));
   OR2X2M U10 (.Y(n28), 
	.B(n13), 
	.A(almost_done_flag));
   CLKINVX12M U11 (.Y(LED_GREEN_4), 
	.A(n28));
   OR2X2M U12 (.Y(n29), 
	.B(n16), 
	.A(n3));
   CLKINVX12M U13 (.Y(LED_YELLOW_1), 
	.A(n29));
   OR2X2M U17 (.Y(n27), 
	.B(n14), 
	.A(almost_done_flag));
   CLKINVX12M U19 (.Y(LED_GREEN_3), 
	.A(n27));
   OR2X2M U20 (.Y(n32), 
	.B(n13), 
	.A(n3));
   CLKINVX12M U21 (.Y(LED_YELLOW_4), 
	.A(n32));
   OR2X2M U22 (.Y(n31), 
	.B(n14), 
	.A(n3));
   CLKINVX12M U23 (.Y(LED_YELLOW_3), 
	.A(n31));
   OR2X2M U24 (.Y(n30), 
	.B(n15), 
	.A(n3));
   CLKINVX12M U25 (.Y(LED_YELLOW_2), 
	.A(n30));
   NAND4X2M U26 (.Y(n14), 
	.D(n23), 
	.C(n22), 
	.B(n21), 
	.A(state[2]));
   NAND4X2M U27 (.Y(n18), 
	.D(n13), 
	.C(n14), 
	.B(n15), 
	.A(n16));
   AND2X2M U28 (.Y(n17), 
	.B(n18), 
	.A(n16));
   INVX2M U29 (.Y(n24), 
	.A(state[2]));
   INVX2M U30 (.Y(n23), 
	.A(state[3]));
   INVX2M U31 (.Y(n22), 
	.A(state[1]));
   INVX2M U32 (.Y(n21), 
	.A(state[0]));
   XNOR2X2M U33 (.Y(n12), 
	.B(state_mem[2]), 
	.A(state[2]));
   OAI21X2M U34 (.Y(N33), 
	.B0(n8), 
	.A1(almost_done), 
	.A0(almost_done_flag));
   NAND4X2M U35 (.Y(n8), 
	.D(n12), 
	.C(n11), 
	.B(n10), 
	.A(n9));
   XNOR2X2M U36 (.Y(n11), 
	.B(state_mem[0]), 
	.A(state[0]));
   XNOR2X2M U37 (.Y(n10), 
	.B(state_mem[1]), 
	.A(state[1]));
   XNOR2X2M U38 (.Y(n9), 
	.B(state_mem[3]), 
	.A(state[3]));
   AO21X2M U39 (.Y(N32), 
	.B0(almost_done), 
	.A1(almost_done_flag), 
	.A0(n8));
endmodule

