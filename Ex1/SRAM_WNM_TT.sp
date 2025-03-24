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
Mnr  q   gr  GND  x  nmos_sram  m=1

Mpl  qb  gl  VDD  x  pmos_sram  m=1
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

.ic V(BL) = 0V  
.ic V(BLB)= 0.7V  

*************************************
** Voltage control Voltage Source  **
*************************************
ELi gl GND VCVS POLY(2) v1 GND u GND 0 '1/sqrt(2)' '1/sqrt(2)'
Ev1 v1 GND VCVS POLY(2) qb GND u GND 0 'sqrt(2)'   1
ERi gr GND VCVS POLY(2) v2 GND u GND 0 '1/sqrt(2)' '-1/sqrt(2)'
Ev2 v2 GND VCVS POLY(2) q  GND u GND 0 'sqrt(2)'   -1

Vu u GND 0

*****************************
**       DC Analysis       **
*****************************
.op

.dc Vu '-0.7/sqrt(2)' '0.7/sqrt(2)' 0.0001
.param vnoise=0

Vbl BL GND 0V
Vblb BLB GND 0.7V
*****************************
**    Simulator setting    **
*****************************
.option ingold = 2
.option post 
.option lis_new = 1 
.options probe
.probe v(*) i(*)
.print v(q) v(qb) v(gl) v(gr)

.TEMP 25

*****************************
**      Measurement        **
*****************************
.measure dc min_1 min v(v1,v2)
.measure dc WNM param='(min_1/sqrt(2))'

.ALTER
.protect
.include '../../tech_file/7nm_FF.pm'
.unprotect 

.ALTER
.protect
.include '../../tech_file/7nm_SS.pm'
.unprotect  

.end
