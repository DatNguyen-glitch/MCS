.tile sense amplifier testbed

.inc "~/tech_file/7nm_TT.pm"
.inc "~/tech_file/ASAP7_PDKandLIB_v1p5/asap7libs_24/cdl/pex/asap7sc7p5t_24_SIMPLE_SRAM.sp"
.vec "vector_128.vec"

.CHECK GLOBAL_LEVEL (0.7 0 0.351 0.35)
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
X_SA_vol BL BLB clk dout dout_b VDD GND SA_vol
X_SA_current VDD GND BL BLB dout dout_b clk SA_current_base

*X_SA_vol_pre BL BLB clk dout dout_b VDD GND SA_vol_pre

.tran 1p 10n
.option probe
.option post
.probe tran v(*)
.option measout

.inc buffer.sp
.inc sram_6t.sp
.inc sram_arr128.sp
.inc sram_arr512.sp
.option VCD

.MEASURE TRAN avg_power_X_pre AVG P(X_Pre) FROM=0n TO=10n
.MEASURE TRAN avg_power_X_SA_current AVG P(X_SA_current) FROM=0n TO=10n
.MEASURE TRAN avg_power_X_SA_vol_pre AVG P(X_SA_vol_pre) FROM=0n TO=10n
.MEASURE TRAN avg_power_X_sram_arr0 AVG P(X_sram_arr0) FROM=0n TO=10n
*.MEASURE TRAN avg_power_X_SA_vol AVG P(X_SA_vol) FROM=0n TO=10n

