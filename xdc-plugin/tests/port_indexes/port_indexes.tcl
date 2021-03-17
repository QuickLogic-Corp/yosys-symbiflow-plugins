yosys -import
if { [info procs get_ports] == {} } { plugin -i design_introspection }
if { [info procs read_xdc] == {} } { plugin -i xdc }
yosys -import  ;# ingest plugin commands

read_verilog $::env(DESIGN_TOP).v

# -flatten is used to ensure that the output eblif has only one module.
# Some of symbiflow expects eblifs with only one module.
synth_xilinx -flatten -abc9 -nosrl -noclkbuf -nodsp

if {[info procs unknown] != ""} {
	rename unknown ""
}
proc unknown args {return "'unknown' proc command handler"}
set fp [open [test_output_path "port_indexes.txt"] "w"]
if {[catch {invalid command} result]} {
	close $fp
	error "Command should be handled by the 'unknown' proc"
} else {
	puts $fp $result
}
#Read the design constraints
read_xdc -part_json [file dirname [info script]]/../xc7a35tcsg324-1.json $::env(DESIGN_TOP).xdc

if {[catch {invalid command} result]} {
	close $fp
	error "Command should be handled by the 'unknown' proc"
} else {
	puts $fp $result
}
close $fp

# Write the design in JSON format.
write_json [test_output_path "port_indexes.json"]
