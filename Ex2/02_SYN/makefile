#dc_shell-t -f syn.tcl | tee syn.log

syn:
	/usr/cad/synopsys/synthesis/2019.03-sp1-1/amd64/syn/bin/dc_shell -f syn.tcl | tee syn.log
	#dc_shell-t -f syn.tcl | tee syn.log
clean:
	rm -rf INCA_libs nWaveLog 
	rm -rf *.fsdb 
	rm -rf *.log 
	rm -rf *~ 
	rm -rf ./Netlist/*.* 
	rm -rf ./Report/*.* 
	rm -rf dwsvf* 
	rm -rf alib* 
	rm -rf default.svf 
	rm -rf alib-52 
	rm -rf *-verilog.* 
	rm -rf *.mr
	rm -rf diff_syn
	rm -rf *.txt
