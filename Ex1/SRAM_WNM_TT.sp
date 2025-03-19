.title Write Noise Margin 
*****************************
**     Library setting     **
*****************************
.protect
.include '../../tech_file/7nm_TT.pm'
.unprotect 

*****************************
**   Circuit Description   **
*****************************
*** By default, m = 1 ***
*** for 1:1:1, the "m" of mos must equal to 1 ***

Mpr  q   gr  VDD  x  pmos_sram  m=1
Mnr  q   gl  GND  x  nmos_sram  m=1

Mpl  qb  gr  VDD  x  pmos_sram  m=1
Mnl  qb  gl  GND  x  nmos_sram  m=1

Mnpr BL  WL  q    x  nmos_sram  m=1
Mnpl BLB WL  qb   x  nmos_sram  m=1

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
.PARAM  BITCAP=1E-12

VVDD VDD GND 0.7v
VWL  WL  GND 0.7V  ** Write operation 

CBLB BLB GND BITCAP
CBL  BL  GND BITCAP

.ic V(BL) = 0.7V  
.ic V(BLB)= 0V  

*****************************
**       DC Analysis       **
*****************************
.op

.dc vnoise 0 0.7 0.0001
.param vnoise=0

Vgl gl GND dc=vnoise
Vgr gr GND dc=vnoise

Vbl BL GND 0V
Vblb BLB GND 0.7V
*****************************
**    Simulator setting    **
*****************************
.option post 
.options probe
.probe v(*) i(*)

.TEMP 25

*****************************
**      Measurement        **
*****************************
*.measure dc max_1 max v(v1,v2)
*.measure dc max_2 max v(v2,v1)
*.measure dc SNM param='min(max_1,max_2)/sqrt(2)' 


**.measure cross_point when v(v1) = v(v2)
**.measure dc max_1 max v(v1,v2) FROM = 'cross_point' TO = '-cross_point'
**.measure dc max_2 max v(v2,v1) FROM = 'cross_point' TO = '-cross_point'
**.measure dc SNM param='(min(max_1,max_2)/sqrt(2))'

.end
