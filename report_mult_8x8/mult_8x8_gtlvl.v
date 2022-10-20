/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP2
// Date      : Sat Oct 15 13:20:37 2022
/////////////////////////////////////////////////////////////


module mult_8x8_DW01_add_2 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:1] carry;
  assign SUM[3] = B[3];
  assign SUM[2] = B[2];
  assign SUM[1] = B[1];
  assign SUM[0] = B[0];

  FA1A U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  FA1A U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  FA1A U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  FA1A U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  FA1A U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FA1A U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FA1A U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FA1A U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  EO U1 ( .A(A[13]), .B(carry[13]), .Z(SUM[13]) );
  EO U2 ( .A(A[14]), .B(carry[14]), .Z(SUM[14]) );
  EO U3 ( .A(A[4]), .B(B[4]), .Z(SUM[4]) );
  EN U4 ( .A(A[15]), .B(n1), .Z(SUM[15]) );
  ND2 U5 ( .A(A[14]), .B(carry[14]), .Z(n1) );
  AN2P U6 ( .A(A[13]), .B(carry[13]), .Z(carry[14]) );
  AN2P U7 ( .A(A[4]), .B(B[4]), .Z(carry[5]) );
endmodule


module mult_8x8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [3:0] A;
  input [3:0] B;
  output [7:0] PRODUCT;
  input TC;
  wire   \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][3] , \ab[1][2] ,
         \ab[1][1] , \ab[1][0] , \ab[0][3] , \ab[0][2] , \ab[0][1] ,
         \CARRYB[3][2] , \CARRYB[3][1] , \CARRYB[3][0] , \CARRYB[2][2] ,
         \CARRYB[2][1] , \CARRYB[2][0] , \CARRYB[1][2] , \CARRYB[1][1] ,
         \CARRYB[1][0] , \SUMB[3][2] , \SUMB[3][1] , \SUMB[2][2] ,
         \SUMB[2][1] , \SUMB[1][2] , \SUMB[1][1] , \A1[4] , \A1[3] , \A2[5] ,
         \A2[4] , \A2[3] , n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18;

  FA1A S4_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(PRODUCT[3]) );
  FA1A S1_2_0 ( .A(\ab[2][0] ), .B(\CARRYB[1][0] ), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(PRODUCT[2]) );
  FA1A S5_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\ab[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  FA1A S4_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  FA1A S2_2_1 ( .A(\ab[2][1] ), .B(\CARRYB[1][1] ), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  FA1A S3_2_2 ( .A(\ab[2][2] ), .B(\CARRYB[1][2] ), .CI(\ab[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  OR2P U2 ( .A(\A2[3] ), .B(\A1[3] ), .Z(n2) );
  AN2P U3 ( .A(n2), .B(n4), .Z(PRODUCT[5]) );
  IVP U4 ( .A(n4), .Z(n9) );
  IVP U5 ( .A(n6), .Z(n10) );
  EN U6 ( .A(\A2[5] ), .B(n8), .Z(PRODUCT[7]) );
  EO U7 ( .A(\CARRYB[3][1] ), .B(\SUMB[3][2] ), .Z(\A1[3] ) );
  EO U8 ( .A(\CARRYB[3][2] ), .B(\ab[3][3] ), .Z(\A1[4] ) );
  EO U9 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Z(PRODUCT[1]) );
  EO U10 ( .A(\CARRYB[3][0] ), .B(\SUMB[3][1] ), .Z(PRODUCT[4]) );
  EO U11 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Z(\SUMB[1][2] ) );
  EO U12 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Z(\SUMB[1][1] ) );
  IVP U13 ( .A(A[0]), .Z(n14) );
  IVP U14 ( .A(A[1]), .Z(n13) );
  IVP U15 ( .A(B[2]), .Z(n16) );
  IVP U16 ( .A(B[1]), .Z(n17) );
  IVP U17 ( .A(B[3]), .Z(n15) );
  IVP U18 ( .A(A[3]), .Z(n11) );
  IVP U19 ( .A(A[2]), .Z(n12) );
  IVP U20 ( .A(B[0]), .Z(n18) );
  AN2P U21 ( .A(\SUMB[3][1] ), .B(\CARRYB[3][0] ), .Z(\A2[3] ) );
  AN2P U22 ( .A(\CARRYB[3][1] ), .B(\SUMB[3][2] ), .Z(\A2[4] ) );
  AN2P U23 ( .A(\CARRYB[3][2] ), .B(\ab[3][3] ), .Z(\A2[5] ) );
  AN2P U24 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Z(\CARRYB[1][0] ) );
  AN2P U25 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Z(\CARRYB[1][1] ) );
  AN2P U26 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Z(\CARRYB[1][2] ) );
  ND2 U27 ( .A(\A2[3] ), .B(\A1[3] ), .Z(n4) );
  AN2 U28 ( .A(\A2[4] ), .B(\A1[4] ), .Z(n7) );
  NR2 U29 ( .A(\A2[4] ), .B(\A1[4] ), .Z(n6) );
  NR2 U30 ( .A(n7), .B(n6), .Z(n5) );
  EO U31 ( .A(n9), .B(n5), .Z(PRODUCT[6]) );
  AO6 U32 ( .A(n9), .B(n10), .C(n7), .Z(n8) );
  NR2 U33 ( .A(n11), .B(n15), .Z(\ab[3][3] ) );
  NR2 U34 ( .A(n11), .B(n16), .Z(\ab[3][2] ) );
  NR2 U35 ( .A(n11), .B(n17), .Z(\ab[3][1] ) );
  NR2 U36 ( .A(n11), .B(n18), .Z(\ab[3][0] ) );
  NR2 U37 ( .A(n15), .B(n12), .Z(\ab[2][3] ) );
  NR2 U38 ( .A(n16), .B(n12), .Z(\ab[2][2] ) );
  NR2 U39 ( .A(n17), .B(n12), .Z(\ab[2][1] ) );
  NR2 U40 ( .A(n18), .B(n12), .Z(\ab[2][0] ) );
  NR2 U41 ( .A(n15), .B(n13), .Z(\ab[1][3] ) );
  NR2 U42 ( .A(n16), .B(n13), .Z(\ab[1][2] ) );
  NR2 U43 ( .A(n17), .B(n13), .Z(\ab[1][1] ) );
  NR2 U44 ( .A(n18), .B(n13), .Z(\ab[1][0] ) );
  NR2 U45 ( .A(n15), .B(n14), .Z(\ab[0][3] ) );
  NR2 U46 ( .A(n16), .B(n14), .Z(\ab[0][2] ) );
  NR2 U47 ( .A(n17), .B(n14), .Z(\ab[0][1] ) );
  NR2 U48 ( .A(n18), .B(n14), .Z(PRODUCT[0]) );
