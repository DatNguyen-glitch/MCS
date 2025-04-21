.tile sense amplifier testbed

.inc "~/tech_file/7nm_TT.pm"
.inc "~/tech_file/ASAP7_PDKandLIB_v1p5/asap7libs_24/cdl/pex/asap7sc7p5t_24_SIMPLE_SRAM.sp"
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
.option measform=2
.probe tran v(WL[0]) v(WL[1]) v(WL[2]) v(WL[3]) v(WL[4]) v(WL[5]) v(WL[6]) v(WL[7]) v(WL[8]) v(WL[9]) v(WL[10])


.inc buffer.sp
.inc sram_6t.sp
.inc sram_arr128.sp
.inc sram_arr512.sp
.option VCD

*--------Power------*
.MEASURE TRAN avg_power_X_pre AVG P(X_Pre) FROM=0n TO=10n
.MEASURE TRAN avg_power_X_SA_current AVG P(X_SA_current) FROM=0n TO=10n
.MEASURE TRAN avg_power_X_SA_vol_pre AVG P(X_SA_vol_pre) FROM=0n TO=10n
.MEASURE TRAN avg_power_X_sram_arr0 AVG P(X_sram_arr0) FROM=0n TO=10n
*.MEASURE TRAN avg_power_X_SA_vol AVG P(X_SA_vol) FROM=0n TO=10n
*-------Performance-------*
.MEASURE TRAN clk_to_dout_delay_1 TRIG V(clk) VAL=0.35 RISE=1 TARG V(dout) VAL=0.35 FALL=1
.MEASURE TRAN clk_to_dout_delay_2 TRIG V(clk) VAL=0.35 RISE=4 TARG V(dout) VAL=0.35 FALL=2
.MEASURE TRAN clk_to_dout_delay_3 TRIG V(clk) VAL=0.35 RISE=6 TARG V(dout) VAL=0.35 FALL=3
.MEASURE TRAN clk_to_dout_delay_4 TRIG V(clk) VAL=0.35 RISE=7 TARG V(dout) VAL=0.35 FALL=4
.MEASURE TRAN clk_to_dout_b_delay_1 TRIG V(clk) VAL=0.35 RISE=2 TARG V(dout_b) VAL=0.35 FALL=1
.MEASURE TRAN clk_to_dout_b_delay_2 TRIG V(clk) VAL=0.35 RISE=3 TARG V(dout_b) VAL=0.35 FALL=2
.MEASURE TRAN clk_to_dout_b_delay_3 TRIG V(clk) VAL=0.35 RISE=5 TARG V(dout_b) VAL=0.35 FALL=3
*------------------------*
.CHECK EDGE (clk RISE 20p 500p RISE) dout
.CHECK EDGE (clk RISE 20p 500p FALL) dout
.CHECK EDGE (clk FALL 20p 500p RISE) dout
.CHECK EDGE (clk FALL 20p 500p FALL) dout
.CHECK EDGE (clk RISE 20p 500p RISE) dout_b
.CHECK EDGE (clk RISE 20p 500p FALL) dout_b
.CHECK EDGE (clk FALL 20p 500p RISE) dout_b
.CHECK EDGE (clk FALL 20p 500p FALL) dout_b
*------------------------*
x_sram_arr0 vdd gnd bl blb
+ wl[0] wl[1] wl[2] wl[3] wl[4] wl[5] wl[6] wl[7]
+ wl[8] wl[9] wl[10] wl[11] wl[12] wl[13] wl[14] wl[15]
+ wl[16] wl[17] wl[18] wl[19] wl[20] wl[21] wl[22] wl[23]
+ wl[24] wl[25] wl[26] wl[27] wl[28] wl[29] wl[30] wl[31]
+ wl[32] wl[33] wl[34] wl[35] wl[36] wl[37] wl[38] wl[39]
+ wl[40] wl[41] wl[42] wl[43] wl[44] wl[45] wl[46] wl[47]
+ wl[48] wl[49] wl[50] wl[51] wl[52] wl[53] wl[54] wl[55]
+ wl[56] wl[57] wl[58] wl[59] wl[60] wl[61] wl[62] wl[63]
+ wl[64] wl[65] wl[66] wl[67] wl[68] wl[69] wl[70] wl[71]
+ wl[72] wl[73] wl[74] wl[75] wl[76] wl[77] wl[78] wl[79]
+ wl[80] wl[81] wl[82] wl[83] wl[84] wl[85] wl[86] wl[87]
+ wl[88] wl[89] wl[90] wl[91] wl[92] wl[93] wl[94] wl[95]
+ wl[96] wl[97] wl[98] wl[99] wl[100] wl[101] wl[102] wl[103]
+ wl[104] wl[105] wl[106] wl[107] wl[108] wl[109] wl[110] wl[111]
+ wl[112] wl[113] wl[114] wl[115] wl[116] wl[117] wl[118] wl[119]
+ wl[120] wl[121] wl[122] wl[123] wl[124] wl[125] wl[126] wl[127]
+ sram_arr128
x_buffer_arr0 vdd gnd clk
+ in[0] in[1] in[2] in[3] in[4] in[5] in[6] in[7]
+ in[8] in[9] in[10] in[11] in[12] in[13] in[14] in[15]
+ in[16] in[17] in[18] in[19] in[20] in[21] in[22] in[23]
+ in[24] in[25] in[26] in[27] in[28] in[29] in[30] in[31]
+ in[32] in[33] in[34] in[35] in[36] in[37] in[38] in[39]
+ in[40] in[41] in[42] in[43] in[44] in[45] in[46] in[47]
+ in[48] in[49] in[50] in[51] in[52] in[53] in[54] in[55]
+ in[56] in[57] in[58] in[59] in[60] in[61] in[62] in[63]
+ in[64] in[65] in[66] in[67] in[68] in[69] in[70] in[71]
+ in[72] in[73] in[74] in[75] in[76] in[77] in[78] in[79]
+ in[80] in[81] in[82] in[83] in[84] in[85] in[86] in[87]
+ in[88] in[89] in[90] in[91] in[92] in[93] in[94] in[95]
+ in[96] in[97] in[98] in[99] in[100] in[101] in[102] in[103]
+ in[104] in[105] in[106] in[107] in[108] in[109] in[110] in[111]
+ in[112] in[113] in[114] in[115] in[116] in[117] in[118] in[119]
+ in[120] in[121] in[122] in[123] in[124] in[125] in[126] in[127]
+ wl[0] wl[1] wl[2] wl[3] wl[4] wl[5] wl[6] wl[7]
+ wl[8] wl[9] wl[10] wl[11] wl[12] wl[13] wl[14] wl[15]
+ wl[16] wl[17] wl[18] wl[19] wl[20] wl[21] wl[22] wl[23]
+ wl[24] wl[25] wl[26] wl[27] wl[28] wl[29] wl[30] wl[31]
+ wl[32] wl[33] wl[34] wl[35] wl[36] wl[37] wl[38] wl[39]
+ wl[40] wl[41] wl[42] wl[43] wl[44] wl[45] wl[46] wl[47]
+ wl[48] wl[49] wl[50] wl[51] wl[52] wl[53] wl[54] wl[55]
+ wl[56] wl[57] wl[58] wl[59] wl[60] wl[61] wl[62] wl[63]
+ wl[64] wl[65] wl[66] wl[67] wl[68] wl[69] wl[70] wl[71]
+ wl[72] wl[73] wl[74] wl[75] wl[76] wl[77] wl[78] wl[79]
+ wl[80] wl[81] wl[82] wl[83] wl[84] wl[85] wl[86] wl[87]
+ wl[88] wl[89] wl[90] wl[91] wl[92] wl[93] wl[94] wl[95]
+ wl[96] wl[97] wl[98] wl[99] wl[100] wl[101] wl[102] wl[103]
+ wl[104] wl[105] wl[106] wl[107] wl[108] wl[109] wl[110] wl[111]
+ wl[112] wl[113] wl[114] wl[115] wl[116] wl[117] wl[118] wl[119]
+ wl[120] wl[121] wl[122] wl[123] wl[124] wl[125] wl[126] wl[127]
+ buffer_arr128
.LPRINT (0.3 0.32) v(clk)
+ v(wl[0]) v(wl[1]) v(wl[2]) v(wl[3]) v(wl[4]) v(wl[5]) v(wl[6]) v(wl[7])
+ v(wl[8]) v(wl[9]) v(wl[10]) v(wl[11]) v(wl[12]) v(wl[13]) v(wl[14]) v(wl[15])
+ v(wl[16]) v(wl[17]) v(wl[18]) v(wl[19]) v(wl[20]) v(wl[21]) v(wl[22]) v(wl[23])
+ v(wl[24]) v(wl[25]) v(wl[26]) v(wl[27]) v(wl[28]) v(wl[29]) v(wl[30]) v(wl[31])
+ v(wl[32]) v(wl[33]) v(wl[34]) v(wl[35]) v(wl[36]) v(wl[37]) v(wl[38]) v(wl[39])
+ v(wl[40]) v(wl[41]) v(wl[42]) v(wl[43]) v(wl[44]) v(wl[45]) v(wl[46]) v(wl[47])
+ v(wl[48]) v(wl[49]) v(wl[50]) v(wl[51]) v(wl[52]) v(wl[53]) v(wl[54]) v(wl[55])
+ v(wl[56]) v(wl[57]) v(wl[58]) v(wl[59]) v(wl[60]) v(wl[61]) v(wl[62]) v(wl[63])
+ v(wl[64]) v(wl[65]) v(wl[66]) v(wl[67]) v(wl[68]) v(wl[69]) v(wl[70]) v(wl[71])
+ v(wl[72]) v(wl[73]) v(wl[74]) v(wl[75]) v(wl[76]) v(wl[77]) v(wl[78]) v(wl[79])
+ v(wl[80]) v(wl[81]) v(wl[82]) v(wl[83]) v(wl[84]) v(wl[85]) v(wl[86]) v(wl[87])
+ v(wl[88]) v(wl[89]) v(wl[90]) v(wl[91]) v(wl[92]) v(wl[93]) v(wl[94]) v(wl[95])
+ v(wl[96]) v(wl[97]) v(wl[98]) v(wl[99]) v(wl[100]) v(wl[101]) v(wl[102]) v(wl[103])
+ v(wl[104]) v(wl[105]) v(wl[106]) v(wl[107]) v(wl[108]) v(wl[109]) v(wl[110]) v(wl[111])
+ v(wl[112]) v(wl[113]) v(wl[114]) v(wl[115]) v(wl[116]) v(wl[117]) v(wl[118]) v(wl[119])
+ v(wl[120]) v(wl[121]) v(wl[122]) v(wl[123]) v(wl[124]) v(wl[125]) v(wl[126]) v(wl[127])
+ v(in[0]) v(in[1]) v(in[2]) v(in[3]) v(in[4]) v(in[5]) v(in[6]) v(in[7])
+ v(in[8]) v(in[9]) v(in[10]) v(in[11]) v(in[12]) v(in[13]) v(in[14]) v(in[15])
+ v(in[16]) v(in[17]) v(in[18]) v(in[19]) v(in[20]) v(in[21]) v(in[22]) v(in[23])
+ v(in[24]) v(in[25]) v(in[26]) v(in[27]) v(in[28]) v(in[29]) v(in[30]) v(in[31])
+ v(in[32]) v(in[33]) v(in[34]) v(in[35]) v(in[36]) v(in[37]) v(in[38]) v(in[39])
+ v(in[40]) v(in[41]) v(in[42]) v(in[43]) v(in[44]) v(in[45]) v(in[46]) v(in[47])
+ v(in[48]) v(in[49]) v(in[50]) v(in[51]) v(in[52]) v(in[53]) v(in[54]) v(in[55])
+ v(in[56]) v(in[57]) v(in[58]) v(in[59]) v(in[60]) v(in[61]) v(in[62]) v(in[63])
+ v(in[64]) v(in[65]) v(in[66]) v(in[67]) v(in[68]) v(in[69]) v(in[70]) v(in[71])
+ v(in[72]) v(in[73]) v(in[74]) v(in[75]) v(in[76]) v(in[77]) v(in[78]) v(in[79])
+ v(in[80]) v(in[81]) v(in[82]) v(in[83]) v(in[84]) v(in[85]) v(in[86]) v(in[87])
+ v(in[88]) v(in[89]) v(in[90]) v(in[91]) v(in[92]) v(in[93]) v(in[94]) v(in[95])
+ v(in[96]) v(in[97]) v(in[98]) v(in[99]) v(in[100]) v(in[101]) v(in[102]) v(in[103])
+ v(in[104]) v(in[105]) v(in[106]) v(in[107]) v(in[108]) v(in[109]) v(in[110]) v(in[111])
+ v(in[112]) v(in[113]) v(in[114]) v(in[115]) v(in[116]) v(in[117]) v(in[118]) v(in[119])
+ v(in[120]) v(in[121]) v(in[122]) v(in[123]) v(in[124]) v(in[125]) v(in[126]) v(in[127])
.end
