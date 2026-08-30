v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 650 70 650 90 {lab=vdd}
N 650 150 650 170 {lab=GND}
N 520 -80 540 -80 {lab=out}
N 360 -60 380 -60 {lab=out}
N 430 -30 430 -10 {lab=GND}
N 430 -150 430 -130 {lab=vdd}
N 450 -270 450 -250 {lab=vdd}
N 450 -190 450 -130 {lab=#net1}
N 520 -80 520 20 {lab=out}
N 500 -80 520 -80 {lab=out}
N 360 20 520 20 {lab=out}
N 360 -60 360 20 {lab=out}
N 280 -100 380 -100 {lab=vdin}
N 280 0 280 60 {lab=GND}
N 280 -100 280 -60 {lab=vdin}
N 520 20 520 40 {lab=out}
N 520 100 520 120 {lab=GND}
C {lab_pin.sym} 310 -100 1 0 {name=p5 sig_type=std_logic lab=vdin}
C {gnd.sym} 280 60 0 0 {name=l2 lab=GND}
C {devices/code_shown.sym} 710 -120 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp \{\{ temp \}\}
.param mc_ok = \{\{ sigma \}\}
.option SEED = \{\{ seed \}\}
.option method=gear

.control
save all
tran 10n 10u

quit
.endc
"}
C {vsource.sym} 650 120 0 0 {name=V2 value=\{\{vdd\}\} savecurrent=false}
C {gnd.sym} 650 170 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 650 70 3 1 {name=p6 sig_type=std_logic lab=vdd}
C {gnd.sym} 430 -10 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 540 -80 2 0 {name=p28 sig_type=std_logic lab=out}
C {lab_pin.sym} 430 -150 3 1 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 450 -270 3 1 {name=p2 sig_type=std_logic lab=vdd}
C {isource.sym} 450 -220 0 0 {name=I0 value=\{\{ibias\}\}}
C {vsource.sym} 280 -30 0 0 {name=V1 value="pwl 0 0.5 1u 0.5 1.000001u 2.8 3u 2.8 3.000001u 0.5 6u 0.5 6.000001u 1.65" savecurrent=false}
C {capa.sym} 520 70 2 0 {name=C2
m=1
value=\{\{c_load\}\}
footprint=1206
device="ceramic capacitor"
}
C {gnd.sym} 520 120 0 0 {name=l3 lab=GND}
C {simulator_commands_shown.sym} 80 190 0 0 {
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
C {heichip/opamp_rtr/chipify/sch/opamp_rtr.sym} 400 -40 0 0 {name=x2}
