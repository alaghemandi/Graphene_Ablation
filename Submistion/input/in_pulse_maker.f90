program center
implicit none

integer:: i,j,k,natom,shomar,flag, typ,selected(10000)
real:: x,y,z,r,q
character:: chr

open(11,file="data.rdx",status="old")
open(23,file="in.reaxc.rdx_pulse")

read(11,*)
read(11,*)
read(11,*)natom

do i=1,15
read(11,*)
enddo

shomar=1
do i=1, natom
    read(11,*)j,typ,q,x,y,z
    r=sqrt(x**2 + y**2 + z**2)
    flag=1
    if (r <4.0) then
        selected(shomar)=i
        shomar=shomar+1
        flag=0
    endif
enddo

write(23,"(A)")"# ReaxFF potential for RDX system                                                 "
write(23,"(A)")"# this run is equivalent to reax/in.reax.rdx                                      "
write(23,"(A)")"units		real                                                                  "
write(23,"(A)")"atom_style	charge                                                                "
write(23,"(A)")"read_data	data.rdx                                                              "
write(23,"(A)")"pair_style      reax/c control.reax_c.rdx                                         "
write(23,"(A)")"pair_coeff      * * ffield.reax_2013  C                                           "
write(23,"(A13)",advance="no")"group hot id "
do i=1, (shomar-1)
    !write(23,*)selected(i)
    write(23,"(1i8.1)",advance="no")  selected(i)
enddo
write(23,*)" "
write(23,"(A)")"group		rest subtract all hot                                                 "
write(23,"(A)")"compute reax all pair reax/c                                                      "
write(23,"(A)")"neighbor	2.5 bin                                                               "
write(23,"(A)")"neigh_modify	every 10 delay 0 check no                                         "
write(23,"(A)")"velocity        hot create 10000.0 4928459 dist uniform #gaussian                 "
write(23,"(A)")"fix             1 rest nve                                                        "
write(23,"(A)")"fix             2 hot nvt temp 10000.0 10000.0 1.0                                "
write(23,"(A)")"fix             3 all qeq/reax 1 0.0 10.0 1.0e-12 reax/c                          "
write(23,"(A)")"compute 	myTemp1 rest temp                                                     "
write(23,"(A)")"compute 	myTemp2 hot temp                                                      "
write(23,"(A)")"thermo		10                                                                    "
write(23,"(A)")"thermo_style 	custom step temp epair etotal press vol c_myTemp1 c_myTemp2       "
write(23,"(A)")"timestep	0.1                                                                   "
write(23,"(A)")"fix             momen rest momentum 1 linear 1 1 1                                "
write(23,"(A)")"dump 		3 all custom 10 trj id q mass x y z                                   "
write(23,"(A)")"dump        4 all custom 10 trjvel id mass vx vy vz                               "
write(23,"(A)")"restart 	1000 x.restart                                                        "
write(23,"(A)")"run		1000                                                                      "
write(23,*)" "

end


