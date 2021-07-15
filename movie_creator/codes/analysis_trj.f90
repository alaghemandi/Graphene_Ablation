PROGRAM counter
implicit none


integer :: i, j, k, nfram, natom, freq, ignor
real:: x(1000000),y(1000000),z(1000000),q, mass(1000000)

nfram = 500000 	         ! number of frames, 
natom = 200
freq=300
ignor=0

open(11, file="trj", status="old")
open(31, file="out.xyz")

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
IF (ignor>0) then
DO i=1, ignor
  do j=1, 9
    read(11,*)
  enddo
  do j=1, natom
    read(11,*) !k, mass(j), x(j), y(j), z(j)
  enddo
ENDDO
ENDIF
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!write first frame after ignor
  do j=1, 9
    read(11,*)
  enddo
   
  do j=1, natom
    read(11,*) k, mass(k), x(k), y(k), z(k)
  enddo
  
  write(31,*) natom
  write(31,*)  
  do j=1, natom
    if (mass(j)==1.008)then
        write(31,*) "H", x(j), y(j), z(j)
    else
        write(31,*) "O", x(j), y(j), z(j)
    endif
  enddo
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  
! write the other frame based on frequency asked
DO i=1, nfram-ignor-1
 
  do j=1, 9
    read(11,*)
  enddo
  
  do j=1, natom
    read(11,*) k, mass(k), x(k), y(k), z(k)
  enddo
  
  if (MOD(i,freq)==0.0)then
    write(31,*) natom
    write(31,*)
      do j=1, natom
        if (mass(j)==1.008)then
            write(31,*) "H", x(j), y(j), z(j)
        else
            write(31,*) "O", x(j), y(j), z(j)
        endif
      enddo
  endif
  
ENDDO
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

write(31,*)

END 