endmodule


module mult_8x8_DW02_mult_1 ( A, B, TC, PRODUCT );
  input [3:0] A;
  input [3:0] B;
  output [7:0] PRODUCT;
  input TC;
  wire   \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][3] , \ab[1][2] ,
         \ab[1][1] , \ab[1][0] , \ab[0][3] , \ab[0][2] , \ab[0][1] ,
         \CARRYB[3][2] , \CARRYB[3][1] , \CARRYB[3][0] , \CARRYB[2][2] ,
         \CARRYB[2][1] , \CARRYB[2][0] , \CARRYB[1][2] , \CARRYB[1][1] ,
         \CARRYB[1][0] , \SUMB[3][2] , \SUMB[3][1] , \SUMB[2][2] ,
         \SUMB[2][1] , \SUMB[1][2] , \SUMB[1][1] , \A1[4] , \A1[3] , \A2[5] ,
         \A2[4] , \A2[3] , n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18;

  FA1A S4_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(PRODUCT[3]) );
  FA1A S1_2_0 ( .A(\ab[2][0] ), .B(\CARRYB[1][0] ), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(PRODUCT[2]) );
  FA1A S5_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\ab[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  FA1A S4_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  FA1A S2_2_1 ( .A(\ab[2][1] ), .B(\CARRYB[1][1] ), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  FA1A S3_2_2 ( .A(\ab[2][2] ), .B(\CARRYB[1][2] ), .CI(\ab[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  OR2P U2 ( .A(\A2[3] ), .B(\A1[3] ), .Z(n2) );
  AN2P U3 ( .A(n2), .B(n4), .Z(PRODUCT[5]) );
  IVP U4 ( .A(n4), .Z(n9) );
  IVP U5 ( .A(n6), .Z(n10) );
  EN U6 ( .A(\A2[5] ), .B(n8), .Z(PRODUCT[7]) );
  EO U7 ( .A(\CARRYB[3][1] ), .B(\SUMB[3][2] ), .Z(\A1[3] ) );
  EO U8 ( .A(\CARRYB[3][2] ), .B(\ab[3][3] ), .Z(\A1[4] ) );
  EO U9 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Z(PRODUCT[1]) );
  EO U10 ( .A(\CARRYB[3][0] ), .B(\SUMB[3][1] ), .Z(PRODUCT[4]) );
  EO U11 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Z(\SUMB[1][2] ) );
  EO U12 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Z(\SUMB[1][1] ) );
  IVP U13 ( .A(A[0]), .Z(n14) );
  IVP U14 ( .A(A[1]), .Z(n13) );
  IVP U15 ( .A(B[2]), .Z(n16) );
  IVP U16 ( .A(B[1]), .Z(n17) );
  IVP U17 ( .A(B[3]), .Z(n15) );
  IVP U18 ( .A(A[3]), .Z(n11) );
  IVP U19 ( .A(A[2]), .Z(n12) );
  IVP U20 ( .A(B[0]), .Z(n18) );
  AN2P U21 ( .A(\SUMB[3][1] ), .B(\CARRYB[3][0] ), .Z(\A2[3] ) );
  AN2P U22 ( .A(\CARRYB[3][1] ), .B(\SUMB[3][2] ), .Z(\A2[4] ) );
  AN2P U23 ( .A(\CARRYB[3][2] ), .B(\ab[3][3] ), .Z(\A2[5] ) );
  AN2P U24 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Z(\CARRYB[1][0] ) );
  AN2P U25 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Z(\CARRYB[1][1] ) );
  AN2P U26 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Z(\CARRYB[1][2] ) );
  ND2 U27 ( .A(\A2[3] ), .B(\A1[3] ), .Z(n4) );
  AN2 U28 ( .A(\A2[4] ), .B(\A1[4] ), .Z(n7) );
  NR2 U29 ( .A(\A2[4] ), .B(\A1[4] ), .Z(n6) );
  NR2 U30 ( .A(n7), .B(n6), .Z(n5) );
  EO U31 ( .A(n9), .B(n5), .Z(PRODUCT[6]) );
  AO6 U32 ( .A(n9), .B(n10), .C(n7), .Z(n8) );
  NR2 U33 ( .A(n11), .B(n15), .Z(\ab[3][3] ) );
  NR2 U34 ( .A(n11), .B(n16), .Z(\ab[3][2] ) );
  NR2 U35 ( .A(n11), .B(n17), .Z(\ab[3][1] ) );
  NR2 U36 ( .A(n11), .B(n18), .Z(\ab[3][0] ) );
  NR2 U37 ( .A(n15), .B(n12), .Z(\ab[2][3] ) );
  NR2 U38 ( .A(n16), .B(n12), .Z(\ab[2][2] ) );
  NR2 U39 ( .A(n17), .B(n12), .Z(\ab[2][1] ) );
  NR2 U40 ( .A(n18), .B(n12), .Z(\ab[2][0] ) );
  NR2 U41 ( .A(n15), .B(n13), .Z(\ab[1][3] ) );
  NR2 U42 ( .A(n16), .B(n13), .Z(\ab[1][2] ) );
  NR2 U43 ( .A(n17), .B(n13), .Z(\ab[1][1] ) );
  NR2 U44 ( .A(n18), .B(n13), .Z(\ab[1][0] ) );
  NR2 U45 ( .A(n15), .B(n14), .Z(\ab[0][3] ) );
  NR2 U46 ( .A(n16), .B(n14), .Z(\ab[0][2] ) );
  NR2 U47 ( .A(n17), .B(n14), .Z(\ab[0][1] ) );
  NR2 U48 ( .A(n18), .B(n14), .Z(PRODUCT[0]) );
