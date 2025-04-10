/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : P-2019.03-SP1-1
// Date      : Thu Apr 10 14:01:37 2025
/////////////////////////////////////////////////////////////


module decoder_6to64 ( clk, in_addr, wordline );
  input [5:0] in_addr;
  output [63:0] wordline;
  input clk;
  wire   n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61;

  INVx4_ASAP7_75t_SRAM U90 ( .A(clk), .Y(n46) );
  INVx5_ASAP7_75t_SRAM U91 ( .A(in_addr[0]), .Y(n24) );
  INVx5_ASAP7_75t_SRAM U92 ( .A(in_addr[3]), .Y(n25) );
  INVx5_ASAP7_75t_SRAM U93 ( .A(in_addr[4]), .Y(n26) );
  INVx5_ASAP7_75t_SRAM U94 ( .A(in_addr[5]), .Y(n27) );
  INVx5_ASAP7_75t_SRAM U95 ( .A(in_addr[1]), .Y(n28) );
  INVx5_ASAP7_75t_SRAM U96 ( .A(in_addr[3]), .Y(n29) );
  INVx5_ASAP7_75t_SRAM U97 ( .A(in_addr[3]), .Y(n30) );
  INVx5_ASAP7_75t_SRAM U98 ( .A(in_addr[3]), .Y(n39) );
  INVx5_ASAP7_75t_SRAM U99 ( .A(in_addr[0]), .Y(n31) );
  INVx5_ASAP7_75t_SRAM U100 ( .A(in_addr[0]), .Y(n32) );
  INVx5_ASAP7_75t_SRAM U101 ( .A(in_addr[4]), .Y(n33) );
  INVx5_ASAP7_75t_SRAM U102 ( .A(in_addr[4]), .Y(n34) );
  INVx5_ASAP7_75t_SRAM U103 ( .A(in_addr[0]), .Y(n49) );
  INVx5_ASAP7_75t_SRAM U104 ( .A(in_addr[4]), .Y(n40) );
  NOR2xp67_ASAP7_75t_SRAM U105 ( .A(n61), .B(n43), .Y(wordline[6]) );
  NOR2xp67_ASAP7_75t_SRAM U106 ( .A(n61), .B(n45), .Y(wordline[5]) );
  NOR2xp67_ASAP7_75t_SRAM U107 ( .A(n61), .B(n44), .Y(wordline[4]) );
  NOR2xp67_ASAP7_75t_SRAM U108 ( .A(n42), .B(n51), .Y(wordline[55]) );
  NOR2xp67_ASAP7_75t_SRAM U109 ( .A(n42), .B(n55), .Y(wordline[47]) );
  NOR2xp67_ASAP7_75t_SRAM U110 ( .A(n42), .B(n56), .Y(wordline[39]) );
  NOR2xp67_ASAP7_75t_SRAM U111 ( .A(n42), .B(n52), .Y(wordline[23]) );
  NOR2xp67_ASAP7_75t_SRAM U112 ( .A(n42), .B(n53), .Y(wordline[15]) );
  NOR2xp67_ASAP7_75t_SRAM U113 ( .A(n42), .B(n57), .Y(wordline[31]) );
  NOR2xp67_ASAP7_75t_SRAM U114 ( .A(n61), .B(n42), .Y(wordline[7]) );
  NOR2xp67_ASAP7_75t_SRAM U115 ( .A(n43), .B(n57), .Y(wordline[30]) );
  NOR2xp67_ASAP7_75t_SRAM U116 ( .A(n43), .B(n53), .Y(wordline[14]) );
  NOR2xp67_ASAP7_75t_SRAM U117 ( .A(n43), .B(n55), .Y(wordline[46]) );
  NOR2xp67_ASAP7_75t_SRAM U118 ( .A(n43), .B(n52), .Y(wordline[22]) );
  NOR2xp67_ASAP7_75t_SRAM U119 ( .A(n43), .B(n54), .Y(wordline[62]) );
  NOR2xp67_ASAP7_75t_SRAM U120 ( .A(n43), .B(n56), .Y(wordline[38]) );
  NOR2xp67_ASAP7_75t_SRAM U121 ( .A(n44), .B(n53), .Y(wordline[12]) );
  NOR2xp67_ASAP7_75t_SRAM U122 ( .A(n44), .B(n52), .Y(wordline[20]) );
  NOR2xp67_ASAP7_75t_SRAM U123 ( .A(n44), .B(n57), .Y(wordline[28]) );
  NOR2xp67_ASAP7_75t_SRAM U124 ( .A(n44), .B(n51), .Y(wordline[52]) );
  NOR2xp67_ASAP7_75t_SRAM U125 ( .A(n44), .B(n55), .Y(wordline[44]) );
  NOR2xp67_ASAP7_75t_SRAM U126 ( .A(n45), .B(n51), .Y(wordline[53]) );
  NOR2xp67_ASAP7_75t_SRAM U127 ( .A(n44), .B(n54), .Y(wordline[60]) );
  NOR2xp67_ASAP7_75t_SRAM U128 ( .A(n44), .B(n56), .Y(wordline[36]) );
  NOR2xp67_ASAP7_75t_SRAM U129 ( .A(n45), .B(n55), .Y(wordline[45]) );
  NOR2xp67_ASAP7_75t_SRAM U130 ( .A(n45), .B(n52), .Y(wordline[21]) );
  NOR2xp67_ASAP7_75t_SRAM U131 ( .A(n45), .B(n54), .Y(wordline[61]) );
  NOR2xp67_ASAP7_75t_SRAM U132 ( .A(n45), .B(n57), .Y(wordline[29]) );
  NOR2xp67_ASAP7_75t_SRAM U133 ( .A(n45), .B(n53), .Y(wordline[13]) );
  NOR2xp67_ASAP7_75t_SRAM U134 ( .A(n45), .B(n56), .Y(wordline[37]) );
  NOR2xp67_ASAP7_75t_SRAM U135 ( .A(n58), .B(n53), .Y(wordline[11]) );
  NOR2xp67_ASAP7_75t_SRAM U136 ( .A(n58), .B(n52), .Y(wordline[19]) );
  NOR2xp67_ASAP7_75t_SRAM U137 ( .A(n58), .B(n57), .Y(wordline[27]) );
  NOR2xp67_ASAP7_75t_SRAM U138 ( .A(n58), .B(n56), .Y(wordline[35]) );
  NOR2xp67_ASAP7_75t_SRAM U139 ( .A(n58), .B(n51), .Y(wordline[51]) );
  NOR2xp67_ASAP7_75t_SRAM U140 ( .A(n58), .B(n54), .Y(wordline[59]) );
  NOR2xp67_ASAP7_75t_SRAM U141 ( .A(n47), .B(n57), .Y(wordline[24]) );
  NOR2xp67_ASAP7_75t_SRAM U142 ( .A(n47), .B(n53), .Y(wordline[8]) );
  NOR2xp67_ASAP7_75t_SRAM U143 ( .A(n47), .B(n56), .Y(wordline[32]) );
  NOR2xp67_ASAP7_75t_SRAM U144 ( .A(n47), .B(n52), .Y(wordline[16]) );
  NOR2xp67_ASAP7_75t_SRAM U145 ( .A(n47), .B(n54), .Y(wordline[56]) );
  NOR2xp67_ASAP7_75t_SRAM U146 ( .A(n47), .B(n55), .Y(wordline[40]) );
  NOR2xp67_ASAP7_75t_SRAM U147 ( .A(n47), .B(n61), .Y(wordline[0]) );
  NOR2xp67_ASAP7_75t_SRAM U148 ( .A(n47), .B(n51), .Y(wordline[48]) );
  NOR2xp67_ASAP7_75t_SRAM U149 ( .A(n59), .B(n52), .Y(wordline[17]) );
  NOR2xp67_ASAP7_75t_SRAM U150 ( .A(n59), .B(n56), .Y(wordline[33]) );
  NOR2xp67_ASAP7_75t_SRAM U151 ( .A(n59), .B(n51), .Y(wordline[49]) );
  NOR2xp67_ASAP7_75t_SRAM U152 ( .A(n60), .B(n51), .Y(wordline[50]) );
  NOR2xp67_ASAP7_75t_SRAM U153 ( .A(n59), .B(n57), .Y(wordline[25]) );
  NOR2xp67_ASAP7_75t_SRAM U154 ( .A(n60), .B(n54), .Y(wordline[58]) );
  NOR2xp67_ASAP7_75t_SRAM U155 ( .A(n60), .B(n55), .Y(wordline[42]) );
  NOR2xp67_ASAP7_75t_SRAM U156 ( .A(n60), .B(n52), .Y(wordline[18]) );
  NOR2xp67_ASAP7_75t_SRAM U157 ( .A(n60), .B(n53), .Y(wordline[10]) );
  NOR2xp67_ASAP7_75t_SRAM U158 ( .A(n59), .B(n53), .Y(wordline[9]) );
  NOR2xp67_ASAP7_75t_SRAM U159 ( .A(n59), .B(n54), .Y(wordline[57]) );
  NOR2xp67_ASAP7_75t_SRAM U160 ( .A(n59), .B(n55), .Y(wordline[41]) );
  NOR2xp67_ASAP7_75t_SRAM U161 ( .A(n60), .B(n57), .Y(wordline[26]) );
  NOR2xp67_ASAP7_75t_SRAM U162 ( .A(n61), .B(n58), .Y(wordline[3]) );
  NOR2xp67_ASAP7_75t_SRAM U163 ( .A(n61), .B(n59), .Y(wordline[1]) );
  NOR2xp67_ASAP7_75t_SRAM U164 ( .A(n61), .B(n60), .Y(wordline[2]) );
  NOR2xp67_ASAP7_75t_SRAM U165 ( .A(n42), .B(n54), .Y(wordline[63]) );
  NOR2xp67_ASAP7_75t_SRAM U166 ( .A(n43), .B(n51), .Y(wordline[54]) );
  NOR2xp67_ASAP7_75t_SRAM U167 ( .A(n58), .B(n55), .Y(wordline[43]) );
  NOR2xp67_ASAP7_75t_SRAM U168 ( .A(n60), .B(n56), .Y(wordline[34]) );
  INVx5_ASAP7_75t_SRAM U169 ( .A(in_addr[5]), .Y(n35) );
  INVx5_ASAP7_75t_SRAM U170 ( .A(in_addr[5]), .Y(n36) );
  INVx5_ASAP7_75t_SRAM U171 ( .A(in_addr[5]), .Y(n41) );
  INVx5_ASAP7_75t_SRAM U172 ( .A(in_addr[1]), .Y(n37) );
  INVx5_ASAP7_75t_SRAM U173 ( .A(in_addr[1]), .Y(n38) );
  INVx5_ASAP7_75t_SRAM U174 ( .A(in_addr[1]), .Y(n48) );
  NAND3xp33_ASAP7_75t_SRAM U175 ( .A(n35), .B(n33), .C(n39), .Y(n61) );
  NAND4xp25_ASAP7_75t_SRAM U176 ( .A(in_addr[1]), .B(clk), .C(in_addr[2]), .D(
        n49), .Y(n43) );
  NAND4xp25_ASAP7_75t_SRAM U177 ( .A(in_addr[0]), .B(clk), .C(in_addr[2]), .D(
        n48), .Y(n45) );
  NAND4xp25_ASAP7_75t_SRAM U178 ( .A(clk), .B(n28), .C(n24), .D(in_addr[2]), 
        .Y(n44) );
  NAND4xp25_ASAP7_75t_SRAM U179 ( .A(in_addr[0]), .B(in_addr[1]), .C(clk), .D(
        in_addr[2]), .Y(n42) );
  NAND3xp33_ASAP7_75t_SRAM U180 ( .A(in_addr[4]), .B(in_addr[5]), .C(n25), .Y(
        n51) );
  NAND3xp33_ASAP7_75t_SRAM U181 ( .A(in_addr[5]), .B(in_addr[3]), .C(n26), .Y(
        n55) );
  NAND3xp33_ASAP7_75t_SRAM U182 ( .A(in_addr[5]), .B(n34), .C(n29), .Y(n56) );
  NAND3xp33_ASAP7_75t_SRAM U183 ( .A(in_addr[5]), .B(in_addr[4]), .C(
        in_addr[3]), .Y(n54) );
  NAND3xp33_ASAP7_75t_SRAM U184 ( .A(in_addr[4]), .B(n30), .C(n27), .Y(n52) );
  NAND3xp33_ASAP7_75t_SRAM U185 ( .A(in_addr[3]), .B(n36), .C(n40), .Y(n53) );
  NAND3xp33_ASAP7_75t_SRAM U186 ( .A(in_addr[4]), .B(in_addr[3]), .C(n41), .Y(
        n57) );
  NOR2xp33_ASAP7_75t_SRAM U187 ( .A(n46), .B(in_addr[2]), .Y(n50) );
  NAND3xp33_ASAP7_75t_SRAM U188 ( .A(in_addr[0]), .B(in_addr[1]), .C(n50), .Y(
        n58) );
  NAND3xp33_ASAP7_75t_SRAM U189 ( .A(n31), .B(n37), .C(n50), .Y(n47) );
  NAND3xp33_ASAP7_75t_SRAM U190 ( .A(in_addr[0]), .B(n50), .C(n38), .Y(n59) );
  NAND3xp33_ASAP7_75t_SRAM U191 ( .A(in_addr[1]), .B(n50), .C(n32), .Y(n60) );
endmodule

