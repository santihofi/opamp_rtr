v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -290 -160 -290 -140 {lab=vdd}
N -290 -80 -290 -60 {lab=GND}
N 50 -100 70 -100 {lab=#net1}
N 120 -190 120 -170 {lab=vdd}
N 120 -70 120 -50 {lab=GND}
N 140 -310 140 -290 {lab=vdd}
N 140 -230 140 -170 {lab=#net2}
N 210 -120 210 -0 {lab=out}
N 190 -120 210 -120 {lab=out}
N 160 0 210 0 {lab=out}
N 50 0 100 -0 {lab=#net1}
N 50 -100 50 0 {lab=#net1}
N 300 -120 320 -120 {lab=out}
N -60 -140 70 -140 {lab=#net3}
N -60 -140 -60 -120 {lab=#net3}
N 50 0 50 20 {lab=#net1}
N 50 80 50 100 {lab=GND}
N 300 -160 300 -120 {lab=out}
N 210 -120 300 -120 {lab=out}
N 300 -160 390 -160 {lab=out}
N 270 -230 270 -200 {lab=vdd}
N 390 -230 420 -230 {lab=vdd}
N 420 -230 420 -200 {lab=vdd}
N 390 -230 390 -200 {lab=vdd}
N 360 -230 390 -230 {lab=vdd}
N 360 -230 360 -200 {lab=vdd}
N 340 -230 360 -230 {lab=vdd}
N 330 -230 330 -200 {lab=vdd}
N 300 -230 330 -230 {lab=vdd}
N 300 -230 300 -200 {lab=vdd}
N 270 -230 300 -230 {lab=vdd}
N 340 -260 340 -230 {lab=vdd}
N 330 -230 340 -230 {lab=vdd}
C {vsource.sym} -60 -30 0 0 {name=V1 value=\{\{vincm\}\} savecurrent=true}
C {devices/code_shown.sym} 570 -300 0 0 {name=NGSPICE only_toplevel=true 
value="
.temp \{\{ temp \}\}
.param mc_ok = \{\{ sigma \}\}
.option SEED= \{\{ seed \}\}
.control
save all
ac dec 10 1 1000000000k

let gainmag = mag(v(out))
let gain_db = db(v(out))
let phase_deg = 180/PI * ph(v(out))

meas ac gain max gain_db
meas ac bandwidth when gainmag=0.707*gain fall=1
meas ac UGF when gain_db=0 cross=1
meas ac Phase_at_UGF FIND phase_deg WHEN gain_db=0 cross=1
let phase_margin = 180 + Phase_at_UGF

quit
.endc
"}
C {lab_pin.sym} 120 -190 1 0 {name=p1 sig_type=std_logic lab=vdd}
C {gnd.sym} 120 -50 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 320 -120 2 0 {name=p25 sig_type=std_logic lab=out}
C {vsource.sym} -290 -110 0 0 {name=V2 value=\{\{vdd\}\} savecurrent=false}
C {gnd.sym} -290 -60 0 0 {name=l1 lab=GND}
C {lab_pin.sym} -290 -160 3 1 {name=p6 sig_type=std_logic lab=vdd}
C {vsource.sym} -60 -90 0 0 {name=VIN value=ac 1 savecurrent=true}
C {lab_pin.sym} 140 -310 3 1 {name=p2 sig_type=std_logic lab=vdd}
C {ind.sym} 130 0 1 0 {name=L2
m=1
value=1000000
footprint=1206
device=inductor}
C {gnd.sym} -60 0 0 0 {name=l3 lab=GND}
C {capa.sym} 520 140 2 0 {name=C2
m=1
value=\{\{c_load\}\}
footprint=1206
device="ceramic capacitor"
spice_ignore=true}
C {capa.sym} 50 50 0 0 {name=C1
m=1
value=1000000
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 50 100 0 0 {name=l6 lab=GND}
C {isource.sym} 140 -260 0 0 {name=I0 value=\{\{ibias\}\}}
C {lab_pin.sym} 340 -260 3 1 {name=p3 sig_type=std_logic lab=vdd}
C {simulator_commands_shown.sym} -410 70 0 0 {
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
C {heichip/opamp_rtr/chipify/sch/opamp_rtr.sym} 90 -80 0 0 {name=x2}
C {sg13g2_pr/sg13_hv_nmos.sym} 390 -180 3 0 {name=M3
l=10u
w=15u
 ng=4
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_hv_nmos.sym} 300 -180 3 0 {name=M1
l=10u
w=15u
 ng=4
 m=1
  mm_ok=1
 model=sg13_hv_nmos
spiceprefix=X
}
