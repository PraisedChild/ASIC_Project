/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Dec  4 03:07:07 2024
/////////////////////////////////////////////////////////////


module counter_test_1 ( i_short_counter, i_long_counter, clk, rst_n, done_FSM, 
        almost_done, test_si, test_so, test_se );
  input i_short_counter, i_long_counter, clk, rst_n, test_si, test_se;
  output done_FSM, almost_done, test_so;
  wire   N34, N35, N36, N37, N38, N39, N56, N57, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         \add_62/carry[5] , \add_62/carry[4] , \add_62/carry[3] ,
         \add_62/carry[2] , n16, n17, n18, n19, n20, n21, n22, n24, n71, n72,
         n73, n74, n75, n77, n78, n80, n81, n82, n85, n87, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n104, n105, n1, n2,
         n3, n5, n6, n7, n8, n9, n10, n11;
  wire   [3:0] short_counter;
  wire   [1:0] counter_state;
  wire   [5:0] long_counter;

  OAI2B11X4M U35 ( .A1N(n71), .A0(n38), .B0(n39), .C0(n40), .Y(n34) );
  SDFFRX2M \long_counter_reg[3]  ( .D(n53), .SI(n105), .SE(n100), .CK(clk), 
        .RN(rst_n), .Q(long_counter[3]), .QN(n78) );
  OAI21X2M U17 ( .A0(n24), .A1(n74), .B0(n10), .Y(n30) );
  NAND4X2M U18 ( .A(n22), .B(long_counter[0]), .C(long_counter[2]), .D(n41), 
        .Y(n38) );
  OAI31X2M U20 ( .A0(n45), .A1(n80), .A2(n17), .B0(n46), .Y(N56) );
  OAI31X2M U21 ( .A0(n74), .A1(n10), .A2(n24), .B0(n30), .Y(n48) );
  INVXLM U23 ( .A(n81), .Y(n16) );
  INVX2M U24 ( .A(n16), .Y(n17) );
  NAND4X1M U27 ( .A(n44), .B(n71), .C(n78), .D(n2), .Y(n43) );
  INVXLM U29 ( .A(long_counter[1]), .Y(n21) );
  INVX2M U30 ( .A(n21), .Y(n22) );
  INVX2M U32 ( .A(short_counter[0]), .Y(n24) );
  OR3X1M U33 ( .A(n10), .B(n24), .C(test_so), .Y(n42) );
  NAND3XLM U34 ( .A(n10), .B(n24), .C(n31), .Y(n45) );
  OAI32X2M U51 ( .A0(n72), .A1(i_long_counter), .A2(n73), .B0(n75), .B1(n34), 
        .Y(n58) );
  OAI22X1M U52 ( .A0(n8), .A1(n34), .B0(n73), .B1(n35), .Y(n51) );
  NOR2X2M U53 ( .A(i_long_counter), .B(n72), .Y(n35) );
  INVX2M U54 ( .A(i_short_counter), .Y(n72) );
  INVX4M U55 ( .A(n31), .Y(n74) );
  INVX2M U56 ( .A(n34), .Y(n73) );
  CLKAND2X4M U57 ( .A(n71), .B(n38), .Y(n37) );
  OAI2BB2X1M U58 ( .B0(n71), .B1(n78), .A0N(N37), .A1N(n37), .Y(n53) );
  OAI2BB2X1M U59 ( .B0(n71), .B1(n2), .A0N(N35), .A1N(n37), .Y(n55) );
  OAI2BB2X1M U60 ( .B0(n71), .B1(n105), .A0N(N36), .A1N(n37), .Y(n54) );
  XNOR2X2M U61 ( .A(n104), .B(n8), .Y(n40) );
  OR4X1M U62 ( .A(n28), .B(n17), .C(n80), .D(n74), .Y(n39) );
  NOR2X4M U63 ( .A(n75), .B(counter_state[1]), .Y(n31) );
  NAND2X2M U64 ( .A(n10), .B(short_counter[0]), .Y(n28) );
  CLKBUFX6M U65 ( .A(n36), .Y(n71) );
  NOR2X2M U66 ( .A(n8), .B(counter_state[0]), .Y(n36) );
  OAI31X2M U67 ( .A0(n42), .A1(n74), .A2(n80), .B0(n43), .Y(N57) );
  OAI31X2M U68 ( .A0(n28), .A1(short_counter[2]), .A2(n74), .B0(n29), .Y(n47)
         );
  OAI21X2M U69 ( .A0(n74), .A1(n28), .B0(short_counter[2]), .Y(n29) );
  NAND4X2M U70 ( .A(n44), .B(n71), .C(long_counter[3]), .D(n22), .Y(n46) );
  OAI22X1M U71 ( .A0(n31), .A1(n17), .B0(n32), .B1(n74), .Y(n50) );
  XNOR2X2M U72 ( .A(test_so), .B(n33), .Y(n32) );
  NOR2X2M U73 ( .A(n28), .B(n80), .Y(n33) );
  XNOR2X2M U74 ( .A(short_counter[0]), .B(n74), .Y(n49) );
  OAI2BB2X1M U75 ( .B0(n71), .B1(n6), .A0N(N38), .A1N(n37), .Y(n52) );
  OAI2BB2X1M U76 ( .B0(n71), .B1(n19), .A0N(N39), .A1N(n37), .Y(n57) );
  AO2B2X2M U77 ( .B0(N34), .B1(n37), .A0(long_counter[0]), .A1N(n71), .Y(n56)
         );
  ADDHX1M U78 ( .A(n22), .B(long_counter[0]), .CO(\add_62/carry[2] ), .S(N35)
         );
  ADDHX1M U79 ( .A(long_counter[2]), .B(\add_62/carry[2] ), .CO(
        \add_62/carry[3] ), .S(N36) );
  ADDHX1M U80 ( .A(long_counter[3]), .B(\add_62/carry[3] ), .CO(
        \add_62/carry[4] ), .S(N37) );
  ADDHX1M U81 ( .A(long_counter[4]), .B(\add_62/carry[4] ), .CO(
        \add_62/carry[5] ), .S(N38) );
  CLKXOR2X2M U82 ( .A(\add_62/carry[5] ), .B(long_counter[5]), .Y(N39) );
  DLY1X1M U83 ( .A(test_se), .Y(n90) );
  DLY1X1M U84 ( .A(test_se), .Y(n91) );
  DLY1X1M U85 ( .A(test_se), .Y(n92) );
  DLY1X1M U86 ( .A(n97), .Y(n93) );
  DLY1X1M U87 ( .A(n98), .Y(n94) );
  DLY1X1M U88 ( .A(n100), .Y(n95) );
  DLY1X1M U89 ( .A(n101), .Y(n96) );
  DLY1X1M U90 ( .A(n92), .Y(n97) );
  DLY1X1M U91 ( .A(n90), .Y(n98) );
  DLY1X1M U93 ( .A(n90), .Y(n100) );
  DLY1X1M U94 ( .A(n91), .Y(n101) );
  DLY1X1M U97 ( .A(counter_state[0]), .Y(n104) );
  DLY1X1M U98 ( .A(n77), .Y(n105) );
  SDFFSX1M \counter_state_reg[1]  ( .D(n51), .SI(n104), .SE(n96), .CK(clk), 
        .SN(rst_n), .Q(counter_state[1]), .QN(n20) );
  SDFFRX1M \short_counter_reg[3]  ( .D(n50), .SI(short_counter[2]), .SE(n97), 
        .CK(clk), .RN(rst_n), .Q(short_counter[3]), .QN(n81) );
  SDFFRX1M \long_counter_reg[2]  ( .D(n54), .SI(n2), .SE(n101), .CK(clk), .RN(
        rst_n), .Q(long_counter[2]), .QN(n77) );
  SDFFRX1M almost_done_reg ( .D(N57), .SI(test_si), .SE(n98), .CK(clk), .RN(
        rst_n), .Q(n87) );
  SDFFRX1M \short_counter_reg[1]  ( .D(n48), .SI(n24), .SE(n99), .CK(clk), 
        .RN(rst_n), .Q(short_counter[1]), .QN(n82) );
  SDFFRX1M \long_counter_reg[4]  ( .D(n52), .SI(long_counter[3]), .SE(n93), 
        .CK(clk), .RN(rst_n), .Q(long_counter[4]), .QN(n18) );
  SDFFRX1M \long_counter_reg[1]  ( .D(n55), .SI(N34), .SE(n94), .CK(clk), .RN(
        rst_n), .Q(long_counter[1]), .QN(n102) );
  SDFFRX1M done_FSM_reg ( .D(N56), .SI(n8), .SE(n94), .CK(clk), .RN(rst_n), 
        .Q(done_FSM), .QN(n85) );
  SDFFRX1M \counter_state_reg[0]  ( .D(n58), .SI(almost_done), .SE(n95), .CK(
        clk), .RN(rst_n), .Q(counter_state[0]), .QN(n75) );
  SDFFRX2M \long_counter_reg[0]  ( .D(n56), .SI(n85), .SE(n95), .CK(clk), .RN(
        rst_n), .Q(long_counter[0]), .QN(N34) );
  SDFFRX2M \short_counter_reg[2]  ( .D(n47), .SI(n82), .SE(n99), .CK(clk), 
        .RN(rst_n), .Q(short_counter[2]), .QN(n80) );
  SDFFRX2M \long_counter_reg[5]  ( .D(n57), .SI(n6), .SE(n96), .CK(clk), .RN(
        rst_n), .Q(long_counter[5]), .QN(n19) );
  SDFFRX2M \short_counter_reg[0]  ( .D(n49), .SI(n19), .SE(n93), .CK(clk), 
        .RN(rst_n), .Q(short_counter[0]) );
  NOR3X2M U3 ( .A(n19), .B(n78), .C(n6), .Y(n41) );
  NOR4X4M U4 ( .A(n77), .B(n6), .C(n19), .D(long_counter[0]), .Y(n44) );
  INVXLM U5 ( .A(n102), .Y(n1) );
  INVX2M U6 ( .A(n1), .Y(n2) );
  INVXLM U7 ( .A(short_counter[3]), .Y(n3) );
  INVX2M U8 ( .A(n3), .Y(test_so) );
  INVXLM U9 ( .A(n18), .Y(n5) );
  INVX2M U10 ( .A(n5), .Y(n6) );
  INVXLM U11 ( .A(n20), .Y(n7) );
  INVX2M U12 ( .A(n7), .Y(n8) );
  BUFX2M U13 ( .A(n91), .Y(n99) );
  INVXLM U14 ( .A(short_counter[1]), .Y(n9) );
  INVX4M U15 ( .A(n9), .Y(n10) );
  INVXLM U16 ( .A(n87), .Y(n11) );
  INVX6M U19 ( .A(n11), .Y(almost_done) );