.CHECK EDGE (clk RISE 20p 500p RISE) dout
.CHECK EDGE (clk RISE 20p 500p FALL) dout
.CHECK EDGE (clk FALL 20p 500p RISE) dout
.CHECK EDGE (clk FALL 20p 500p FALL) dout
.CHECK EDGE (clk RISE 20p 500p RISE) dout_b
.CHECK EDGE (clk RISE 20p 500p FALL) dout_b
.CHECK EDGE (clk FALL 20p 500p RISE) dout_b
.CHECK EDGE (clk FALL 20p 500p FALL) dout_b


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
+ wl[128] wl[129] wl[130] wl[131] wl[132] wl[133] wl[134] wl[135]
+ wl[136] wl[137] wl[138] wl[139] wl[140] wl[141] wl[142] wl[143]
+ wl[144] wl[145] wl[146] wl[147] wl[148] wl[149] wl[150] wl[151]
+ wl[152] wl[153] wl[154] wl[155] wl[156] wl[157] wl[158] wl[159]
+ wl[160] wl[161] wl[162] wl[163] wl[164] wl[165] wl[166] wl[167]
+ wl[168] wl[169] wl[170] wl[171] wl[172] wl[173] wl[174] wl[175]
+ wl[176] wl[177] wl[178] wl[179] wl[180] wl[181] wl[182] wl[183]
+ wl[184] wl[185] wl[186] wl[187] wl[188] wl[189] wl[190] wl[191]
+ wl[192] wl[193] wl[194] wl[195] wl[196] wl[197] wl[198] wl[199]
+ wl[200] wl[201] wl[202] wl[203] wl[204] wl[205] wl[206] wl[207]
+ wl[208] wl[209] wl[210] wl[211] wl[212] wl[213] wl[214] wl[215]
+ wl[216] wl[217] wl[218] wl[219] wl[220] wl[221] wl[222] wl[223]
+ wl[224] wl[225] wl[226] wl[227] wl[228] wl[229] wl[230] wl[231]
+ wl[232] wl[233] wl[234] wl[235] wl[236] wl[237] wl[238] wl[239]
+ wl[240] wl[241] wl[242] wl[243] wl[244] wl[245] wl[246] wl[247]
+ wl[248] wl[249] wl[250] wl[251] wl[252] wl[253] wl[254] wl[255]
+ wl[256] wl[257] wl[258] wl[259] wl[260] wl[261] wl[262] wl[263]
+ wl[264] wl[265] wl[266] wl[267] wl[268] wl[269] wl[270] wl[271]
+ wl[272] wl[273] wl[274] wl[275] wl[276] wl[277] wl[278] wl[279]
+ wl[280] wl[281] wl[282] wl[283] wl[284] wl[285] wl[286] wl[287]
+ wl[288] wl[289] wl[290] wl[291] wl[292] wl[293] wl[294] wl[295]
+ wl[296] wl[297] wl[298] wl[299] wl[300] wl[301] wl[302] wl[303]
+ wl[304] wl[305] wl[306] wl[307] wl[308] wl[309] wl[310] wl[311]
+ wl[312] wl[313] wl[314] wl[315] wl[316] wl[317] wl[318] wl[319]
+ wl[320] wl[321] wl[322] wl[323] wl[324] wl[325] wl[326] wl[327]
+ wl[328] wl[329] wl[330] wl[331] wl[332] wl[333] wl[334] wl[335]
+ wl[336] wl[337] wl[338] wl[339] wl[340] wl[341] wl[342] wl[343]
+ wl[344] wl[345] wl[346] wl[347] wl[348] wl[349] wl[350] wl[351]
+ wl[352] wl[353] wl[354] wl[355] wl[356] wl[357] wl[358] wl[359]
+ wl[360] wl[361] wl[362] wl[363] wl[364] wl[365] wl[366] wl[367]
+ wl[368] wl[369] wl[370] wl[371] wl[372] wl[373] wl[374] wl[375]
+ wl[376] wl[377] wl[378] wl[379] wl[380] wl[381] wl[382] wl[383]
+ wl[384] wl[385] wl[386] wl[387] wl[388] wl[389] wl[390] wl[391]
+ wl[392] wl[393] wl[394] wl[395] wl[396] wl[397] wl[398] wl[399]
+ wl[400] wl[401] wl[402] wl[403] wl[404] wl[405] wl[406] wl[407]
+ wl[408] wl[409] wl[410] wl[411] wl[412] wl[413] wl[414] wl[415]
+ wl[416] wl[417] wl[418] wl[419] wl[420] wl[421] wl[422] wl[423]
+ wl[424] wl[425] wl[426] wl[427] wl[428] wl[429] wl[430] wl[431]
+ wl[432] wl[433] wl[434] wl[435] wl[436] wl[437] wl[438] wl[439]
+ wl[440] wl[441] wl[442] wl[443] wl[444] wl[445] wl[446] wl[447]
+ wl[448] wl[449] wl[450] wl[451] wl[452] wl[453] wl[454] wl[455]
+ wl[456] wl[457] wl[458] wl[459] wl[460] wl[461] wl[462] wl[463]
+ wl[464] wl[465] wl[466] wl[467] wl[468] wl[469] wl[470] wl[471]
+ wl[472] wl[473] wl[474] wl[475] wl[476] wl[477] wl[478] wl[479]
+ wl[480] wl[481] wl[482] wl[483] wl[484] wl[485] wl[486] wl[487]
+ wl[488] wl[489] wl[490] wl[491] wl[492] wl[493] wl[494] wl[495]
+ wl[496] wl[497] wl[498] wl[499] wl[500] wl[501] wl[502] wl[503]
+ wl[504] wl[505] wl[506] wl[507] wl[508] wl[509] wl[510] wl[511]
+ sram_arr512
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
+ in[128] in[129] in[130] in[131] in[132] in[133] in[134] in[135]
+ in[136] in[137] in[138] in[139] in[140] in[141] in[142] in[143]
+ in[144] in[145] in[146] in[147] in[148] in[149] in[150] in[151]
+ in[152] in[153] in[154] in[155] in[156] in[157] in[158] in[159]
+ in[160] in[161] in[162] in[163] in[164] in[165] in[166] in[167]
+ in[168] in[169] in[170] in[171] in[172] in[173] in[174] in[175]
+ in[176] in[177] in[178] in[179] in[180] in[181] in[182] in[183]
+ in[184] in[185] in[186] in[187] in[188] in[189] in[190] in[191]
+ in[192] in[193] in[194] in[195] in[196] in[197] in[198] in[199]
+ in[200] in[201] in[202] in[203] in[204] in[205] in[206] in[207]
+ in[208] in[209] in[210] in[211] in[212] in[213] in[214] in[215]
+ in[216] in[217] in[218] in[219] in[220] in[221] in[222] in[223]
+ in[224] in[225] in[226] in[227] in[228] in[229] in[230] in[231]
+ in[232] in[233] in[234] in[235] in[236] in[237] in[238] in[239]
+ in[240] in[241] in[242] in[243] in[244] in[245] in[246] in[247]
+ in[248] in[249] in[250] in[251] in[252] in[253] in[254] in[255]
+ in[256] in[257] in[258] in[259] in[260] in[261] in[262] in[263]
+ in[264] in[265] in[266] in[267] in[268] in[269] in[270] in[271]
+ in[272] in[273] in[274] in[275] in[276] in[277] in[278] in[279]
+ in[280] in[281] in[282] in[283] in[284] in[285] in[286] in[287]
+ in[288] in[289] in[290] in[291] in[292] in[293] in[294] in[295]
+ in[296] in[297] in[298] in[299] in[300] in[301] in[302] in[303]
+ in[304] in[305] in[306] in[307] in[308] in[309] in[310] in[311]
+ in[312] in[313] in[314] in[315] in[316] in[317] in[318] in[319]
+ in[320] in[321] in[322] in[323] in[324] in[325] in[326] in[327]
+ in[328] in[329] in[330] in[331] in[332] in[333] in[334] in[335]
+ in[336] in[337] in[338] in[339] in[340] in[341] in[342] in[343]
+ in[344] in[345] in[346] in[347] in[348] in[349] in[350] in[351]
+ in[352] in[353] in[354] in[355] in[356] in[357] in[358] in[359]
+ in[360] in[361] in[362] in[363] in[364] in[365] in[366] in[367]
+ in[368] in[369] in[370] in[371] in[372] in[373] in[374] in[375]
+ in[376] in[377] in[378] in[379] in[380] in[381] in[382] in[383]
+ in[384] in[385] in[386] in[387] in[388] in[389] in[390] in[391]
+ in[392] in[393] in[394] in[395] in[396] in[397] in[398] in[399]
+ in[400] in[401] in[402] in[403] in[404] in[405] in[406] in[407]
+ in[408] in[409] in[410] in[411] in[412] in[413] in[414] in[415]
+ in[416] in[417] in[418] in[419] in[420] in[421] in[422] in[423]
+ in[424] in[425] in[426] in[427] in[428] in[429] in[430] in[431]
+ in[432] in[433] in[434] in[435] in[436] in[437] in[438] in[439]
+ in[440] in[441] in[442] in[443] in[444] in[445] in[446] in[447]
+ in[448] in[449] in[450] in[451] in[452] in[453] in[454] in[455]
+ in[456] in[457] in[458] in[459] in[460] in[461] in[462] in[463]
+ in[464] in[465] in[466] in[467] in[468] in[469] in[470] in[471]
+ in[472] in[473] in[474] in[475] in[476] in[477] in[478] in[479]
+ in[480] in[481] in[482] in[483] in[484] in[485] in[486] in[487]
+ in[488] in[489] in[490] in[491] in[492] in[493] in[494] in[495]
+ in[496] in[497] in[498] in[499] in[500] in[501] in[502] in[503]
+ in[504] in[505] in[506] in[507] in[508] in[509] in[510] in[511]
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
+ wl[128] wl[129] wl[130] wl[131] wl[132] wl[133] wl[134] wl[135]
+ wl[136] wl[137] wl[138] wl[139] wl[140] wl[141] wl[142] wl[143]
+ wl[144] wl[145] wl[146] wl[147] wl[148] wl[149] wl[150] wl[151]
+ wl[152] wl[153] wl[154] wl[155] wl[156] wl[157] wl[158] wl[159]
+ wl[160] wl[161] wl[162] wl[163] wl[164] wl[165] wl[166] wl[167]
+ wl[168] wl[169] wl[170] wl[171] wl[172] wl[173] wl[174] wl[175]
+ wl[176] wl[177] wl[178] wl[179] wl[180] wl[181] wl[182] wl[183]
+ wl[184] wl[185] wl[186] wl[187] wl[188] wl[189] wl[190] wl[191]
+ wl[192] wl[193] wl[194] wl[195] wl[196] wl[197] wl[198] wl[199]
+ wl[200] wl[201] wl[202] wl[203] wl[204] wl[205] wl[206] wl[207]
+ wl[208] wl[209] wl[210] wl[211] wl[212] wl[213] wl[214] wl[215]
+ wl[216] wl[217] wl[218] wl[219] wl[220] wl[221] wl[222] wl[223]
+ wl[224] wl[225] wl[226] wl[227] wl[228] wl[229] wl[230] wl[231]
+ wl[232] wl[233] wl[234] wl[235] wl[236] wl[237] wl[238] wl[239]
+ wl[240] wl[241] wl[242] wl[243] wl[244] wl[245] wl[246] wl[247]
+ wl[248] wl[249] wl[250] wl[251] wl[252] wl[253] wl[254] wl[255]
+ wl[256] wl[257] wl[258] wl[259] wl[260] wl[261] wl[262] wl[263]
+ wl[264] wl[265] wl[266] wl[267] wl[268] wl[269] wl[270] wl[271]
+ wl[272] wl[273] wl[274] wl[275] wl[276] wl[277] wl[278] wl[279]
+ wl[280] wl[281] wl[282] wl[283] wl[284] wl[285] wl[286] wl[287]
+ wl[288] wl[289] wl[290] wl[291] wl[292] wl[293] wl[294] wl[295]
+ wl[296] wl[297] wl[298] wl[299] wl[300] wl[301] wl[302] wl[303]
+ wl[304] wl[305] wl[306] wl[307] wl[308] wl[309] wl[310] wl[311]
+ wl[312] wl[313] wl[314] wl[315] wl[316] wl[317] wl[318] wl[319]
+ wl[320] wl[321] wl[322] wl[323] wl[324] wl[325] wl[326] wl[327]
+ wl[328] wl[329] wl[330] wl[331] wl[332] wl[333] wl[334] wl[335]
+ wl[336] wl[337] wl[338] wl[339] wl[340] wl[341] wl[342] wl[343]
+ wl[344] wl[345] wl[346] wl[347] wl[348] wl[349] wl[350] wl[351]
+ wl[352] wl[353] wl[354] wl[355] wl[356] wl[357] wl[358] wl[359]
+ wl[360] wl[361] wl[362] wl[363] wl[364] wl[365] wl[366] wl[367]
+ wl[368] wl[369] wl[370] wl[371] wl[372] wl[373] wl[374] wl[375]
+ wl[376] wl[377] wl[378] wl[379] wl[380] wl[381] wl[382] wl[383]
+ wl[384] wl[385] wl[386] wl[387] wl[388] wl[389] wl[390] wl[391]
+ wl[392] wl[393] wl[394] wl[395] wl[396] wl[397] wl[398] wl[399]
+ wl[400] wl[401] wl[402] wl[403] wl[404] wl[405] wl[406] wl[407]
+ wl[408] wl[409] wl[410] wl[411] wl[412] wl[413] wl[414] wl[415]
+ wl[416] wl[417] wl[418] wl[419] wl[420] wl[421] wl[422] wl[423]
+ wl[424] wl[425] wl[426] wl[427] wl[428] wl[429] wl[430] wl[431]
+ wl[432] wl[433] wl[434] wl[435] wl[436] wl[437] wl[438] wl[439]
+ wl[440] wl[441] wl[442] wl[443] wl[444] wl[445] wl[446] wl[447]
+ wl[448] wl[449] wl[450] wl[451] wl[452] wl[453] wl[454] wl[455]
+ wl[456] wl[457] wl[458] wl[459] wl[460] wl[461] wl[462] wl[463]
+ wl[464] wl[465] wl[466] wl[467] wl[468] wl[469] wl[470] wl[471]
+ wl[472] wl[473] wl[474] wl[475] wl[476] wl[477] wl[478] wl[479]
+ wl[480] wl[481] wl[482] wl[483] wl[484] wl[485] wl[486] wl[487]
+ wl[488] wl[489] wl[490] wl[491] wl[492] wl[493] wl[494] wl[495]
+ wl[496] wl[497] wl[498] wl[499] wl[500] wl[501] wl[502] wl[503]
+ wl[504] wl[505] wl[506] wl[507] wl[508] wl[509] wl[510] wl[511]
+ buffer_arr512
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
+ v(wl[128]) v(wl[129]) v(wl[130]) v(wl[131]) v(wl[132]) v(wl[133]) v(wl[134]) v(wl[135])
+ v(wl[136]) v(wl[137]) v(wl[138]) v(wl[139]) v(wl[140]) v(wl[141]) v(wl[142]) v(wl[143])
+ v(wl[144]) v(wl[145]) v(wl[146]) v(wl[147]) v(wl[148]) v(wl[149]) v(wl[150]) v(wl[151])
+ v(wl[152]) v(wl[153]) v(wl[154]) v(wl[155]) v(wl[156]) v(wl[157]) v(wl[158]) v(wl[159])
+ v(wl[160]) v(wl[161]) v(wl[162]) v(wl[163]) v(wl[164]) v(wl[165]) v(wl[166]) v(wl[167])
+ v(wl[168]) v(wl[169]) v(wl[170]) v(wl[171]) v(wl[172]) v(wl[173]) v(wl[174]) v(wl[175])
+ v(wl[176]) v(wl[177]) v(wl[178]) v(wl[179]) v(wl[180]) v(wl[181]) v(wl[182]) v(wl[183])
+ v(wl[184]) v(wl[185]) v(wl[186]) v(wl[187]) v(wl[188]) v(wl[189]) v(wl[190]) v(wl[191])
+ v(wl[192]) v(wl[193]) v(wl[194]) v(wl[195]) v(wl[196]) v(wl[197]) v(wl[198]) v(wl[199])
+ v(wl[200]) v(wl[201]) v(wl[202]) v(wl[203]) v(wl[204]) v(wl[205]) v(wl[206]) v(wl[207])
+ v(wl[208]) v(wl[209]) v(wl[210]) v(wl[211]) v(wl[212]) v(wl[213]) v(wl[214]) v(wl[215])
+ v(wl[216]) v(wl[217]) v(wl[218]) v(wl[219]) v(wl[220]) v(wl[221]) v(wl[222]) v(wl[223])
+ v(wl[224]) v(wl[225]) v(wl[226]) v(wl[227]) v(wl[228]) v(wl[229]) v(wl[230]) v(wl[231])
+ v(wl[232]) v(wl[233]) v(wl[234]) v(wl[235]) v(wl[236]) v(wl[237]) v(wl[238]) v(wl[239])
+ v(wl[240]) v(wl[241]) v(wl[242]) v(wl[243]) v(wl[244]) v(wl[245]) v(wl[246]) v(wl[247])
+ v(wl[248]) v(wl[249]) v(wl[250]) v(wl[251]) v(wl[252]) v(wl[253]) v(wl[254]) v(wl[255])
+ v(wl[256]) v(wl[257]) v(wl[258]) v(wl[259]) v(wl[260]) v(wl[261]) v(wl[262]) v(wl[263])
+ v(wl[264]) v(wl[265]) v(wl[266]) v(wl[267]) v(wl[268]) v(wl[269]) v(wl[270]) v(wl[271])
+ v(wl[272]) v(wl[273]) v(wl[274]) v(wl[275]) v(wl[276]) v(wl[277]) v(wl[278]) v(wl[279])
+ v(wl[280]) v(wl[281]) v(wl[282]) v(wl[283]) v(wl[284]) v(wl[285]) v(wl[286]) v(wl[287])
+ v(wl[288]) v(wl[289]) v(wl[290]) v(wl[291]) v(wl[292]) v(wl[293]) v(wl[294]) v(wl[295])
+ v(wl[296]) v(wl[297]) v(wl[298]) v(wl[299]) v(wl[300]) v(wl[301]) v(wl[302]) v(wl[303])
+ v(wl[304]) v(wl[305]) v(wl[306]) v(wl[307]) v(wl[308]) v(wl[309]) v(wl[310]) v(wl[311])
+ v(wl[312]) v(wl[313]) v(wl[314]) v(wl[315]) v(wl[316]) v(wl[317]) v(wl[318]) v(wl[319])
+ v(wl[320]) v(wl[321]) v(wl[322]) v(wl[323]) v(wl[324]) v(wl[325]) v(wl[326]) v(wl[327])
+ v(wl[328]) v(wl[329]) v(wl[330]) v(wl[331]) v(wl[332]) v(wl[333]) v(wl[334]) v(wl[335])
+ v(wl[336]) v(wl[337]) v(wl[338]) v(wl[339]) v(wl[340]) v(wl[341]) v(wl[342]) v(wl[343])
+ v(wl[344]) v(wl[345]) v(wl[346]) v(wl[347]) v(wl[348]) v(wl[349]) v(wl[350]) v(wl[351])
+ v(wl[352]) v(wl[353]) v(wl[354]) v(wl[355]) v(wl[356]) v(wl[357]) v(wl[358]) v(wl[359])
+ v(wl[360]) v(wl[361]) v(wl[362]) v(wl[363]) v(wl[364]) v(wl[365]) v(wl[366]) v(wl[367])
+ v(wl[368]) v(wl[369]) v(wl[370]) v(wl[371]) v(wl[372]) v(wl[373]) v(wl[374]) v(wl[375])
+ v(wl[376]) v(wl[377]) v(wl[378]) v(wl[379]) v(wl[380]) v(wl[381]) v(wl[382]) v(wl[383])
+ v(wl[384]) v(wl[385]) v(wl[386]) v(wl[387]) v(wl[388]) v(wl[389]) v(wl[390]) v(wl[391])
+ v(wl[392]) v(wl[393]) v(wl[394]) v(wl[395]) v(wl[396]) v(wl[397]) v(wl[398]) v(wl[399])
+ v(wl[400]) v(wl[401]) v(wl[402]) v(wl[403]) v(wl[404]) v(wl[405]) v(wl[406]) v(wl[407])
+ v(wl[408]) v(wl[409]) v(wl[410]) v(wl[411]) v(wl[412]) v(wl[413]) v(wl[414]) v(wl[415])
+ v(wl[416]) v(wl[417]) v(wl[418]) v(wl[419]) v(wl[420]) v(wl[421]) v(wl[422]) v(wl[423])
+ v(wl[424]) v(wl[425]) v(wl[426]) v(wl[427]) v(wl[428]) v(wl[429]) v(wl[430]) v(wl[431])
+ v(wl[432]) v(wl[433]) v(wl[434]) v(wl[435]) v(wl[436]) v(wl[437]) v(wl[438]) v(wl[439])
+ v(wl[440]) v(wl[441]) v(wl[442]) v(wl[443]) v(wl[444]) v(wl[445]) v(wl[446]) v(wl[447])
+ v(wl[448]) v(wl[449]) v(wl[450]) v(wl[451]) v(wl[452]) v(wl[453]) v(wl[454]) v(wl[455])
+ v(wl[456]) v(wl[457]) v(wl[458]) v(wl[459]) v(wl[460]) v(wl[461]) v(wl[462]) v(wl[463])
+ v(wl[464]) v(wl[465]) v(wl[466]) v(wl[467]) v(wl[468]) v(wl[469]) v(wl[470]) v(wl[471])
+ v(wl[472]) v(wl[473]) v(wl[474]) v(wl[475]) v(wl[476]) v(wl[477]) v(wl[478]) v(wl[479])
+ v(wl[480]) v(wl[481]) v(wl[482]) v(wl[483]) v(wl[484]) v(wl[485]) v(wl[486]) v(wl[487])
+ v(wl[488]) v(wl[489]) v(wl[490]) v(wl[491]) v(wl[492]) v(wl[493]) v(wl[494]) v(wl[495])
+ v(wl[496]) v(wl[497]) v(wl[498]) v(wl[499]) v(wl[500]) v(wl[501]) v(wl[502]) v(wl[503])
+ v(wl[504]) v(wl[505]) v(wl[506]) v(wl[507]) v(wl[508]) v(wl[509]) v(wl[510]) v(wl[511])
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
+ v(in[128]) v(in[129]) v(in[130]) v(in[131]) v(in[132]) v(in[133]) v(in[134]) v(in[135])
+ v(in[136]) v(in[137]) v(in[138]) v(in[139]) v(in[140]) v(in[141]) v(in[142]) v(in[143])
+ v(in[144]) v(in[145]) v(in[146]) v(in[147]) v(in[148]) v(in[149]) v(in[150]) v(in[151])
+ v(in[152]) v(in[153]) v(in[154]) v(in[155]) v(in[156]) v(in[157]) v(in[158]) v(in[159])
+ v(in[160]) v(in[161]) v(in[162]) v(in[163]) v(in[164]) v(in[165]) v(in[166]) v(in[167])
+ v(in[168]) v(in[169]) v(in[170]) v(in[171]) v(in[172]) v(in[173]) v(in[174]) v(in[175])
+ v(in[176]) v(in[177]) v(in[178]) v(in[179]) v(in[180]) v(in[181]) v(in[182]) v(in[183])
+ v(in[184]) v(in[185]) v(in[186]) v(in[187]) v(in[188]) v(in[189]) v(in[190]) v(in[191])
+ v(in[192]) v(in[193]) v(in[194]) v(in[195]) v(in[196]) v(in[197]) v(in[198]) v(in[199])
+ v(in[200]) v(in[201]) v(in[202]) v(in[203]) v(in[204]) v(in[205]) v(in[206]) v(in[207])
+ v(in[208]) v(in[209]) v(in[210]) v(in[211]) v(in[212]) v(in[213]) v(in[214]) v(in[215])
+ v(in[216]) v(in[217]) v(in[218]) v(in[219]) v(in[220]) v(in[221]) v(in[222]) v(in[223])
+ v(in[224]) v(in[225]) v(in[226]) v(in[227]) v(in[228]) v(in[229]) v(in[230]) v(in[231])
+ v(in[232]) v(in[233]) v(in[234]) v(in[235]) v(in[236]) v(in[237]) v(in[238]) v(in[239])
+ v(in[240]) v(in[241]) v(in[242]) v(in[243]) v(in[244]) v(in[245]) v(in[246]) v(in[247])
+ v(in[248]) v(in[249]) v(in[250]) v(in[251]) v(in[252]) v(in[253]) v(in[254]) v(in[255])
+ v(in[256]) v(in[257]) v(in[258]) v(in[259]) v(in[260]) v(in[261]) v(in[262]) v(in[263])
+ v(in[264]) v(in[265]) v(in[266]) v(in[267]) v(in[268]) v(in[269]) v(in[270]) v(in[271])
+ v(in[272]) v(in[273]) v(in[274]) v(in[275]) v(in[276]) v(in[277]) v(in[278]) v(in[279])
+ v(in[280]) v(in[281]) v(in[282]) v(in[283]) v(in[284]) v(in[285]) v(in[286]) v(in[287])
+ v(in[288]) v(in[289]) v(in[290]) v(in[291]) v(in[292]) v(in[293]) v(in[294]) v(in[295])
+ v(in[296]) v(in[297]) v(in[298]) v(in[299]) v(in[300]) v(in[301]) v(in[302]) v(in[303])
+ v(in[304]) v(in[305]) v(in[306]) v(in[307]) v(in[308]) v(in[309]) v(in[310]) v(in[311])
+ v(in[312]) v(in[313]) v(in[314]) v(in[315]) v(in[316]) v(in[317]) v(in[318]) v(in[319])
+ v(in[320]) v(in[321]) v(in[322]) v(in[323]) v(in[324]) v(in[325]) v(in[326]) v(in[327])
+ v(in[328]) v(in[329]) v(in[330]) v(in[331]) v(in[332]) v(in[333]) v(in[334]) v(in[335])
+ v(in[336]) v(in[337]) v(in[338]) v(in[339]) v(in[340]) v(in[341]) v(in[342]) v(in[343])
+ v(in[344]) v(in[345]) v(in[346]) v(in[347]) v(in[348]) v(in[349]) v(in[350]) v(in[351])
+ v(in[352]) v(in[353]) v(in[354]) v(in[355]) v(in[356]) v(in[357]) v(in[358]) v(in[359])
+ v(in[360]) v(in[361]) v(in[362]) v(in[363]) v(in[364]) v(in[365]) v(in[366]) v(in[367])
+ v(in[368]) v(in[369]) v(in[370]) v(in[371]) v(in[372]) v(in[373]) v(in[374]) v(in[375])
+ v(in[376]) v(in[377]) v(in[378]) v(in[379]) v(in[380]) v(in[381]) v(in[382]) v(in[383])
+ v(in[384]) v(in[385]) v(in[386]) v(in[387]) v(in[388]) v(in[389]) v(in[390]) v(in[391])
+ v(in[392]) v(in[393]) v(in[394]) v(in[395]) v(in[396]) v(in[397]) v(in[398]) v(in[399])
+ v(in[400]) v(in[401]) v(in[402]) v(in[403]) v(in[404]) v(in[405]) v(in[406]) v(in[407])
+ v(in[408]) v(in[409]) v(in[410]) v(in[411]) v(in[412]) v(in[413]) v(in[414]) v(in[415])
+ v(in[416]) v(in[417]) v(in[418]) v(in[419]) v(in[420]) v(in[421]) v(in[422]) v(in[423])
+ v(in[424]) v(in[425]) v(in[426]) v(in[427]) v(in[428]) v(in[429]) v(in[430]) v(in[431])
+ v(in[432]) v(in[433]) v(in[434]) v(in[435]) v(in[436]) v(in[437]) v(in[438]) v(in[439])
+ v(in[440]) v(in[441]) v(in[442]) v(in[443]) v(in[444]) v(in[445]) v(in[446]) v(in[447])
+ v(in[448]) v(in[449]) v(in[450]) v(in[451]) v(in[452]) v(in[453]) v(in[454]) v(in[455])
+ v(in[456]) v(in[457]) v(in[458]) v(in[459]) v(in[460]) v(in[461]) v(in[462]) v(in[463])
+ v(in[464]) v(in[465]) v(in[466]) v(in[467]) v(in[468]) v(in[469]) v(in[470]) v(in[471])
+ v(in[472]) v(in[473]) v(in[474]) v(in[475]) v(in[476]) v(in[477]) v(in[478]) v(in[479])
+ v(in[480]) v(in[481]) v(in[482]) v(in[483]) v(in[484]) v(in[485]) v(in[486]) v(in[487])
+ v(in[488]) v(in[489]) v(in[490]) v(in[491]) v(in[492]) v(in[493]) v(in[494]) v(in[495])
+ v(in[496]) v(in[497]) v(in[498]) v(in[499]) v(in[500]) v(in[501]) v(in[502]) v(in[503])
+ v(in[504]) v(in[505]) v(in[506]) v(in[507]) v(in[508]) v(in[509]) v(in[510]) v(in[511])
.end