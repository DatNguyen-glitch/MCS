.title Write Noise Margin Operation 
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
*.param pu=1 pg=1 pd=1
.param pu=1 pg=2 pd=2

Mpr  q   gr  VDD  x  pmos_sram  m=pu
Mnr  q   gr  GND  x  nmos_sram  m=pd

Mpl  qb  gl  VDD  x  pmos_sram  m=pu
Mnl  qb  gl  GND  x  nmos_sram  m=pd

Mnpr BL  WL  q    x  nmos_sram  m=pg
Mnpl BLB WL  qb   x  nmos_sram  m=pg

*****************************
**     Voltage Source      **
*****************************
.global VDD GND
.PARAM  BITCAP=1E-12

VVDD VDD GND dc=v_vdd
* write and read op
VWL  WL  GND dc=v_vdd 

* hold op
* VWL  WL  GND 0V 

CBLB BLB GND BITCAP
CBL  BL  GND BITCAP

* .ic V(BL) = v_vdd 
.ic V(BL) = 0 
.ic V(BLB) = v_vdd

* .ic V(q) = v_vdd
* .ic V(qb) = 0

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
.dc Vu '-1/sqrt(2)' '1/sqrt(2)' 0.0001
* .dc vnoise 0 v_vdd 0.0001

*.param vnoise=0
.param v_vdd=0.7

* Vgr gr GND dc=vnoise
* Vgl VDD gl dc=vnoise

VBLB BLB GND dc=v_vdd
VBL BL GND dc=0


*****************************
**    Simulator setting    **
*****************************
.option ingold = 2
.option post 
.option lis_new = 1 
.options probe
.probe v(*) i(*)

.TEMP 25

*****************************
**      Measurement        **
*****************************
*.measure dc max_1 max v(v1,v2)
*.measure dc max_2 max v(v2,v1)
*.measure dc SNM param='min(max_1,max_2)/sqrt(2)' 

.print dc v(q) v(qb) v(gl) v(gr)

.measure dc min_1 min v(v1,v2) FROM = 0 TO = 0.7
.measure dc SNM param='(min_1/sqrt(2))'

.alter
.protect
.include '../../tech_file/7nm_FF.pm'
.unprotect 

.alter
.protect
.include '../../tech_file/7nm_SS.pm'
.unprotect 


.end
