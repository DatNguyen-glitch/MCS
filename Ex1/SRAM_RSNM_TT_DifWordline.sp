.title Noise Margin in Read Operation 
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
.PARAM BITCAP=1E-12
.PARAM VWL = 0.9V

VVDD VDD GND 0.7v
VWL  WL  GND VWL 

CBLB BLB GND BITCAP
CBL  BL  GND BITCAP

.ic V(BL) =0.7V  
.ic V(BLB)=0.7V  
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

VBLB BLB GND 0.7V
VBL  BL  GND 0.7V

*****************************
**    Simulator setting    **
*****************************
.option post 
.options probe
.probe v(*) i(*)
.print v(q) v(qb) v(gl) v(gr)

.TEMP 25

*****************************
**      Measurement        **
*****************************
**.measure dc max_1 max v(v1,v2)
**.measure dc max_2 max v(v2,v1)
**.measure dc SNM param='min(max_1,max_2)/sqrt(2)' 

.measure cross_point when v(v1) = v(v2)
.measure dc max_1 max v(v1,v2) FROM = 'cross_point' TO = '-cross_point'
.measure dc max_2 max v(v2,v1) FROM = 'cross_point' TO = '-cross_point'
.measure dc RSNM param='(min(max_1,max_2)/sqrt(2))'

.ALTER
.PARAM VWL = 0.8V

.ALTER
.PARAM VWL = 0.7V

.ALTER
.PARAM VWL = 0.6V

.ALTER
.PARAM VWL = 0.5V

.end
