program frame_creater
implicit none

integer::  i,j,k, iostatus
real:: fram,num_H2,num_O2,num_OH,num_H2O,num_H2O2,num_HO2,num_H_rad,num_O_rad
real:: final_fram, stop_fram, frame,delta, freq, start_fram


open(11,file="time_species_new",status="old")
open(12,file="ttemp1",status="old")
open(21,file="out1")

read(12,*)frame

start_fram=0
freq=300.0

stop_fram= frame * freq + start_fram

read(11,*)
do i=1, 10000000
    read(11,*,IOSTAT=iostatus)fram,num_H2,num_O2,num_OH,num_H2O,num_H2O2,num_HO2,num_H_rad,num_O_rad
    IF (iostatus < 0) then
        !write(*,*) "End of file reached"
        exit
    ELSEIF (iostatus == 0) then
        if (fram<=stop_fram) then
            write(21,*)fram,num_H2,num_O2,num_OH,num_H2O,num_H2O2,num_HO2,num_H_rad,num_O_rad
        endif    
    ENDIF
    if (fram>stop_fram) then
        exit
    endif
enddo

end