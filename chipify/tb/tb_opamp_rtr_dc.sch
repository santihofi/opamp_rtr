v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 650 70 650 90 {lab=vdd}
N 650 150 650 170 {lab=GND}
N 590 -90 600 -90 {lab=out_dc}
N 440 -110 460 -110 {lab=in_dc}
N 440 -70 460 -70 {lab=out_dc}
N 510 -40 510 -20 {lab=GND}
N 510 -160 510 -140 {lab=vdd}
N 530 -280 530 -260 {lab=vdd}
N 530 -200 530 -140 {lab=#net1}
N 330 -70 330 -50 {lab=in_dc}
N 440 -70 440 20 {lab=out_dc}
N 440 20 590 20 {lab=out_dc}
N 590 -90 590 20 {lab=out_dc}
N 580 -90 590 -90 {lab=out_dc}
C {vsource.sym} 330 -20 0 0 {name=V1 value=\{\{vincm\}\} savecurrent=true}
C {gnd.sym} 330 10 0 0 {name=l19 lab=GND}
C {devices/code_shown.sym} 680 -200 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp \{\{ temp \}\}
.param mc_ok = \{\{ sigma \}\}
.option SEED = \{\{ seed \}\}
.option method=gear

.control
save all
op  
let vos = v(out_dc)-v(in_dc)
dc V1 0 \{\{vdd\}\} 10m
quit
.endc
"}
C {simulator_commands_shown.sym} 180 80 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_\{\{ corner_mos \}\}
.lib cornerMOShv.lib mos_\{\{ corner_mos \}\}
.lib cornerRES.lib res_\{\{ corner_res \}\}
.lib cornerCAP.lib cap_\{\{ corner_cap \}\}
"
      }
C {gnd.sym} 510 -20 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 440 -110 0 0 {name=p8 sig_type=std_logic lab=in_dc}
C {lab_pin.sym} 600 -90 2 0 {name=p28 sig_type=std_logic lab=out_dc}
C {vsource.sym} 650 120 0 0 {name=V2 value=\{\{vdd\}\} savecurrent=false}
C {gnd.sym} 650 170 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 650 70 3 1 {name=p6 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 510 -160 3 1 {name=p1 sig_type=std_logic lab=vdd}
C {isource.sym} 530 -230 0 0 {name=I0 value=\{\{ibias\}\}}
C {lab_pin.sym} 530 -280 3 1 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 330 -70 1 0 {name=p3 sig_type=std_logic lab=in_dc}
C {heichip/opamp_rtr/chipify/sch/opamp_rtr.sym} 480 -50 0 0 {name=x2}
