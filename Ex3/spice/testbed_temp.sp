.tile sense amplifier testbed

.inc "~/lib/7nm_TT.pm"
.inc "~/lib/ASAP7_PDKandLIB_v1p5/asap7libs_24/cdl/pex/asap7sc7p5t_24_SIMPLE_SRAM.sp"
.vec "vector_128.vec"

.global vdd gnd
.param v_vdd = 0.7
.param blcap = 12f
.param tr = 0.1n tf = 0.1n td = 0 prd=1n

v1 vdd gnd dc=v_vdd
v_clk clk gnd pulse (0 v_vdd td tr tf '0.5*prd-tf' prd)

* x_sa vdd gnd bl blb q qb sense_curr_amp 
c_bl bl gnd c=blcap
c_blb blb gnd c=blcap

* precharge circuit
X_pre BL BLB clk VDD pre_charge
* X_SA_vol BL BLB clk dout dout_b VDD GND SA_vol
X_SA_current VDD GND BL BLB dout dout_b clk SA_current_base

X_SA_vol_pre BL BLB clk dout dout_b VDD GND SA_vol_pre

.tran 1p 10n
.option probe
.option post
.probe tran v(*)


.inc buffer.sp
.inc sram_6t.sp
.inc sram_arr128.sp
.inc sram_arr512.sp
.option VCD