endmodule


module mult_8x8 ( clk, rst_n, in_1, in_2, prod );
  input [7:0] in_1;
  input [7:0] in_2;
  output [15:0] prod;
  input clk, rst_n;
  wire   n12, n14, n15, n16, n17, \add_1_root_add_0_root_add_93_3/SUM[8] ,
         \add_1_root_add_0_root_add_93_3/SUM[9] ,
         \add_1_root_add_0_root_add_93_3/SUM[10] ,
         \add_1_root_add_0_root_add_93_3/SUM[11] ,
         \add_1_root_add_0_root_add_93_3/SUM[12] ,
         \add_1_root_add_0_root_add_93_3/SUM[13] ,
         \add_1_root_add_0_root_add_93_3/SUM[14] ,
         \add_1_root_add_0_root_add_93_3/SUM[15] ,
         \add_2_root_add_0_root_add_93_3/SUM[4] ,
         \add_2_root_add_0_root_add_93_3/SUM[5] ,
         \add_2_root_add_0_root_add_93_3/SUM[6] ,
         \add_2_root_add_0_root_add_93_3/SUM[7] ,
         \add_2_root_add_0_root_add_93_3/SUM[8] ,
         \add_2_root_add_0_root_add_93_3/SUM[9] ,
         \add_2_root_add_0_root_add_93_3/SUM[10] ,
         \add_2_root_add_0_root_add_93_3/SUM[11] ,
         \add_2_root_add_0_root_add_93_3/SUM[12] , n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;
  wire   [3:0] m1_in1;
  wire   [3:0] m1_in2;
  wire   [7:0] par_prod1L;
  wire   [3:0] m2_in1;
  wire   [3:0] m2_in2;
  wire   [7:0] par_prod1H;
  wire   [7:0] par_prod1L_reg;
  wire   [7:0] par_prod1H_reg;
  wire   [7:0] par_prod2L_reg;
  wire   [7:0] par_prod2H_reg;
  wire   [15:1] \add_1_root_add_0_root_add_93_3/carry ;
  wire   [15:1] \add_2_root_add_0_root_add_93_3/carry ;

  mult_8x8_DW01_add_2 add_0_root_add_0_root_add_93_3 ( .A({
        \add_1_root_add_0_root_add_93_3/SUM[15] , 
        \add_1_root_add_0_root_add_93_3/SUM[14] , 
        \add_1_root_add_0_root_add_93_3/SUM[13] , 
        \add_1_root_add_0_root_add_93_3/SUM[12] , 
        \add_1_root_add_0_root_add_93_3/SUM[11] , 
        \add_1_root_add_0_root_add_93_3/SUM[10] , 
        \add_1_root_add_0_root_add_93_3/SUM[9] , 
        \add_1_root_add_0_root_add_93_3/SUM[8] , par_prod1L_reg[3:0], 1'b0, 
        1'b0, 1'b0, 1'b0}), .B({1'b0, 1'b0, 1'b0, 
        \add_2_root_add_0_root_add_93_3/SUM[12] , 
        \add_2_root_add_0_root_add_93_3/SUM[11] , 
        \add_2_root_add_0_root_add_93_3/SUM[10] , 
        \add_2_root_add_0_root_add_93_3/SUM[9] , 
        \add_2_root_add_0_root_add_93_3/SUM[8] , 
        \add_2_root_add_0_root_add_93_3/SUM[7] , 
        \add_2_root_add_0_root_add_93_3/SUM[6] , 
        \add_2_root_add_0_root_add_93_3/SUM[5] , 
        \add_2_root_add_0_root_add_93_3/SUM[4] , par_prod2L_reg[3:0]}), .CI(
        1'b0), .SUM(prod) );
  mult_8x8_DW02_mult_0 mult_46 ( .A(m1_in1), .B(m1_in2), .TC(1'b0), .PRODUCT(
        par_prod1L) );
  mult_8x8_DW02_mult_1 mult_47 ( .A(m2_in1), .B(m2_in2), .TC(1'b0), .PRODUCT(
        par_prod1H) );
  FD2 \currSt_reg[0]  ( .D(n17), .CP(n30), .CD(n25), .Q(n22), .QN(n17) );
  FD2 \par_prod2L_reg_reg[7]  ( .D(par_prod1L_reg[7]), .CP(n32), .CD(n27), .Q(
        par_prod2L_reg[7]) );
  FD2 \par_prod2L_reg_reg[6]  ( .D(par_prod1L_reg[6]), .CP(n32), .CD(n27), .Q(
        par_prod2L_reg[6]) );
  FD2 \par_prod2L_reg_reg[5]  ( .D(par_prod1L_reg[5]), .CP(n32), .CD(n27), .Q(
        par_prod2L_reg[5]) );
  FD2 \par_prod1L_reg_reg[7]  ( .D(par_prod1L[7]), .CP(n30), .CD(n25), .Q(
        par_prod1L_reg[7]) );
  FD2 \par_prod1L_reg_reg[6]  ( .D(par_prod1L[6]), .CP(n30), .CD(n25), .Q(
        par_prod1L_reg[6]) );
  FD2 \par_prod1L_reg_reg[5]  ( .D(par_prod1L[5]), .CP(n30), .CD(n25), .Q(
        par_prod1L_reg[5]) );
  FD2 \par_prod1L_reg_reg[3]  ( .D(par_prod1L[3]), .CP(n30), .CD(n25), .Q(
        par_prod1L_reg[3]) );
  FD2 \par_prod1L_reg_reg[2]  ( .D(par_prod1L[2]), .CP(n30), .CD(n25), .Q(
        par_prod1L_reg[2]) );
  FD2 \par_prod1L_reg_reg[1]  ( .D(par_prod1L[1]), .CP(n30), .CD(n25), .Q(
        par_prod1L_reg[1]) );
  FD2 \par_prod1H_reg_reg[7]  ( .D(par_prod1H[7]), .CP(n30), .CD(n25), .Q(
        par_prod1H_reg[7]), .QN(n23) );
  FD2 \par_prod2H_reg_reg[7]  ( .D(par_prod1H_reg[7]), .CP(n31), .CD(n26), .Q(
        par_prod2H_reg[7]) );
  FD2 \par_prod2H_reg_reg[6]  ( .D(par_prod1H_reg[6]), .CP(n31), .CD(n26), .Q(
        par_prod2H_reg[6]) );
  FD2 \par_prod2H_reg_reg[5]  ( .D(par_prod1H_reg[5]), .CP(n31), .CD(n26), .Q(
        par_prod2H_reg[5]) );
  FD2 \par_prod2H_reg_reg[4]  ( .D(par_prod1H_reg[4]), .CP(n31), .CD(n26), .Q(
        par_prod2H_reg[4]) );
  FD2 \par_prod2H_reg_reg[3]  ( .D(par_prod1H_reg[3]), .CP(n31), .CD(n26), .Q(
        par_prod2H_reg[3]) );
  FD2 \par_prod2H_reg_reg[2]  ( .D(par_prod1H_reg[2]), .CP(n32), .CD(n27), .Q(
        par_prod2H_reg[2]) );
  FD2 \par_prod2H_reg_reg[1]  ( .D(par_prod1H_reg[1]), .CP(n32), .CD(n27), .Q(
        par_prod2H_reg[1]) );
  FD2 \par_prod2L_reg_reg[4]  ( .D(par_prod1L_reg[4]), .CP(n32), .CD(n27), .Q(
        par_prod2L_reg[4]) );
  FD2 \par_prod1L_reg_reg[4]  ( .D(par_prod1L[4]), .CP(n30), .CD(n25), .Q(
        par_prod1L_reg[4]) );
  FD2 \par_prod1L_reg_reg[0]  ( .D(par_prod1L[0]), .CP(n30), .CD(n25), .Q(
        par_prod1L_reg[0]) );
  FD2 \par_prod1H_reg_reg[6]  ( .D(par_prod1H[6]), .CP(n31), .CD(n26), .Q(
        par_prod1H_reg[6]) );
  FD2 \par_prod1H_reg_reg[5]  ( .D(par_prod1H[5]), .CP(n31), .CD(n26), .Q(
        par_prod1H_reg[5]) );
  FD2 \par_prod1H_reg_reg[4]  ( .D(par_prod1H[4]), .CP(n31), .CD(n26), .Q(
        par_prod1H_reg[4]) );
  FD2 \par_prod1H_reg_reg[3]  ( .D(par_prod1H[3]), .CP(n31), .CD(n26), .Q(
        par_prod1H_reg[3]) );
  FD2 \par_prod1H_reg_reg[2]  ( .D(par_prod1H[2]), .CP(n31), .CD(n26), .Q(
        par_prod1H_reg[2]) );
  FD2 \par_prod1H_reg_reg[1]  ( .D(par_prod1H[1]), .CP(n32), .CD(n27), .Q(
        par_prod1H_reg[1]) );
  FD2 \par_prod2H_reg_reg[0]  ( .D(par_prod1H_reg[0]), .CP(n32), .CD(n27), .Q(
        par_prod2H_reg[0]) );
  LD1 \m2_in1_reg[3]  ( .G(1'b1), .D(in_1[7]), .Q(m2_in1[3]) );
  LD1 \m2_in1_reg[2]  ( .G(1'b1), .D(in_1[6]), .Q(m2_in1[2]) );
  LD1 \m2_in1_reg[1]  ( .G(1'b1), .D(in_1[5]), .Q(m2_in1[1]) );
  LD1 \m2_in1_reg[0]  ( .G(1'b1), .D(in_1[4]), .Q(m2_in1[0]) );
  LD1 \m2_in2_reg[3]  ( .G(1'b1), .D(n35), .Q(m2_in2[3]) );
  LD1 \m2_in2_reg[2]  ( .G(1'b1), .D(n36), .Q(m2_in2[2]) );
  LD1 \m2_in2_reg[1]  ( .G(1'b1), .D(n37), .Q(m2_in2[1]) );
  LD1 \m2_in2_reg[0]  ( .G(1'b1), .D(n38), .Q(m2_in2[0]) );
  LD1 \m1_in1_reg[3]  ( .G(1'b1), .D(in_1[3]), .Q(m1_in1[3]) );
  LD1 \m1_in1_reg[2]  ( .G(1'b1), .D(in_1[2]), .Q(m1_in1[2]) );
  LD1 \m1_in1_reg[1]  ( .G(1'b1), .D(in_1[1]), .Q(m1_in1[1]) );
  LD1 \m1_in1_reg[0]  ( .G(1'b1), .D(in_1[0]), .Q(m1_in1[0]) );
  LD1 \m1_in2_reg[3]  ( .G(1'b1), .D(n35), .Q(m1_in2[3]) );
  LD1 \m1_in2_reg[2]  ( .G(1'b1), .D(n36), .Q(m1_in2[2]) );
  LD1 \m1_in2_reg[1]  ( .G(1'b1), .D(n37), .Q(m1_in2[1]) );
  LD1 \m1_in2_reg[0]  ( .G(1'b1), .D(n38), .Q(m1_in2[0]) );
  FD2 \par_prod1H_reg_reg[0]  ( .D(par_prod1H[0]), .CP(n32), .CD(n27), .Q(
        par_prod1H_reg[0]) );
  FA1A \add_1_root_add_0_root_add_93_3/U1_10  ( .A(par_prod1L_reg[6]), .B(
        par_prod1H_reg[2]), .CI(\add_1_root_add_0_root_add_93_3/carry [10]), 
        .CO(\add_1_root_add_0_root_add_93_3/carry [11]), .S(
        \add_1_root_add_0_root_add_93_3/SUM[10] ) );
  FA1A \add_1_root_add_0_root_add_93_3/U1_9  ( .A(par_prod1L_reg[5]), .B(
        par_prod1H_reg[1]), .CI(\add_1_root_add_0_root_add_93_3/carry [9]), 
        .CO(\add_1_root_add_0_root_add_93_3/carry [10]), .S(
        \add_1_root_add_0_root_add_93_3/SUM[9] ) );
  FA1A \add_2_root_add_0_root_add_93_3/U1_6  ( .A(par_prod2L_reg[6]), .B(
        par_prod2H_reg[2]), .CI(\add_2_root_add_0_root_add_93_3/carry [6]), 
        .CO(\add_2_root_add_0_root_add_93_3/carry [7]), .S(
        \add_2_root_add_0_root_add_93_3/SUM[6] ) );
  FA1A \add_2_root_add_0_root_add_93_3/U1_5  ( .A(par_prod2L_reg[5]), .B(
        par_prod2H_reg[1]), .CI(\add_2_root_add_0_root_add_93_3/carry [5]), 
        .CO(\add_2_root_add_0_root_add_93_3/carry [6]), .S(
        \add_2_root_add_0_root_add_93_3/SUM[5] ) );
  FA1A \add_1_root_add_0_root_add_93_3/U1_11  ( .A(par_prod1L_reg[7]), .B(
        par_prod1H_reg[3]), .CI(\add_1_root_add_0_root_add_93_3/carry [11]), 
        .CO(\add_1_root_add_0_root_add_93_3/carry [12]), .S(
        \add_1_root_add_0_root_add_93_3/SUM[11] ) );
  FA1A \add_2_root_add_0_root_add_93_3/U1_7  ( .A(par_prod2L_reg[7]), .B(
        par_prod2H_reg[3]), .CI(\add_2_root_add_0_root_add_93_3/carry [7]), 
        .CO(\add_2_root_add_0_root_add_93_3/carry [8]), .S(
        \add_2_root_add_0_root_add_93_3/SUM[7] ) );
  FD2 \par_prod2L_reg_reg[3]  ( .D(par_prod1L_reg[3]), .CP(n32), .CD(n27), .Q(
        par_prod2L_reg[3]) );
  FD2 \par_prod2L_reg_reg[2]  ( .D(par_prod1L_reg[2]), .CP(n33), .CD(n28), .Q(
        par_prod2L_reg[2]) );
  FD2 \par_prod2L_reg_reg[1]  ( .D(par_prod1L_reg[1]), .CP(n33), .CD(n28), .Q(
        par_prod2L_reg[1]) );
  FD2 \par_prod2L_reg_reg[0]  ( .D(par_prod1L_reg[0]), .CP(n33), .CD(n28), .Q(
        par_prod2L_reg[0]) );
  IVP U13 ( .A(n29), .Z(n27) );
  IVP U14 ( .A(n29), .Z(n26) );
  IVP U15 ( .A(n34), .Z(n32) );
  IVP U16 ( .A(n34), .Z(n31) );
  IVP U17 ( .A(n29), .Z(n28) );
  IVP U18 ( .A(n34), .Z(n33) );
  IVP U19 ( .A(n29), .Z(n25) );
  IVP U20 ( .A(rst_n), .Z(n29) );
  IVP U21 ( .A(n34), .Z(n30) );
  IVP U22 ( .A(clk), .Z(n34) );
  IVP U23 ( .A(n15), .Z(n38) );
  AO2 U24 ( .A(in_2[0]), .B(n17), .C(in_2[4]), .D(n22), .Z(n15) );
  IVP U25 ( .A(n14), .Z(n37) );
  AO2 U26 ( .A(in_2[1]), .B(n17), .C(in_2[5]), .D(n22), .Z(n14) );
  IVP U27 ( .A(n12), .Z(n36) );
  AO2 U28 ( .A(n17), .B(in_2[2]), .C(in_2[6]), .D(n22), .Z(n12) );
  IVP U29 ( .A(n16), .Z(n35) );
  AO2 U30 ( .A(in_2[3]), .B(n17), .C(in_2[7]), .D(n22), .Z(n16) );
  EO U31 ( .A(n23), .B(n24), .Z(\add_1_root_add_0_root_add_93_3/SUM[15] ) );
  ND2 U32 ( .A(\add_1_root_add_0_root_add_93_3/carry [14]), .B(
        par_prod1H_reg[6]), .Z(n24) );
  AN2 U33 ( .A(\add_2_root_add_0_root_add_93_3/carry [11]), .B(
        par_prod2H_reg[7]), .Z(\add_2_root_add_0_root_add_93_3/SUM[12] ) );
  EO U34 ( .A(par_prod2H_reg[7]), .B(
        \add_2_root_add_0_root_add_93_3/carry [11]), .Z(
        \add_2_root_add_0_root_add_93_3/SUM[11] ) );
  AN2 U35 ( .A(\add_2_root_add_0_root_add_93_3/carry [10]), .B(
        par_prod2H_reg[6]), .Z(\add_2_root_add_0_root_add_93_3/carry [11]) );
  EO U36 ( .A(par_prod2H_reg[6]), .B(
        \add_2_root_add_0_root_add_93_3/carry [10]), .Z(
        \add_2_root_add_0_root_add_93_3/SUM[10] ) );
  AN2 U37 ( .A(\add_2_root_add_0_root_add_93_3/carry [9]), .B(
        par_prod2H_reg[5]), .Z(\add_2_root_add_0_root_add_93_3/carry [10]) );
  EO U38 ( .A(par_prod2H_reg[5]), .B(\add_2_root_add_0_root_add_93_3/carry [9]), .Z(\add_2_root_add_0_root_add_93_3/SUM[9] ) );
  AN2 U39 ( .A(\add_2_root_add_0_root_add_93_3/carry [8]), .B(
        par_prod2H_reg[4]), .Z(\add_2_root_add_0_root_add_93_3/carry [9]) );
  EO U40 ( .A(par_prod2H_reg[4]), .B(\add_2_root_add_0_root_add_93_3/carry [8]), .Z(\add_2_root_add_0_root_add_93_3/SUM[8] ) );
  AN2 U41 ( .A(par_prod2H_reg[0]), .B(par_prod2L_reg[4]), .Z(
        \add_2_root_add_0_root_add_93_3/carry [5]) );
  EO U42 ( .A(par_prod2L_reg[4]), .B(par_prod2H_reg[0]), .Z(
        \add_2_root_add_0_root_add_93_3/SUM[4] ) );
  EO U43 ( .A(par_prod1H_reg[6]), .B(
        \add_1_root_add_0_root_add_93_3/carry [14]), .Z(
        \add_1_root_add_0_root_add_93_3/SUM[14] ) );
  AN2 U44 ( .A(\add_1_root_add_0_root_add_93_3/carry [13]), .B(
        par_prod1H_reg[5]), .Z(\add_1_root_add_0_root_add_93_3/carry [14]) );
  EO U45 ( .A(par_prod1H_reg[5]), .B(
        \add_1_root_add_0_root_add_93_3/carry [13]), .Z(
        \add_1_root_add_0_root_add_93_3/SUM[13] ) );
  AN2 U46 ( .A(\add_1_root_add_0_root_add_93_3/carry [12]), .B(
        par_prod1H_reg[4]), .Z(\add_1_root_add_0_root_add_93_3/carry [13]) );
  EO U47 ( .A(par_prod1H_reg[4]), .B(
        \add_1_root_add_0_root_add_93_3/carry [12]), .Z(
        \add_1_root_add_0_root_add_93_3/SUM[12] ) );
  AN2 U48 ( .A(par_prod1H_reg[0]), .B(par_prod1L_reg[4]), .Z(
        \add_1_root_add_0_root_add_93_3/carry [9]) );
  EO U49 ( .A(par_prod1L_reg[4]), .B(par_prod1H_reg[0]), .Z(
        \add_1_root_add_0_root_add_93_3/SUM[8] ) );
endmodule

