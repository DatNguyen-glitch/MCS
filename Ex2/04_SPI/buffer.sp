
.subckt inverter in out VDD VSS
Mp  out  in  VDD  VDD  pmos_rvt  m=1
Mn  out  in  VSS  VSS  nmos_rvt  m=1
.ends

.subckt buffer in out VDD VSS 
X_INV1 in in_b VDD VSS inverter
X_INV2 in_b out VDD VSS inverter
.ends

.subckt buffer_arr 
+ VDD VSS
+ inp[5] inp[4] inp[3] inp[2] inp[1] inp[0]
+ out[5] out[4] out[3] out[2] out[1] out[0]

X_buf0 inp[0] out[0] VDD VSS buffer
X_buf1 inp[1] out[1] VDD VSS buffer
X_buf2 inp[2] out[2] VDD VSS buffer
X_buf3 inp[3] out[3] VDD VSS buffer
X_buf4 inp[4] out[4] VDD VSS buffer
X_buf5 inp[5] out[5] VDD VSS buffer
.ends
