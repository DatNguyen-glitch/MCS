
.subckt inverter in out VDD VSS
Mp  out  in  VDD  VDD  pmos_rvt  m=1
Mn  out  in  VSS  VSS  nmos_rvt  m=1
.ends

.subckt buffer VDD VSS in out
X_INV1 in in_b VDD VSS inverter
X_INV2 in_b out VDD VSS inverter
.ends

.param pre_sw=20
.subckt pre_charge BL BLB pre VDD
Mpcl BLB pre VDD x pmos_sram m=pre_sw
Mpc2 BL  pre VDD x pmos_sram m=pre_sw
Mpc3 BL  pre BLB x pmos_sram m=pre_sw
.ends pre_charge

.param pu_sa=40 pd_sa=30
.subckt SA_vol BL BLB sen_clk q qb VDD GND   
*cross_coupled latch
Mpr  q   qb  VDD  x  pmos_sram m=pu_sa
Mnr  q   qb  n_en x  nmos_sram m=pd_sa
Mpl  qb  q   VDD  x  pmos_sram m=pu_sa
Mnl  qb  q   n_en x  nmos_sram m=pd_sa
*nmos enable
Mne n_en sen_clk GND x  nmos_sram m=2*pd_sa
*isolation transistors
Mpir q  sen_clk BL   x  pmos_sram m=pu_sa
Mpil qb sen_clk BLB  x  pmos_sram m=pu_sa
.ends SA_vol

.subckt SA_vol_pre BL BLB sen_clk q qb VDD GND   
*cross_coupled latch
Mpr  q   qb  VDD  x  pmos_sram m=pu_sa
Mnr  q   qb  n_en x  nmos_sram m=pd_sa
Mpl  qb  q   VDD  x  pmos_sram m=pu_sa
Mnl  qb  q   n_en x  nmos_sram m=pd_sa
*nmos enable
Mne n_en sen_clk GND x  nmos_sram m=2*pd_sa
*isolation transistors
Mpir q  sen_clk BL   x  pmos_sram m=pu_sa
Mpil qb sen_clk BLB  x  pmos_sram m=pu_sa
X_pre q qb sen_clk VDD pre_charge
.ends SA_vol_pre

.SUBCKT SA_current_base VDD GND BL BLB dout dout_b SAE 
Mn0 node0 SAE GND GND nmos_sram L=2e-08 W=2.7e-08 nfin=1 
Mn1 node0 BL node1 GND nmos_sram L=2e-08 W=2.7e-08 nfin=1 
Mn2 node0 BLB node2 GND nmos_sram L=2e-08 W=2.7e-08 nfin=1 
Mn3 dout dout_b node1 GND nmos_sram L=2e-08 W=2.7e-08 nfin=1 
Mn4 dout_b dout node2 GND nmos_sram L=2e-08 W=2.7e-08 nfin=1 

Mp0 dout SAE VDD VDD pmos_sram L=2e-08 W=2.7e-08 nfin=1 
Mp1 dout dout_b VDD VDD pmos_sram L=2e-08 W=2.7e-08 nfin=1 
Mp2 dout_b dout VDD VDD pmos_sram L=2e-08 W=2.7e-08 nfin=1 
Mp3 dout_b SAE VDD VDD pmos_sram L=2e-08 W=2.7e-08 nfin=1  
.ends
