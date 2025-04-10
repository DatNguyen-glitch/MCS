.title Ex2 TESTBED_for_decoder_6to64

.protect 
.include '~/tech_file/7nm_TT.pm'
.include '~/tech_file/ASAP7_PDKandLIB_v1p5/asap7libs_24/cdl/lvs/asap7_75t_SRAM.cdl'
.include 'buffer.sp'
.unprotect

.include '../03_GATE/decoder_6to64_SYN_new.sp'

.vec 'input_vector.vec'

.global GND

.param v_dd = 0.7
.param prd = 1n
.param tr = 0.05n
.param tf = 0.05n

Vdd VDD GND DC=v_dd
v_clk clk gnd dc=0 pulse (0 v_dd 0 tr tf 0.5n 1n)

* Input buffer array 
X_buf_arr 
+ VDD GND
+ PATN[5] PATN[4] PATN[3] PATN[2] PATN[1] PATN[0]
+ X[5] X[4] X[3] X[2] X[1] X[0]
+ buffer_arr

* Decoder 6to64
x_decoder VDD GND clk
+ PATN[5] PATN[4] PATN[3] PATN[2] PATN[1] PATN[0]
+ wl[63] wl[62] wl[61] wl[60] wl[59] wl[58] wl[57] wl[56]
+ wl[55] wl[54] wl[53] wl[52] wl[51] wl[50] wl[49] wl[48]
+ wl[47] wl[46] wl[45] wl[44] wl[43] wl[42] wl[41] wl[40]
+ wl[39] wl[38] wl[37] wl[36] wl[35] wl[34] wl[33] wl[32]
+ wl[31] wl[30] wl[29] wl[28] wl[27] wl[26] wl[25] wl[24]
+ wl[23] wl[22] wl[21] wl[20] wl[19] wl[18] wl[17] wl[16]
+ wl[15] wl[14] wl[13] wl[12] wl[11] wl[10] wl[9] wl[8]
+ wl[7] wl[6] wl[5] wl[4] wl[3] wl[2] wl[1] wl[0]
+ decoder_6to64 

* Output Loading Cap
C_load0 wl[0] GND 12fF
C_load1 wl[1] GND 12fF
C_load2 wl[2] GND 12fF
C_load3 wl[3] GND 12fF
C_load4 wl[4] GND 12fF
C_load5 wl[5] GND 12fF
C_load6 wl[6] GND 12fF
C_load7 wl[7] GND 12fF
C_load8 wl[8] GND 12fF
C_load9 wl[9] GND 12fF
C_load10 wl[10] GND 12fF
C_load11 wl[11] GND 12fF
C_load12 wl[12] GND 12fF
C_load13 wl[13] GND 12fF
C_load14 wl[14] GND 12fF
C_load15 wl[15] GND 12fF
C_load16 wl[16] GND 12fF
C_load17 wl[17] GND 12fF
C_load18 wl[18] GND 12fF
C_load19 wl[19] GND 12fF
C_load20 wl[20] GND 12fF
C_load21 wl[21] GND 12fF
C_load22 wl[22] GND 12fF
C_load23 wl[23] GND 12fF
C_load24 wl[24] GND 12fF
C_load25 wl[25] GND 12fF
C_load26 wl[26] GND 12fF
C_load27 wl[27] GND 12fF
C_load28 wl[28] GND 12fF
C_load29 wl[29] GND 12fF
C_load30 wl[30] GND 12fF
C_load31 wl[31] GND 12fF
C_load32 wl[32] GND 12fF
C_load33 wl[33] GND 12fF
C_load34 wl[34] GND 12fF
C_load35 wl[35] GND 12fF
C_load36 wl[36] GND 12fF
C_load37 wl[37] GND 12fF
C_load38 wl[38] GND 12fF
C_load39 wl[39] GND 12fF
C_load40 wl[40] GND 12fF
C_load41 wl[41] GND 12fF
C_load42 wl[42] GND 12fF
C_load43 wl[43] GND 12fF
C_load44 wl[44] GND 12fF
C_load45 wl[45] GND 12fF
C_load46 wl[46] GND 12fF
C_load47 wl[47] GND 12fF
C_load48 wl[48] GND 12fF
C_load49 wl[49] GND 12fF
C_load50 wl[50] GND 12fF
C_load51 wl[51] GND 12fF
C_load52 wl[52] GND 12fF
C_load53 wl[53] GND 12fF
C_load54 wl[54] GND 12fF
C_load55 wl[55] GND 12fF
C_load56 wl[56] GND 12fF
C_load57 wl[57] GND 12fF
C_load58 wl[58] GND 12fF
C_load59 wl[59] GND 12fF
C_load60 wl[60] GND 12fF
C_load61 wl[61] GND 12fF
C_load62 wl[62] GND 12fF
C_load63 wl[63] GND 12fF


*.TRAN 1p 12n  
.TRAN 1p 60n  

.option post
.option probe
.option runlvl=3
.option measform=2
.probe tran v(*) level=1

* .meas TRAN P_MAX MAX p(X_compressor_1) from=0.5n to=55n
.meas TRAN P_AVG AVG p(x_decoder) from=0 to=60n
* .CHECK EDGE (PATN[0] RISE 0ns 3ns RISE) wl[1]
.MEASURE TRAN delay TRIG V(clk) VAL=0.35 RISE=3 TARG V(WL[1]) VAL=0.35 RISE=1

.option VCD
.LPRINT (0.31 0.32) v(PATN[5]) v(PATN[4]) v(PATN[3]) v(PATN[2]) v(PATN[1]) v(PATN[0])
+ v(wl[63]) v(wl[62]) v(wl[61]) v(wl[60]) v(wl[59]) v(wl[58]) v(wl[57]) v(wl[56])
+ v(wl[55]) v(wl[54]) v(wl[53]) v(wl[52]) v(wl[51]) v(wl[50]) v(wl[49]) v(wl[48])
+ v(wl[47]) v(wl[46]) v(wl[45]) v(wl[44]) v(wl[43]) v(wl[42]) v(wl[41]) v(wl[40])
+ v(wl[39]) v(wl[38]) v(wl[37]) v(wl[36]) v(wl[35]) v(wl[34]) v(wl[33]) v(wl[32])
+ v(wl[31]) v(wl[30]) v(wl[29]) v(wl[28]) v(wl[27]) v(wl[26]) v(wl[25]) v(wl[24])
+ v(wl[23]) v(wl[22]) v(wl[21]) v(wl[20]) v(wl[19]) v(wl[18]) v(wl[17]) v(wl[16])
+ v(wl[15]) v(wl[14]) v(wl[13]) v(wl[12]) v(wl[11]) v(wl[10]) v(wl[9]) v(wl[8])
+ v(wl[7]) v(wl[6]) v(wl[5]) v(wl[4]) v(wl[3]) v(wl[2]) v(wl[1]) v(wl[0])
+ v(clk) 

