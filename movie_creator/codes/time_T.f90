program frame_creater
implicit none

integer::  i,j,k, iostatus
!real:: step,total_energy,poten_energy,kin_energy,temp,targ,volume,press,targe
real:: Step, Temp, E_pair, TotEng, Press, eb, ea, elp, emol, ev, epen, ecoa
real:: ehb, et, eco, ew, ep, efi, eqeq
real:: final_fram, stop_fram, frame,delta, freq, start_fram


open(11,file="log.lammps",status="old")
open(12,file="ttemp1",status="old")
open(21,file="out1")

read(12,*)frame

do i=1, 67
    read(11,*)
enddo


start_fram=0
freq=300*10

stop_fram= frame * freq + start_fram

read(11,*)
do i=1, 10000000
    read(11,*,IOSTAT=iostatus)Step, Temp, E_pair, TotEng, Press, eb, ea, elp, emol, ev,&
    epen, ecoa, ehb, et, eco, ew, ep, efi, eqeq
    IF (iostatus < 0) then
        !write(*,*) "End of file reached"
        exit
    ELSEIF (iostatus == 0) then
        if (step<=stop_fram) then
            write(21,*)Step, Temp, TotEng, Press
        endif    
    ENDIF
enddo

end