endmodule


module traffic_lights_test_1 ( clk, rst_n, i_sensor_1_1, i_sensor_1_5, 
        i_sensor_2_1, i_sensor_2_5, i_sensor_3_1, i_sensor_3_5, i_sensor_4_1, 
        i_sensor_4_5, counter_done, short_counter, long_counter, current_state, 
        test_si, test_so, test_se );
  output [3:0] current_state;
  input clk, rst_n, i_sensor_1_1, i_sensor_1_5, i_sensor_2_1, i_sensor_2_5,
         i_sensor_3_1, i_sensor_3_5, i_sensor_4_1, i_sensor_4_5, counter_done,
         test_si, test_se;
  output short_counter, long_counter, test_so;
  wire   n36, n37, n17, n18, n19, n21, n22, n23, n24, n25, n5, n6, n7, n11,
         n20, n26, n27, n29, n32, n33, n34, n35, n39, n42, n43, n44, n45, n48,
         n1, n2, n3, n4;
  wire   [3:0] ns;

  AOI2BB1X8M U12 ( .A0N(short_counter), .A1N(long_counter), .B0(counter_done), 
        .Y(n17) );
  OAI221X4M U16 ( .A0(n29), .A1(n34), .B0(n27), .B1(n33), .C0(n25), .Y(
        long_counter) );
  OR4X2M U8 ( .A(n4), .B(current_state[0]), .C(current_state[1]), .D(
        current_state[2]), .Y(n5) );
  INVX2M U9 ( .A(n5), .Y(n6) );
  CLKINVX2M U10 ( .A(n24), .Y(n27) );
  AOI33X1M U13 ( .A0(n23), .A1(n34), .A2(i_sensor_3_1), .B0(n24), .B1(n33), 
        .B2(i_sensor_2_1), .Y(n21) );
  INVX4M U15 ( .A(n7), .Y(current_state[0]) );
  INVXLM U19 ( .A(n37), .Y(n11) );
  INVX4M U20 ( .A(n11), .Y(current_state[1]) );
  INVX2M U25 ( .A(n23), .Y(n29) );
  OAI221X1M U26 ( .A0(n17), .A1(n5), .B0(n27), .B1(n20), .C0(n19), .Y(ns[0])
         );
  NAND4X2M U27 ( .A(n5), .B(n2), .C(n29), .D(n27), .Y(n19) );
  INVX2M U28 ( .A(n17), .Y(n20) );
  OAI22X1M U29 ( .A0(n17), .A1(n29), .B0(n2), .B1(n20), .Y(ns[2]) );
  OAI22X1M U30 ( .A0(n17), .A1(n2), .B0(n5), .B1(n20), .Y(ns[3]) );
  OAI22X1M U31 ( .A0(n17), .A1(n27), .B0(n29), .B1(n20), .Y(ns[1]) );
  INVX2M U32 ( .A(n2), .Y(n26) );
  AOI22X1M U33 ( .A0(i_sensor_1_5), .A1(n6), .B0(i_sensor_4_5), .B1(n26), .Y(
        n25) );
  NAND2X2M U34 ( .A(n21), .B(n22), .Y(short_counter) );
  AOI33X2M U35 ( .A0(n6), .A1(n32), .A2(i_sensor_1_1), .B0(n26), .B1(n35), 
        .B2(i_sensor_4_1), .Y(n22) );
  INVX2M U36 ( .A(i_sensor_1_5), .Y(n32) );
  INVX2M U37 ( .A(i_sensor_4_5), .Y(n35) );
  INVX2M U38 ( .A(i_sensor_3_5), .Y(n34) );
  INVX2M U39 ( .A(i_sensor_2_5), .Y(n33) );
  DLY1X1M U17 ( .A(test_se), .Y(n42) );
  DLY1X1M U41 ( .A(test_se), .Y(n43) );
  INVX4M U44 ( .A(n4), .Y(current_state[3]) );
  SDFFRX1M \cs_reg[3]  ( .D(ns[3]), .SI(n39), .SE(n42), .CK(clk), .RN(rst_n), 
        .Q(n36), .QN(n45) );
  SDFFRX4M \cs_reg[2]  ( .D(ns[2]), .SI(n48), .SE(n42), .CK(clk), .RN(rst_n), 
        .Q(current_state[2]), .QN(n39) );
  SDFFSX2M \cs_reg[0]  ( .D(ns[0]), .SI(test_si), .SE(n43), .CK(clk), .SN(
        rst_n), .QN(n7) );
  SDFFRX2M \cs_reg[1]  ( .D(ns[1]), .SI(n7), .SE(n43), .CK(clk), .RN(rst_n), 
        .Q(n37), .QN(n48) );
  INVXLM U3 ( .A(n18), .Y(n1) );
  INVX2M U4 ( .A(n1), .Y(n2) );
  NOR4X4M U5 ( .A(current_state[3]), .B(current_state[0]), .C(current_state[2]), .D(n48), .Y(n23) );
  INVXLM U6 ( .A(n45), .Y(n3) );
  INVX2M U7 ( .A(n3), .Y(n4) );
  INVX8M U11 ( .A(n44), .Y(test_so) );
  INVX2M U14 ( .A(n36), .Y(n44) );
  NOR4X4M U18 ( .A(n7), .B(current_state[1]), .C(current_state[2]), .D(
        current_state[3]), .Y(n24) );
  NAND4X2M U21 ( .A(n7), .B(n48), .C(current_state[2]), .D(n4), .Y(n18) );
