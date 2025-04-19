
.param pu=1 pg=1 pd=1
.subckt sram_6t VDD VSS WL BL BLB
Mpr  q   qb  VDD  x  pmos_sram  m=pu
Mnr  q   qb  GND  x  nmos_sram  m=pd

Mpl  qb  q  VDD  x  pmos_sram  m=pu
Mnl  qb  q  GND  x  nmos_sram  m=pd

Mnpr BL  WL  q    x  nmos_sram  m=pg
Mnpl BLB WL  qb   x  nmos_sram  m=pg
.ends

