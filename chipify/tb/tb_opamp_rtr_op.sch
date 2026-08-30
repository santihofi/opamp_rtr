v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 650 70 650 90 {lab=vdd}
N 650 150 650 170 {lab=GND}
N 590 -90 600 -90 {lab=out}
N 440 -110 460 -110 {lab=in}
N 440 -70 460 -70 {lab=out}
N 510 -40 510 -20 {lab=GND}
N 530 -280 530 -260 {lab=vdd}
N 530 -200 530 -140 {lab=#net1}
N 330 -70 330 -50 {lab=#net2}
N 440 -70 440 20 {lab=out}
N 440 20 590 20 {lab=out}
N 590 -90 590 20 {lab=out}
N 580 -90 590 -90 {lab=out}
N 510 -170 510 -140 {lab=#net3}
N 460 -170 510 -170 {lab=#net3}
N 460 -190 460 -170 {lab=#net3}
N 330 -150 330 -130 {lab=in}
C {vsource.sym} 330 -20 0 0 {name=V1 value=\{\{vincm\}\} savecurrent=true}
C {gnd.sym} 330 10 0 0 {name=l19 lab=GND}
C {devices/code_shown.sym} 670 -210 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp \{\{ temp \}\}
.param mc_ok = \{\{ sigma \}\}
.option SEED = \{\{ seed \}\}
.option method=gear

.control
save all
save @n.x1.xxm1.nsg13_hv_pmos[gm]
save @n.x1.xxm6.nsg13_hv_nmos[gm]
op  
let vos = v(out)-v(in)
let idd = i(V3)
noise v(out) VIN dec 10 1 1MEG
quit
.endc
"}
C {gnd.sym} 510 -20 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 440 -110 0 0 {name=p8 sig_type=std_logic lab=in}
C {lab_pin.sym} 600 -90 2 0 {name=p28 sig_type=std_logic lab=out}
C {vsource.sym} 650 120 0 0 {name=V2 value=\{\{vdd\}\} savecurrent=false}
C {gnd.sym} 650 170 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 650 70 3 1 {name=p6 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 460 -250 3 1 {name=p1 sig_type=std_logic lab=vdd}
C {isource.sym} 530 -230 0 0 {name=I0 value=\{\{ibias\}\}}
C {lab_pin.sym} 530 -280 3 1 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 330 -150 1 0 {name=p3 sig_type=std_logic lab=in}
C {vsource.sym} 460 -220 0 0 {name=V3 value=0 savecurrent=true}
C {vsource.sym} 330 -100 0 0 {name=VIN value=ac 1 savecurrent=true}
C {simulator_commands_shown.sym} 130 80 0 0 {
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
C {../sch/opamp_rtr.sym} 480 -50 0 0 {name=x1}