endmodule


module actuator ( state, almost_done, LED_RED_1, LED_RED_2, LED_RED_3, 
        LED_RED_4, LED_GREEN_1, LED_GREEN_2, LED_GREEN_3, LED_GREEN_4, 
        LED_YELLOW_1, LED_YELLOW_2, LED_YELLOW_3, LED_YELLOW_4 );
  input [3:0] state;
  input almost_done;
  output LED_RED_1, LED_RED_2, LED_RED_3, LED_RED_4, LED_GREEN_1, LED_GREEN_2,
         LED_GREEN_3, LED_GREEN_4, LED_YELLOW_1, LED_YELLOW_2, LED_YELLOW_3,
         LED_YELLOW_4;
  wire   n25, n26, n27, n28, n29, n30, n31, n32, almost_done_flag, N32, N33,
         n3, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n21, n22,
         n23, n24;
  wire   [3:0] state_mem;

  TLATX4M almost_done_flag_reg ( .G(N32), .D(N33), .Q(almost_done_flag), .QN(
        n3) );
  NAND3X12M U14 ( .A(n15), .B(n14), .C(n17), .Y(LED_RED_4) );
  NAND3X12M U15 ( .A(n15), .B(n13), .C(n17), .Y(LED_RED_3) );
  NAND3X12M U16 ( .A(n14), .B(n13), .C(n17), .Y(LED_RED_2) );
  NAND4X12M U18 ( .A(n15), .B(n14), .C(n13), .D(n18), .Y(LED_RED_1) );
  TLATX2M \state_mem_reg[2]  ( .G(almost_done), .D(state[2]), .Q(state_mem[2])
         );
  TLATX2M \state_mem_reg[1]  ( .G(almost_done), .D(state[1]), .Q(state_mem[1])
         );
  TLATX2M \state_mem_reg[0]  ( .G(almost_done), .D(state[0]), .Q(state_mem[0])
         );
  TLATX2M \state_mem_reg[3]  ( .G(almost_done), .D(state[3]), .Q(state_mem[3])
         );
  NAND4X4M U3 ( .A(state[0]), .B(n22), .C(n24), .D(n23), .Y(n16) );
  NAND4X6M U4 ( .A(state[3]), .B(n21), .C(n22), .D(n24), .Y(n13) );
  NAND4X6M U5 ( .A(state[1]), .B(n21), .C(n24), .D(n23), .Y(n15) );
  OR2X2M U6 ( .A(almost_done_flag), .B(n16), .Y(n25) );
  INVX8M U7 ( .A(n25), .Y(LED_GREEN_1) );
  OR2X2M U8 ( .A(almost_done_flag), .B(n15), .Y(n26) );
  INVX8M U9 ( .A(n26), .Y(LED_GREEN_2) );
  OR2X2M U10 ( .A(almost_done_flag), .B(n13), .Y(n28) );
  INVX8M U11 ( .A(n28), .Y(LED_GREEN_4) );
  OR2X2M U12 ( .A(n3), .B(n16), .Y(n29) );
  INVX8M U13 ( .A(n29), .Y(LED_YELLOW_1) );
  OR2X2M U17 ( .A(almost_done_flag), .B(n14), .Y(n27) );
  INVX8M U19 ( .A(n27), .Y(LED_GREEN_3) );
  OR2X2M U20 ( .A(n3), .B(n13), .Y(n32) );
  INVX8M U21 ( .A(n32), .Y(LED_YELLOW_4) );
  OR2X2M U22 ( .A(n3), .B(n14), .Y(n31) );
  INVX8M U23 ( .A(n31), .Y(LED_YELLOW_3) );
  OR2X2M U24 ( .A(n3), .B(n15), .Y(n30) );
  INVX8M U25 ( .A(n30), .Y(LED_YELLOW_2) );
  NAND4X6M U26 ( .A(state[2]), .B(n21), .C(n22), .D(n23), .Y(n14) );
  NAND4X2M U27 ( .A(n16), .B(n15), .C(n14), .D(n13), .Y(n18) );
  AND2X2M U28 ( .A(n16), .B(n18), .Y(n17) );
  INVX2M U29 ( .A(state[2]), .Y(n24) );
  INVX2M U30 ( .A(state[3]), .Y(n23) );
  INVX2M U31 ( .A(state[1]), .Y(n22) );
  INVX2M U32 ( .A(state[0]), .Y(n21) );
  XNOR2X2M U33 ( .A(state[2]), .B(state_mem[2]), .Y(n12) );
  OAI21X2M U34 ( .A0(almost_done_flag), .A1(almost_done), .B0(n8), .Y(N33) );
  NAND4X2M U35 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n8) );
  XNOR2X2M U36 ( .A(state[0]), .B(state_mem[0]), .Y(n11) );
  XNOR2X2M U37 ( .A(state[1]), .B(state_mem[1]), .Y(n10) );
  XNOR2X2M U38 ( .A(state[3]), .B(state_mem[3]), .Y(n9) );
  AO21X2M U39 ( .A0(n8), .A1(almost_done_flag), .B0(almost_done), .Y(N32) );
