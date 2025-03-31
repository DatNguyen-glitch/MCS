/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : P-2019.03-SP1-1
// Date      : Mon Mar 31 17:06:36 2025
/////////////////////////////////////////////////////////////


module dec_6to64 ( addr, wordline );
  input [5:0] addr;
  output [63:0] wordline;
  wire   n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51;

  NOR2xp33_ASAP7_75t_R U88 ( .A(addr[3]), .B(n33), .Y(n34) );
  INVx4_ASAP7_75t_R U89 ( .A(addr[4]), .Y(n23) );
  NAND2xp5_ASAP7_75t_R U90 ( .A(addr[5]), .B(addr[4]), .Y(n33) );
  INVx4_ASAP7_75t_R U91 ( .A(addr[5]), .Y(n24) );
  INVx8_ASAP7_75t_R U92 ( .A(addr[4]), .Y(n39) );
  INVx8_ASAP7_75t_R U93 ( .A(addr[5]), .Y(n36) );
  INVx8_ASAP7_75t_R U94 ( .A(addr[0]), .Y(n25) );
  INVx8_ASAP7_75t_R U95 ( .A(addr[2]), .Y(n26) );
  INVx8_ASAP7_75t_R U96 ( .A(addr[0]), .Y(n30) );
  INVx8_ASAP7_75t_R U97 ( .A(addr[2]), .Y(n29) );
  INVx8_ASAP7_75t_R U98 ( .A(addr[3]), .Y(n27) );
  INVx8_ASAP7_75t_R U99 ( .A(addr[3]), .Y(n41) );
  INVx8_ASAP7_75t_R U100 ( .A(addr[1]), .Y(n28) );
  INVx8_ASAP7_75t_R U101 ( .A(addr[1]), .Y(n31) );
  NOR3xp33_ASAP7_75t_R U102 ( .A(addr[1]), .B(addr[0]), .C(addr[2]), .Y(n43)
         );
  NOR3xp33_ASAP7_75t_R U103 ( .A(n27), .B(n36), .C(n23), .Y(n32) );
  NAND2xp33_ASAP7_75t_R U104 ( .A(n43), .B(n32), .Y(wordline[56]) );
  NOR3xp33_ASAP7_75t_R U105 ( .A(addr[1]), .B(addr[2]), .C(n30), .Y(n44) );
  NAND2xp33_ASAP7_75t_R U106 ( .A(n32), .B(n44), .Y(wordline[57]) );
  NOR3xp33_ASAP7_75t_R U107 ( .A(addr[0]), .B(addr[2]), .C(n31), .Y(n45) );
  NAND2xp33_ASAP7_75t_R U108 ( .A(n32), .B(n45), .Y(wordline[58]) );
  NOR3xp33_ASAP7_75t_R U109 ( .A(addr[2]), .B(n25), .C(n31), .Y(n46) );
  NAND2xp33_ASAP7_75t_R U110 ( .A(n32), .B(n46), .Y(wordline[59]) );
  NOR3xp33_ASAP7_75t_R U111 ( .A(addr[1]), .B(addr[0]), .C(n29), .Y(n47) );
  NAND2xp33_ASAP7_75t_R U112 ( .A(n32), .B(n47), .Y(wordline[60]) );
  NOR3xp33_ASAP7_75t_R U113 ( .A(addr[1]), .B(n30), .C(n26), .Y(n48) );
  NAND2xp33_ASAP7_75t_R U114 ( .A(n32), .B(n48), .Y(wordline[61]) );
  NOR3xp33_ASAP7_75t_R U115 ( .A(addr[0]), .B(n28), .C(n29), .Y(n49) );
  NAND2xp33_ASAP7_75t_R U116 ( .A(n32), .B(n49), .Y(wordline[62]) );
  NOR3xp33_ASAP7_75t_R U117 ( .A(n28), .B(n25), .C(n26), .Y(n51) );
  NAND2xp33_ASAP7_75t_R U118 ( .A(n32), .B(n51), .Y(wordline[63]) );
  NAND2xp33_ASAP7_75t_R U119 ( .A(n43), .B(n34), .Y(wordline[48]) );
  NAND2xp33_ASAP7_75t_R U120 ( .A(n44), .B(n34), .Y(wordline[49]) );
  NAND2xp33_ASAP7_75t_R U121 ( .A(n45), .B(n34), .Y(wordline[50]) );
  NAND2xp33_ASAP7_75t_R U122 ( .A(n46), .B(n34), .Y(wordline[51]) );
  NAND2xp33_ASAP7_75t_R U123 ( .A(n47), .B(n34), .Y(wordline[52]) );
  NAND2xp33_ASAP7_75t_R U124 ( .A(n48), .B(n34), .Y(wordline[53]) );
  NAND2xp33_ASAP7_75t_R U125 ( .A(n49), .B(n34), .Y(wordline[54]) );
  NAND2xp33_ASAP7_75t_R U126 ( .A(n51), .B(n34), .Y(wordline[55]) );
  NOR3xp33_ASAP7_75t_R U127 ( .A(addr[4]), .B(n36), .C(n41), .Y(n35) );
  NAND2xp33_ASAP7_75t_R U128 ( .A(n43), .B(n35), .Y(wordline[40]) );
  NAND2xp33_ASAP7_75t_R U129 ( .A(n44), .B(n35), .Y(wordline[41]) );
  NAND2xp33_ASAP7_75t_R U130 ( .A(n45), .B(n35), .Y(wordline[42]) );
  NAND2xp33_ASAP7_75t_R U131 ( .A(n46), .B(n35), .Y(wordline[43]) );
  NAND2xp33_ASAP7_75t_R U132 ( .A(n47), .B(n35), .Y(wordline[44]) );
  NAND2xp33_ASAP7_75t_R U133 ( .A(n48), .B(n35), .Y(wordline[45]) );
  NAND2xp33_ASAP7_75t_R U134 ( .A(n49), .B(n35), .Y(wordline[46]) );
  NAND2xp33_ASAP7_75t_R U135 ( .A(n51), .B(n35), .Y(wordline[47]) );
  NOR3xp33_ASAP7_75t_R U136 ( .A(addr[3]), .B(addr[4]), .C(n24), .Y(n37) );
  NAND2xp33_ASAP7_75t_R U137 ( .A(n43), .B(n37), .Y(wordline[32]) );
  NAND2xp33_ASAP7_75t_R U138 ( .A(n44), .B(n37), .Y(wordline[33]) );
  NAND2xp33_ASAP7_75t_R U139 ( .A(n45), .B(n37), .Y(wordline[34]) );
  NAND2xp33_ASAP7_75t_R U140 ( .A(n46), .B(n37), .Y(wordline[35]) );
  NAND2xp33_ASAP7_75t_R U141 ( .A(n47), .B(n37), .Y(wordline[36]) );
  NAND2xp33_ASAP7_75t_R U142 ( .A(n48), .B(n37), .Y(wordline[37]) );
  NAND2xp33_ASAP7_75t_R U143 ( .A(n49), .B(n37), .Y(wordline[38]) );
  NAND2xp33_ASAP7_75t_R U144 ( .A(n51), .B(n37), .Y(wordline[39]) );
  NOR3xp33_ASAP7_75t_R U145 ( .A(addr[5]), .B(n27), .C(n39), .Y(n38) );
  NAND2xp33_ASAP7_75t_R U146 ( .A(n43), .B(n38), .Y(wordline[24]) );
  NAND2xp33_ASAP7_75t_R U147 ( .A(n44), .B(n38), .Y(wordline[25]) );
  NAND2xp33_ASAP7_75t_R U148 ( .A(n45), .B(n38), .Y(wordline[26]) );
  NAND2xp33_ASAP7_75t_R U149 ( .A(n46), .B(n38), .Y(wordline[27]) );
  NAND2xp33_ASAP7_75t_R U150 ( .A(n47), .B(n38), .Y(wordline[28]) );
  NAND2xp33_ASAP7_75t_R U151 ( .A(n48), .B(n38), .Y(wordline[29]) );
  NAND2xp33_ASAP7_75t_R U152 ( .A(n49), .B(n38), .Y(wordline[30]) );
  NAND2xp33_ASAP7_75t_R U153 ( .A(n51), .B(n38), .Y(wordline[31]) );
  NOR3xp33_ASAP7_75t_R U154 ( .A(addr[3]), .B(addr[5]), .C(n39), .Y(n40) );
  NAND2xp33_ASAP7_75t_R U155 ( .A(n43), .B(n40), .Y(wordline[16]) );
  NAND2xp33_ASAP7_75t_R U156 ( .A(n44), .B(n40), .Y(wordline[17]) );
  NAND2xp33_ASAP7_75t_R U157 ( .A(n45), .B(n40), .Y(wordline[18]) );
  NAND2xp33_ASAP7_75t_R U158 ( .A(n46), .B(n40), .Y(wordline[19]) );
  NAND2xp33_ASAP7_75t_R U159 ( .A(n47), .B(n40), .Y(wordline[20]) );
  NAND2xp33_ASAP7_75t_R U160 ( .A(n48), .B(n40), .Y(wordline[21]) );
  NAND2xp33_ASAP7_75t_R U161 ( .A(n49), .B(n40), .Y(wordline[22]) );
  NAND2xp33_ASAP7_75t_R U162 ( .A(n51), .B(n40), .Y(wordline[23]) );
  NOR3xp33_ASAP7_75t_R U163 ( .A(addr[5]), .B(addr[4]), .C(n41), .Y(n42) );
  NAND2xp33_ASAP7_75t_R U164 ( .A(n43), .B(n42), .Y(wordline[8]) );
  NAND2xp33_ASAP7_75t_R U165 ( .A(n44), .B(n42), .Y(wordline[9]) );
  NAND2xp33_ASAP7_75t_R U166 ( .A(n45), .B(n42), .Y(wordline[10]) );
  NAND2xp33_ASAP7_75t_R U167 ( .A(n46), .B(n42), .Y(wordline[11]) );
  NAND2xp33_ASAP7_75t_R U168 ( .A(n47), .B(n42), .Y(wordline[12]) );
  NAND2xp33_ASAP7_75t_R U169 ( .A(n48), .B(n42), .Y(wordline[13]) );
  NAND2xp33_ASAP7_75t_R U170 ( .A(n49), .B(n42), .Y(wordline[14]) );
  NAND2xp33_ASAP7_75t_R U171 ( .A(n51), .B(n42), .Y(wordline[15]) );
  NOR3xp33_ASAP7_75t_R U172 ( .A(addr[3]), .B(addr[5]), .C(addr[4]), .Y(n50)
         );
  NAND2xp33_ASAP7_75t_R U173 ( .A(n43), .B(n50), .Y(wordline[0]) );
  NAND2xp33_ASAP7_75t_R U174 ( .A(n44), .B(n50), .Y(wordline[1]) );
  NAND2xp33_ASAP7_75t_R U175 ( .A(n45), .B(n50), .Y(wordline[2]) );
  NAND2xp33_ASAP7_75t_R U176 ( .A(n46), .B(n50), .Y(wordline[3]) );
  NAND2xp33_ASAP7_75t_R U177 ( .A(n47), .B(n50), .Y(wordline[4]) );
  NAND2xp33_ASAP7_75t_R U178 ( .A(n48), .B(n50), .Y(wordline[5]) );
  NAND2xp33_ASAP7_75t_R U179 ( .A(n49), .B(n50), .Y(wordline[6]) );
  NAND2xp33_ASAP7_75t_R U180 ( .A(n51), .B(n50), .Y(wordline[7]) );
endmodule

