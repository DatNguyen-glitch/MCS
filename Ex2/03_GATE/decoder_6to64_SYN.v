/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03-SP1-1
// Date      : Tue Apr  8 20:06:55 2025
/////////////////////////////////////////////////////////////


module decoder_6to64 ( clk, rst_n, in_addr, wordline );
  input [5:0] in_addr;
  output [63:0] wordline;
  input clk, rst_n;
  wire   n1, n3, n5, n7, n9, n11, n13, n14, n15, n16, n17;
  wire   [5:0] addr;
  wire   [7:0] msb_en;
  wire   [7:0] lsb_decoder_group_0__lsb_out;
  wire   [7:0] lsb_decoder_group_1__lsb_out;
  wire   [7:0] lsb_decoder_group_2__lsb_out;
  wire   [7:0] lsb_decoder_group_3__lsb_out;
  wire   [7:0] lsb_decoder_group_4__lsb_out;
  wire   [7:0] lsb_decoder_group_5__lsb_out;
  wire   [7:0] lsb_decoder_group_6__lsb_out;
  wire   [7:0] lsb_decoder_group_7__lsb_out;

  decoder_3to8_8 msb_decoder ( .a(addr[5:3]), .word(msb_en) );
  decoder_3to8_7 lsb_decoder_group_0__lsb_decoder ( .a({n17, n16, n15}), 
        .word(lsb_decoder_group_0__lsb_out) );
  decoder_3to8_6 lsb_decoder_group_1__lsb_decoder ( .a({n17, n16, n15}), 
        .word(lsb_decoder_group_1__lsb_out) );
  decoder_3to8_5 lsb_decoder_group_2__lsb_decoder ( .a({n17, n16, n15}), 
        .word(lsb_decoder_group_2__lsb_out) );
  decoder_3to8_4 lsb_decoder_group_3__lsb_decoder ( .a({n17, n16, n15}), 
        .word(lsb_decoder_group_3__lsb_out) );
  decoder_3to8_3 lsb_decoder_group_4__lsb_decoder ( .a({n17, n16, n15}), 
        .word(lsb_decoder_group_4__lsb_out) );
  decoder_3to8_2 lsb_decoder_group_5__lsb_decoder ( .a({n17, n16, n15}), 
        .word(lsb_decoder_group_5__lsb_out) );
  decoder_3to8_1 lsb_decoder_group_6__lsb_decoder ( .a({n17, n16, n15}), 
        .word(lsb_decoder_group_6__lsb_out) );
  decoder_3to8_0 lsb_decoder_group_7__lsb_decoder ( .a({n17, n16, n15}), 
        .word(lsb_decoder_group_7__lsb_out) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(in_addr[0]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U5 ( .A(in_addr[1]), .Y(n3) );
  INVx1_ASAP7_75t_SRAM U7 ( .A(in_addr[2]), .Y(n5) );
  INVx1_ASAP7_75t_SRAM U9 ( .A(in_addr[3]), .Y(n7) );
  INVx1_ASAP7_75t_SRAM U11 ( .A(in_addr[4]), .Y(n9) );
  INVx1_ASAP7_75t_SRAM U13 ( .A(in_addr[5]), .Y(n11) );
  INVx1_ASAP7_75t_SRAM U15 ( .A(rst_n), .Y(n13) );
  OR2x2_ASAP7_75t_SRAM U16 ( .A(lsb_decoder_group_1__lsb_out[1]), .B(msb_en[1]), .Y(wordline[9]) );
  OR2x2_ASAP7_75t_SRAM U17 ( .A(lsb_decoder_group_1__lsb_out[0]), .B(msb_en[1]), .Y(wordline[8]) );
  OR2x2_ASAP7_75t_SRAM U18 ( .A(lsb_decoder_group_0__lsb_out[7]), .B(msb_en[0]), .Y(wordline[7]) );
  OR2x2_ASAP7_75t_SRAM U19 ( .A(lsb_decoder_group_0__lsb_out[6]), .B(msb_en[0]), .Y(wordline[6]) );
  OR2x2_ASAP7_75t_SRAM U20 ( .A(lsb_decoder_group_7__lsb_out[7]), .B(msb_en[7]), .Y(wordline[63]) );
  OR2x2_ASAP7_75t_SRAM U21 ( .A(lsb_decoder_group_7__lsb_out[6]), .B(msb_en[7]), .Y(wordline[62]) );
  OR2x2_ASAP7_75t_SRAM U22 ( .A(lsb_decoder_group_7__lsb_out[5]), .B(msb_en[7]), .Y(wordline[61]) );
  OR2x2_ASAP7_75t_SRAM U23 ( .A(lsb_decoder_group_7__lsb_out[4]), .B(msb_en[7]), .Y(wordline[60]) );
  OR2x2_ASAP7_75t_SRAM U24 ( .A(lsb_decoder_group_0__lsb_out[5]), .B(msb_en[0]), .Y(wordline[5]) );
  OR2x2_ASAP7_75t_SRAM U25 ( .A(lsb_decoder_group_7__lsb_out[3]), .B(msb_en[7]), .Y(wordline[59]) );
  OR2x2_ASAP7_75t_SRAM U26 ( .A(lsb_decoder_group_7__lsb_out[2]), .B(msb_en[7]), .Y(wordline[58]) );
  OR2x2_ASAP7_75t_SRAM U27 ( .A(lsb_decoder_group_7__lsb_out[1]), .B(msb_en[7]), .Y(wordline[57]) );
  OR2x2_ASAP7_75t_SRAM U28 ( .A(lsb_decoder_group_7__lsb_out[0]), .B(msb_en[7]), .Y(wordline[56]) );
  OR2x2_ASAP7_75t_SRAM U29 ( .A(lsb_decoder_group_6__lsb_out[7]), .B(msb_en[6]), .Y(wordline[55]) );
  OR2x2_ASAP7_75t_SRAM U30 ( .A(lsb_decoder_group_6__lsb_out[6]), .B(msb_en[6]), .Y(wordline[54]) );
  OR2x2_ASAP7_75t_SRAM U31 ( .A(lsb_decoder_group_6__lsb_out[5]), .B(msb_en[6]), .Y(wordline[53]) );
  OR2x2_ASAP7_75t_SRAM U32 ( .A(lsb_decoder_group_6__lsb_out[4]), .B(msb_en[6]), .Y(wordline[52]) );
  OR2x2_ASAP7_75t_SRAM U33 ( .A(lsb_decoder_group_6__lsb_out[3]), .B(msb_en[6]), .Y(wordline[51]) );
  OR2x2_ASAP7_75t_SRAM U34 ( .A(lsb_decoder_group_6__lsb_out[2]), .B(msb_en[6]), .Y(wordline[50]) );
  OR2x2_ASAP7_75t_SRAM U35 ( .A(lsb_decoder_group_0__lsb_out[4]), .B(msb_en[0]), .Y(wordline[4]) );
  OR2x2_ASAP7_75t_SRAM U36 ( .A(lsb_decoder_group_6__lsb_out[1]), .B(msb_en[6]), .Y(wordline[49]) );
  OR2x2_ASAP7_75t_SRAM U37 ( .A(lsb_decoder_group_6__lsb_out[0]), .B(msb_en[6]), .Y(wordline[48]) );
  OR2x2_ASAP7_75t_SRAM U38 ( .A(lsb_decoder_group_5__lsb_out[7]), .B(msb_en[5]), .Y(wordline[47]) );
  OR2x2_ASAP7_75t_SRAM U39 ( .A(lsb_decoder_group_5__lsb_out[6]), .B(msb_en[5]), .Y(wordline[46]) );
  OR2x2_ASAP7_75t_SRAM U40 ( .A(lsb_decoder_group_5__lsb_out[5]), .B(msb_en[5]), .Y(wordline[45]) );
  OR2x2_ASAP7_75t_SRAM U41 ( .A(lsb_decoder_group_5__lsb_out[4]), .B(msb_en[5]), .Y(wordline[44]) );
  OR2x2_ASAP7_75t_SRAM U42 ( .A(lsb_decoder_group_5__lsb_out[3]), .B(msb_en[5]), .Y(wordline[43]) );
  OR2x2_ASAP7_75t_SRAM U43 ( .A(lsb_decoder_group_5__lsb_out[2]), .B(msb_en[5]), .Y(wordline[42]) );
  OR2x2_ASAP7_75t_SRAM U44 ( .A(lsb_decoder_group_5__lsb_out[1]), .B(msb_en[5]), .Y(wordline[41]) );
  OR2x2_ASAP7_75t_SRAM U45 ( .A(lsb_decoder_group_5__lsb_out[0]), .B(msb_en[5]), .Y(wordline[40]) );
  OR2x2_ASAP7_75t_SRAM U46 ( .A(lsb_decoder_group_0__lsb_out[3]), .B(msb_en[0]), .Y(wordline[3]) );
  OR2x2_ASAP7_75t_SRAM U47 ( .A(lsb_decoder_group_4__lsb_out[7]), .B(msb_en[4]), .Y(wordline[39]) );
  OR2x2_ASAP7_75t_SRAM U48 ( .A(lsb_decoder_group_4__lsb_out[6]), .B(msb_en[4]), .Y(wordline[38]) );
  OR2x2_ASAP7_75t_SRAM U49 ( .A(lsb_decoder_group_4__lsb_out[5]), .B(msb_en[4]), .Y(wordline[37]) );
  OR2x2_ASAP7_75t_SRAM U50 ( .A(lsb_decoder_group_4__lsb_out[4]), .B(msb_en[4]), .Y(wordline[36]) );
  OR2x2_ASAP7_75t_SRAM U51 ( .A(lsb_decoder_group_4__lsb_out[3]), .B(msb_en[4]), .Y(wordline[35]) );
  OR2x2_ASAP7_75t_SRAM U52 ( .A(lsb_decoder_group_4__lsb_out[2]), .B(msb_en[4]), .Y(wordline[34]) );
  OR2x2_ASAP7_75t_SRAM U53 ( .A(lsb_decoder_group_4__lsb_out[1]), .B(msb_en[4]), .Y(wordline[33]) );
  OR2x2_ASAP7_75t_SRAM U54 ( .A(lsb_decoder_group_4__lsb_out[0]), .B(msb_en[4]), .Y(wordline[32]) );
  OR2x2_ASAP7_75t_SRAM U55 ( .A(lsb_decoder_group_3__lsb_out[7]), .B(msb_en[3]), .Y(wordline[31]) );
  OR2x2_ASAP7_75t_SRAM U56 ( .A(lsb_decoder_group_3__lsb_out[6]), .B(msb_en[3]), .Y(wordline[30]) );
  OR2x2_ASAP7_75t_SRAM U57 ( .A(lsb_decoder_group_0__lsb_out[2]), .B(msb_en[0]), .Y(wordline[2]) );
  OR2x2_ASAP7_75t_SRAM U58 ( .A(lsb_decoder_group_3__lsb_out[5]), .B(msb_en[3]), .Y(wordline[29]) );
  OR2x2_ASAP7_75t_SRAM U59 ( .A(lsb_decoder_group_3__lsb_out[4]), .B(msb_en[3]), .Y(wordline[28]) );
  OR2x2_ASAP7_75t_SRAM U60 ( .A(lsb_decoder_group_3__lsb_out[3]), .B(msb_en[3]), .Y(wordline[27]) );
  OR2x2_ASAP7_75t_SRAM U61 ( .A(lsb_decoder_group_3__lsb_out[2]), .B(msb_en[3]), .Y(wordline[26]) );
  OR2x2_ASAP7_75t_SRAM U62 ( .A(lsb_decoder_group_3__lsb_out[1]), .B(msb_en[3]), .Y(wordline[25]) );
  OR2x2_ASAP7_75t_SRAM U63 ( .A(lsb_decoder_group_3__lsb_out[0]), .B(msb_en[3]), .Y(wordline[24]) );
  OR2x2_ASAP7_75t_SRAM U64 ( .A(lsb_decoder_group_2__lsb_out[7]), .B(msb_en[2]), .Y(wordline[23]) );
  OR2x2_ASAP7_75t_SRAM U65 ( .A(lsb_decoder_group_2__lsb_out[6]), .B(msb_en[2]), .Y(wordline[22]) );
  OR2x2_ASAP7_75t_SRAM U66 ( .A(lsb_decoder_group_2__lsb_out[5]), .B(msb_en[2]), .Y(wordline[21]) );
  OR2x2_ASAP7_75t_SRAM U67 ( .A(lsb_decoder_group_2__lsb_out[4]), .B(msb_en[2]), .Y(wordline[20]) );
  OR2x2_ASAP7_75t_SRAM U68 ( .A(lsb_decoder_group_0__lsb_out[1]), .B(msb_en[0]), .Y(wordline[1]) );
  OR2x2_ASAP7_75t_SRAM U69 ( .A(lsb_decoder_group_2__lsb_out[3]), .B(msb_en[2]), .Y(wordline[19]) );
  OR2x2_ASAP7_75t_SRAM U70 ( .A(lsb_decoder_group_2__lsb_out[2]), .B(msb_en[2]), .Y(wordline[18]) );
  OR2x2_ASAP7_75t_SRAM U71 ( .A(lsb_decoder_group_2__lsb_out[1]), .B(msb_en[2]), .Y(wordline[17]) );
  OR2x2_ASAP7_75t_SRAM U72 ( .A(lsb_decoder_group_2__lsb_out[0]), .B(msb_en[2]), .Y(wordline[16]) );
  OR2x2_ASAP7_75t_SRAM U73 ( .A(lsb_decoder_group_1__lsb_out[7]), .B(msb_en[1]), .Y(wordline[15]) );
  OR2x2_ASAP7_75t_SRAM U74 ( .A(lsb_decoder_group_1__lsb_out[6]), .B(msb_en[1]), .Y(wordline[14]) );
  OR2x2_ASAP7_75t_SRAM U75 ( .A(lsb_decoder_group_1__lsb_out[5]), .B(msb_en[1]), .Y(wordline[13]) );
  OR2x2_ASAP7_75t_SRAM U76 ( .A(lsb_decoder_group_1__lsb_out[4]), .B(msb_en[1]), .Y(wordline[12]) );
  OR2x2_ASAP7_75t_SRAM U77 ( .A(lsb_decoder_group_1__lsb_out[3]), .B(msb_en[1]), .Y(wordline[11]) );
  OR2x2_ASAP7_75t_SRAM U78 ( .A(lsb_decoder_group_1__lsb_out[2]), .B(msb_en[1]), .Y(wordline[10]) );
  OR2x2_ASAP7_75t_SRAM U79 ( .A(lsb_decoder_group_0__lsb_out[0]), .B(msb_en[0]), .Y(wordline[0]) );
  ASYNC_DFFHx1_ASAP7_75t_SRAM addr_reg_5_ ( .D(n11), .CLK(clk), .RESET(n13), 
        .SET(n14), .QN(addr[5]) );
  ASYNC_DFFHx1_ASAP7_75t_SRAM addr_reg_4_ ( .D(n9), .CLK(clk), .RESET(n13), 
        .SET(n14), .QN(addr[4]) );
  ASYNC_DFFHx1_ASAP7_75t_SRAM addr_reg_3_ ( .D(n7), .CLK(clk), .RESET(n13), 
        .SET(n14), .QN(addr[3]) );
  ASYNC_DFFHx1_ASAP7_75t_SRAM addr_reg_2_ ( .D(n5), .CLK(clk), .RESET(n13), 
        .SET(n14), .QN(addr[2]) );
  ASYNC_DFFHx1_ASAP7_75t_SRAM addr_reg_1_ ( .D(n3), .CLK(clk), .RESET(n13), 
        .SET(n14), .QN(addr[1]) );
  ASYNC_DFFHx1_ASAP7_75t_SRAM addr_reg_0_ ( .D(n1), .CLK(clk), .RESET(n13), 
        .SET(n14), .QN(addr[0]) );
  TIELOx1_ASAP7_75t_SRAM U80 ( .L(n14) );
  HB1xp67_ASAP7_75t_SRAM U81 ( .A(addr[0]), .Y(n15) );
  HB1xp67_ASAP7_75t_SRAM U82 ( .A(addr[1]), .Y(n16) );
  HB1xp67_ASAP7_75t_SRAM U83 ( .A(addr[2]), .Y(n17) );
endmodule


module decoder_3to8_7 ( a, word );
  input [2:0] a;
  output [7:0] word;
  wire   n1, n2, n3;

  NAND3xp33_ASAP7_75t_SRAM U4 ( .A(a[1]), .B(a[0]), .C(a[2]), .Y(word[7]) );
  NAND3xp33_ASAP7_75t_SRAM U5 ( .A(a[1]), .B(n1), .C(a[2]), .Y(word[6]) );
  NAND3xp33_ASAP7_75t_SRAM U6 ( .A(a[0]), .B(n2), .C(a[2]), .Y(word[5]) );
  NAND3xp33_ASAP7_75t_SRAM U7 ( .A(n1), .B(n2), .C(a[2]), .Y(word[4]) );
  NAND3xp33_ASAP7_75t_SRAM U8 ( .A(a[0]), .B(n3), .C(a[1]), .Y(word[3]) );
  NAND3xp33_ASAP7_75t_SRAM U9 ( .A(n1), .B(n3), .C(a[1]), .Y(word[2]) );
  NAND3xp33_ASAP7_75t_SRAM U10 ( .A(n2), .B(n3), .C(a[0]), .Y(word[1]) );
  NAND3xp33_ASAP7_75t_SRAM U11 ( .A(n2), .B(n3), .C(n1), .Y(word[0]) );
  INVx1_ASAP7_75t_SRAM U1 ( .A(a[1]), .Y(n2) );
  INVx1_ASAP7_75t_SRAM U2 ( .A(a[0]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(a[2]), .Y(n3) );
endmodule


module decoder_3to8_6 ( a, word );
  input [2:0] a;
  output [7:0] word;
  wire   n1, n2, n3;

  NAND3xp33_ASAP7_75t_SRAM U4 ( .A(a[1]), .B(a[0]), .C(a[2]), .Y(word[7]) );
  NAND3xp33_ASAP7_75t_SRAM U5 ( .A(a[1]), .B(n1), .C(a[2]), .Y(word[6]) );
  NAND3xp33_ASAP7_75t_SRAM U6 ( .A(a[0]), .B(n2), .C(a[2]), .Y(word[5]) );
  NAND3xp33_ASAP7_75t_SRAM U7 ( .A(n1), .B(n2), .C(a[2]), .Y(word[4]) );
  NAND3xp33_ASAP7_75t_SRAM U8 ( .A(a[0]), .B(n3), .C(a[1]), .Y(word[3]) );
  NAND3xp33_ASAP7_75t_SRAM U9 ( .A(n1), .B(n3), .C(a[1]), .Y(word[2]) );
  NAND3xp33_ASAP7_75t_SRAM U10 ( .A(n2), .B(n3), .C(a[0]), .Y(word[1]) );
  NAND3xp33_ASAP7_75t_SRAM U11 ( .A(n2), .B(n3), .C(n1), .Y(word[0]) );
  INVx1_ASAP7_75t_SRAM U1 ( .A(a[1]), .Y(n2) );
  INVx1_ASAP7_75t_SRAM U2 ( .A(a[0]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(a[2]), .Y(n3) );
endmodule


module decoder_3to8_5 ( a, word );
  input [2:0] a;
  output [7:0] word;
  wire   n1, n2, n3;

  NAND3xp33_ASAP7_75t_SRAM U4 ( .A(a[1]), .B(a[0]), .C(a[2]), .Y(word[7]) );
  NAND3xp33_ASAP7_75t_SRAM U5 ( .A(a[1]), .B(n1), .C(a[2]), .Y(word[6]) );
  NAND3xp33_ASAP7_75t_SRAM U6 ( .A(a[0]), .B(n2), .C(a[2]), .Y(word[5]) );
  NAND3xp33_ASAP7_75t_SRAM U7 ( .A(n1), .B(n2), .C(a[2]), .Y(word[4]) );
  NAND3xp33_ASAP7_75t_SRAM U8 ( .A(a[0]), .B(n3), .C(a[1]), .Y(word[3]) );
  NAND3xp33_ASAP7_75t_SRAM U9 ( .A(n1), .B(n3), .C(a[1]), .Y(word[2]) );
  NAND3xp33_ASAP7_75t_SRAM U10 ( .A(n2), .B(n3), .C(a[0]), .Y(word[1]) );
  NAND3xp33_ASAP7_75t_SRAM U11 ( .A(n2), .B(n3), .C(n1), .Y(word[0]) );
  INVx1_ASAP7_75t_SRAM U1 ( .A(a[1]), .Y(n2) );
  INVx1_ASAP7_75t_SRAM U2 ( .A(a[0]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(a[2]), .Y(n3) );
endmodule


module decoder_3to8_4 ( a, word );
  input [2:0] a;
  output [7:0] word;
  wire   n1, n2, n3;

  NAND3xp33_ASAP7_75t_SRAM U4 ( .A(a[1]), .B(a[0]), .C(a[2]), .Y(word[7]) );
  NAND3xp33_ASAP7_75t_SRAM U5 ( .A(a[1]), .B(n1), .C(a[2]), .Y(word[6]) );
  NAND3xp33_ASAP7_75t_SRAM U6 ( .A(a[0]), .B(n2), .C(a[2]), .Y(word[5]) );
  NAND3xp33_ASAP7_75t_SRAM U7 ( .A(n1), .B(n2), .C(a[2]), .Y(word[4]) );
  NAND3xp33_ASAP7_75t_SRAM U8 ( .A(a[0]), .B(n3), .C(a[1]), .Y(word[3]) );
  NAND3xp33_ASAP7_75t_SRAM U9 ( .A(n1), .B(n3), .C(a[1]), .Y(word[2]) );
  NAND3xp33_ASAP7_75t_SRAM U10 ( .A(n2), .B(n3), .C(a[0]), .Y(word[1]) );
  NAND3xp33_ASAP7_75t_SRAM U11 ( .A(n2), .B(n3), .C(n1), .Y(word[0]) );
  INVx1_ASAP7_75t_SRAM U1 ( .A(a[1]), .Y(n2) );
  INVx1_ASAP7_75t_SRAM U2 ( .A(a[0]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(a[2]), .Y(n3) );
endmodule


module decoder_3to8_3 ( a, word );
  input [2:0] a;
  output [7:0] word;
  wire   n1, n2, n3;

  NAND3xp33_ASAP7_75t_SRAM U4 ( .A(a[1]), .B(a[0]), .C(a[2]), .Y(word[7]) );
  NAND3xp33_ASAP7_75t_SRAM U5 ( .A(a[1]), .B(n1), .C(a[2]), .Y(word[6]) );
  NAND3xp33_ASAP7_75t_SRAM U6 ( .A(a[0]), .B(n2), .C(a[2]), .Y(word[5]) );
  NAND3xp33_ASAP7_75t_SRAM U7 ( .A(n1), .B(n2), .C(a[2]), .Y(word[4]) );
  NAND3xp33_ASAP7_75t_SRAM U8 ( .A(a[0]), .B(n3), .C(a[1]), .Y(word[3]) );
  NAND3xp33_ASAP7_75t_SRAM U9 ( .A(n1), .B(n3), .C(a[1]), .Y(word[2]) );
  NAND3xp33_ASAP7_75t_SRAM U10 ( .A(n2), .B(n3), .C(a[0]), .Y(word[1]) );
  NAND3xp33_ASAP7_75t_SRAM U11 ( .A(n2), .B(n3), .C(n1), .Y(word[0]) );
  INVx1_ASAP7_75t_SRAM U1 ( .A(a[1]), .Y(n2) );
  INVx1_ASAP7_75t_SRAM U2 ( .A(a[0]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(a[2]), .Y(n3) );
endmodule


module decoder_3to8_2 ( a, word );
  input [2:0] a;
  output [7:0] word;
  wire   n1, n2, n3;

  NAND3xp33_ASAP7_75t_SRAM U4 ( .A(a[1]), .B(a[0]), .C(a[2]), .Y(word[7]) );
  NAND3xp33_ASAP7_75t_SRAM U5 ( .A(a[1]), .B(n1), .C(a[2]), .Y(word[6]) );
  NAND3xp33_ASAP7_75t_SRAM U6 ( .A(a[0]), .B(n2), .C(a[2]), .Y(word[5]) );
  NAND3xp33_ASAP7_75t_SRAM U7 ( .A(n1), .B(n2), .C(a[2]), .Y(word[4]) );
  NAND3xp33_ASAP7_75t_SRAM U8 ( .A(a[0]), .B(n3), .C(a[1]), .Y(word[3]) );
  NAND3xp33_ASAP7_75t_SRAM U9 ( .A(n1), .B(n3), .C(a[1]), .Y(word[2]) );
  NAND3xp33_ASAP7_75t_SRAM U10 ( .A(n2), .B(n3), .C(a[0]), .Y(word[1]) );
  NAND3xp33_ASAP7_75t_SRAM U11 ( .A(n2), .B(n3), .C(n1), .Y(word[0]) );
  INVx1_ASAP7_75t_SRAM U1 ( .A(a[1]), .Y(n2) );
  INVx1_ASAP7_75t_SRAM U2 ( .A(a[0]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(a[2]), .Y(n3) );
endmodule


module decoder_3to8_1 ( a, word );
  input [2:0] a;
  output [7:0] word;
  wire   n1, n2, n3;

  NAND3xp33_ASAP7_75t_SRAM U4 ( .A(a[1]), .B(a[0]), .C(a[2]), .Y(word[7]) );
  NAND3xp33_ASAP7_75t_SRAM U5 ( .A(a[1]), .B(n1), .C(a[2]), .Y(word[6]) );
  NAND3xp33_ASAP7_75t_SRAM U6 ( .A(a[0]), .B(n2), .C(a[2]), .Y(word[5]) );
  NAND3xp33_ASAP7_75t_SRAM U7 ( .A(n1), .B(n2), .C(a[2]), .Y(word[4]) );
  NAND3xp33_ASAP7_75t_SRAM U8 ( .A(a[0]), .B(n3), .C(a[1]), .Y(word[3]) );
  NAND3xp33_ASAP7_75t_SRAM U9 ( .A(n1), .B(n3), .C(a[1]), .Y(word[2]) );
  NAND3xp33_ASAP7_75t_SRAM U10 ( .A(n2), .B(n3), .C(a[0]), .Y(word[1]) );
  NAND3xp33_ASAP7_75t_SRAM U11 ( .A(n2), .B(n3), .C(n1), .Y(word[0]) );
  INVx1_ASAP7_75t_SRAM U1 ( .A(a[1]), .Y(n2) );
  INVx1_ASAP7_75t_SRAM U2 ( .A(a[0]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(a[2]), .Y(n3) );
endmodule


module decoder_3to8_0 ( a, word );
  input [2:0] a;
  output [7:0] word;
  wire   n1, n2, n3;

  NAND3xp33_ASAP7_75t_SRAM U4 ( .A(a[1]), .B(a[0]), .C(a[2]), .Y(word[7]) );
  NAND3xp33_ASAP7_75t_SRAM U5 ( .A(a[1]), .B(n1), .C(a[2]), .Y(word[6]) );
  NAND3xp33_ASAP7_75t_SRAM U6 ( .A(a[0]), .B(n2), .C(a[2]), .Y(word[5]) );
  NAND3xp33_ASAP7_75t_SRAM U7 ( .A(n1), .B(n2), .C(a[2]), .Y(word[4]) );
  NAND3xp33_ASAP7_75t_SRAM U8 ( .A(a[0]), .B(n3), .C(a[1]), .Y(word[3]) );
  NAND3xp33_ASAP7_75t_SRAM U9 ( .A(n1), .B(n3), .C(a[1]), .Y(word[2]) );
  NAND3xp33_ASAP7_75t_SRAM U10 ( .A(n2), .B(n3), .C(a[0]), .Y(word[1]) );
  NAND3xp33_ASAP7_75t_SRAM U11 ( .A(n2), .B(n3), .C(n1), .Y(word[0]) );
  INVx1_ASAP7_75t_SRAM U1 ( .A(a[1]), .Y(n2) );
  INVx1_ASAP7_75t_SRAM U2 ( .A(a[0]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(a[2]), .Y(n3) );
endmodule


module decoder_3to8_8 ( a, word );
  input [2:0] a;
  output [7:0] word;
  wire   n1, n2, n3;

  INVx1_ASAP7_75t_SRAM U1 ( .A(a[2]), .Y(n1) );
  INVx1_ASAP7_75t_SRAM U2 ( .A(a[1]), .Y(n2) );
  INVx1_ASAP7_75t_SRAM U3 ( .A(a[0]), .Y(n3) );
  NAND3xp33_ASAP7_75t_SRAM U4 ( .A(a[1]), .B(a[0]), .C(a[2]), .Y(word[7]) );
  NAND3xp33_ASAP7_75t_SRAM U5 ( .A(a[1]), .B(n3), .C(a[2]), .Y(word[6]) );
  NAND3xp33_ASAP7_75t_SRAM U6 ( .A(a[0]), .B(n2), .C(a[2]), .Y(word[5]) );
  NAND3xp33_ASAP7_75t_SRAM U7 ( .A(n3), .B(n2), .C(a[2]), .Y(word[4]) );
  NAND3xp33_ASAP7_75t_SRAM U8 ( .A(a[0]), .B(n1), .C(a[1]), .Y(word[3]) );
  NAND3xp33_ASAP7_75t_SRAM U9 ( .A(n3), .B(n1), .C(a[1]), .Y(word[2]) );
  NAND3xp33_ASAP7_75t_SRAM U10 ( .A(n2), .B(n1), .C(a[0]), .Y(word[1]) );
  NAND3xp33_ASAP7_75t_SRAM U11 ( .A(n2), .B(n1), .C(n3), .Y(word[0]) );
endmodule

