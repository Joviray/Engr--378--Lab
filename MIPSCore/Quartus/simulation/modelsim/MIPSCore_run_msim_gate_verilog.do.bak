transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {MIPSCore_7_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+C:/Users/tsheaves/Documents/ENGR378/SP2020Final/MIPSCore/Quartus/../Testbenches {C:/Users/tsheaves/Documents/ENGR378/SP2020Final/MIPSCore/Quartus/../Testbenches/ROMtb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  tb_ROM

add wave *
view structure
view signals
run -all
