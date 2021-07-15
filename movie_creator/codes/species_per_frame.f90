program frame
implicit none

integer:: nline, i,j,k, ii, jj, nfram
real:: time, fram(10000), start_frame, freq
character*4:: chr(10000), typ, motaf

open(11,file="block",status="old")
!open(12,file="line_block",status="old")
!open(13,file="typetemp",status="old")
open(21,file="out1")

read(11,*)motaf, ii, nline
!read(12,*)nline
!read(13,*)ii

start_frame=0.0
freq=300.0
nfram=1500

do i=1, nline
    read(11,*)j, chr(i), fram(i)
enddo

 fram(nline+1)=40000000
 chr(nline+1)="HOH"

IF(ii<133 .or. ii==199)then

do i=1, nfram
    time=(i*freq*1.0)+start_frame
    do j=2, nline+1
        typ=chr(j-1)
        if (time<=fram(j)) then
            exit
        endif
    enddo
    if (typ=="H2")then
        k=1
    elseif (typ=="O2") then
        k=2
    elseif (typ=="H'") then
        k=3
    elseif (typ=="O'") then
        k=4
    elseif (typ=="OH") then
        k=5
    elseif (typ=="HO2") then
        k=6
    elseif (typ=="HOOH") then
        k=7
    elseif (typ=="H3O2") then
        k=1 
    elseif (typ=="H3O4") then
        k=1 
    elseif (typ=="H2O2") then
        k=7
    elseif (typ=="H3O") then
        k=8
    elseif (typ=="HOH") then
        k=8
    elseif (typ=="H4O2") then
        k=8
    elseif (typ=="H2O3") then
        k=8
    elseif (typ=="H2O") then
        k=8
    elseif (typ=="HO3") then
        k=5
    elseif (typ=="H4O") then
        k=8
    elseif (typ=="H2O4") then
        k=7
    elseif (typ=="HO4") then
        k=6
    elseif (typ=="O4") then
        k=1
    elseif (typ=="H5O2") then
        k=7
    elseif (typ=="H3") then
        k=1
    elseif (typ=="H5O3") then
        k=8
    elseif (typ=="O3") then
        k=1
    elseif (typ=="H4") then    
        k=1
    else
        k=1
    endif
    write(21,*) i, k
enddo

ELSE

do i=1, nfram
    time=(i*freq*1.0)+start_frame
    do j=2, nline+1
        typ=chr(j-1)
        if (time<=fram(j)) then
            exit
        endif
    enddo
    if (typ=="H2")then
        k=2
    elseif (typ=="O2") then
        k=2
    elseif (typ=="H'") then
        k=3
    elseif (typ=="O'") then
        k=4
    elseif (typ=="OH") then
        k=5
    elseif (typ=="HO2") then
        k=6
    elseif (typ=="HOOH") then
        k=7
    elseif (typ=="H3O2") then
        k=2
    elseif (typ=="H3O4") then
        k=2
    elseif (typ=="H2O2") then
        k=7
    elseif (typ=="H3O") then
        k=8
    elseif (typ=="HOH") then
        k=8
    elseif (typ=="H4O2") then
        k=8
    elseif (typ=="H2O3") then
        k=8
    elseif (typ=="H2O") then
        k=8
    elseif (typ=="HO3") then
        k=5
    elseif (typ=="H4O") then
        k=8
    elseif (typ=="H2O4") then
        k=7
    elseif (typ=="HO4") then
        k=6
    elseif (typ=="O4") then
        k=2
    elseif (typ=="H5O2") then
        k=7
    elseif (typ=="H3") then
        k=2
    elseif (typ=="H5O3") then
        k=8
    elseif (typ=="O3") then
        k=2
    elseif (typ=="H4") then    
        k=2
    else
        k=2
    endif
    write(21,*) i, k
enddo

ENDIF

end