endmodule


module top_module ( clk, rst_n, i_sensor_1_1, i_sensor_1_5, i_sensor_2_1, 
        i_sensor_2_5, i_sensor_3_1, i_sensor_3_5, i_sensor_4_1, i_sensor_4_5, 
        SI, SE, test_mode, scan_clk, scan_rst, SO, LED_RED_1, LED_RED_2, 
        LED_RED_3, LED_RED_4, LED_GREEN_1, LED_GREEN_2, LED_GREEN_3, 
        LED_GREEN_4, LED_YELLOW_1, LED_YELLOW_2, LED_YELLOW_3, LED_YELLOW_4 );
  input clk, rst_n, i_sensor_1_1, i_sensor_1_5, i_sensor_2_1, i_sensor_2_5,
         i_sensor_3_1, i_sensor_3_5, i_sensor_4_1, i_sensor_4_5, SI, SE,
         test_mode, scan_clk, scan_rst;
  output SO, LED_RED_1, LED_RED_2, LED_RED_3, LED_RED_4, LED_GREEN_1,
         LED_GREEN_2, LED_GREEN_3, LED_GREEN_4, LED_YELLOW_1, LED_YELLOW_2,
         LED_YELLOW_3, LED_YELLOW_4;
  wire   clk_dft, rst_n_dft, short_counter, long_counter, FSM_done,
         almost_done, n3, n5, n6, n7;
  wire   [3:0] state;

  CLKMX2X12M U3 ( .A(rst_n), .B(scan_rst), .S0(test_mode), .Y(rst_n_dft) );
  MX2X6M U4 ( .A(clk), .B(scan_clk), .S0(test_mode), .Y(clk_dft) );
  DLY1X1M U5 ( .A(n7), .Y(n5) );
  INVXLM U6 ( .A(SE), .Y(n6) );
  INVXLM U7 ( .A(n6), .Y(n7) );
  counter_test_1 count_mod ( .i_short_counter(short_counter), .i_long_counter(
        long_counter), .clk(clk_dft), .rst_n(rst_n_dft), .done_FSM(FSM_done), 
        .almost_done(almost_done), .test_si(SI), .test_so(n3), .test_se(SE) );
  traffic_lights_test_1 traff_mod ( .clk(clk_dft), .rst_n(rst_n_dft), 
        .i_sensor_1_1(i_sensor_1_1), .i_sensor_1_5(i_sensor_1_5), 
        .i_sensor_2_1(i_sensor_2_1), .i_sensor_2_5(i_sensor_2_5), 
        .i_sensor_3_1(i_sensor_3_1), .i_sensor_3_5(i_sensor_3_5), 
        .i_sensor_4_1(i_sensor_4_1), .i_sensor_4_5(i_sensor_4_5), 
        .counter_done(FSM_done), .short_counter(short_counter), .long_counter(
        long_counter), .current_state(state), .test_si(n3), .test_so(SO), 
        .test_se(n5) );
  actuator act_mod ( .state(state), .almost_done(almost_done), .LED_RED_1(
        LED_RED_1), .LED_RED_2(LED_RED_2), .LED_RED_3(LED_RED_3), .LED_RED_4(
        LED_RED_4), .LED_GREEN_1(LED_GREEN_1), .LED_GREEN_2(LED_GREEN_2), 
        .LED_GREEN_3(LED_GREEN_3), .LED_GREEN_4(LED_GREEN_4), .LED_YELLOW_1(
        LED_YELLOW_1), .LED_YELLOW_2(LED_YELLOW_2), .LED_YELLOW_3(LED_YELLOW_3), .LED_YELLOW_4(LED_YELLOW_4) );
endmodule

