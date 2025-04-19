
gen_128:
	cat spice/testbed_temp.sp > spice/testbed.sp
	python3 script/gen_ram.py 128
gen_512:
	cat spice/testbed_temp.sp > spice/testbed.sp
	python3 script/gen_ram.py 512
sim: spice/*
	mkdir -p sim
	hspice -i spice/testbed.sp -o sim/

