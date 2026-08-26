v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 -40 40 -20 {lab=GND}
N 220 -40 220 -20 {lab=#net1}
N 100 -20 100 0 {lab=#net1}
N 650 70 650 90 {lab=vdd}
N 650 150 650 170 {lab=GND}
N 580 -90 600 -90 {lab=out}
N 440 -110 460 -110 {lab=inp}
N 440 -70 460 -70 {lab=inn}
N 510 -40 510 -20 {lab=GND}
N 100 -20 220 -20 {lab=#net1}
N 100 -40 100 -20 {lab=#net1}
N 510 -160 510 -140 {lab=vdd}
N 530 -280 530 -260 {lab=vdd}
N 530 -200 530 -140 {lab=#net2}
C {vsource_arith.sym} 100 -70 0 0 {name=E1 VOL=v(vdin)/2}
C {lab_pin.sym} 100 -100 1 0 {name=p3 sig_type=std_logic lab=inp}
C {vsource_arith.sym} 220 -70 0 0 {name=E2 VOL=-v(vdin)/2}
C {lab_pin.sym} 220 -100 1 0 {name=p4 sig_type=std_logic lab=inn}
C {lab_pin.sym} 40 -100 1 0 {name=p5 sig_type=std_logic lab=vdin}
C {vsource.sym} 100 30 0 0 {name=V1 value=\{\{vincm\}\} savecurrent=true}
C {gnd.sym} 100 60 0 0 {name=l19 lab=GND}
C {gnd.sym} 40 -20 0 0 {name=l2 lab=GND}
C {devices/code_shown.sym} 680 -200 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp \{\{ temp \}\}
.param mc_ok = \{\{ sigma \}\}
.option SEED = \{\{ seed \}\}
.option method=gear

.control
save all
op  
quit
.endc
"}
C {simulator_commands_shown.sym} 170 120 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_\{\{ corner_mos \}\}
.lib cornerMOShv.lib mos_\{\{ corner_mos \}\}
"
      }
C {gnd.sym} 510 -20 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 440 -110 0 0 {name=p8 sig_type=std_logic lab=inp}
C {lab_pin.sym} 440 -70 0 0 {name=p11 sig_type=std_logic lab=inn}
C {lab_pin.sym} 600 -90 2 0 {name=p28 sig_type=std_logic lab=out}
C {vsource.sym} 650 120 0 0 {name=V2 value=\{\{vdd\}\} savecurrent=false}
C {gnd.sym} 650 170 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 650 70 3 1 {name=p6 sig_type=std_logic lab=vdd}
C {vsource.sym} 40 -70 2 0 {name=V4 value=0 savecurrent=true}
C {lab_pin.sym} 510 -160 3 1 {name=p1 sig_type=std_logic lab=vdd}
C {heichip/opamp_rtr/chipify/sch/opamp_rtr.sym} 480 -50 0 0 {name=x1}
C {isource.sym} 530 -230 0 0 {name=I0 value=\{\{ibias\}\}}
C {lab_pin.sym} 530 -280 3 1 {name=p2 sig_type=std_logic lab=vdd}
