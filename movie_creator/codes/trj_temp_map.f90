program xyz

implicit none

real:: q,x,y,z,c1,c2,c3, mass, temp(1000,100),temp_atom
real:: vx,vy,vz, dz, dy, ymin, ymax, zmin, zmax
real:: k_boltz, avo, zarib
integer:: i,j,jj, n, k,kk,l, atom, nfram, mesh_y, mesh_z,counter(1000,100), ignor
character*8 :: c
character(len=20), external :: str

open(unit=11,file="trj",status="old")
open(unit=12,file="trjvel",status="old")

dz=3.497006897
dy=3.684210526
mesh_y=19
mesh_z=145
k_boltz=1.38064852 ! 10-23 m2 kg s-2 K-1
avo=6.0221409      ! 10+23
zarib=10000000.0/3.0

DO jj=1, 5000
open(21, file='Output'//trim(str(jj))//'.txt')
    
read(11,*)
read(11,*)
read(11,*)
read(11,*)atom
read(11,*)
read(11,*)
read(11,*)ymin, ymax
read(11,*)zmin, zmax
read(11,*)

read(12,*)
read(12,*)
read(12,*)
read(12,*)
read(12,*)
read(12,*)
read(12,*)
read(12,*)
read(12,*)

    do i=1, mesh_z
        DO j=1, mesh_y
            temp(i,j)= 0.0
            counter(i,j)=0
        ENDDO
    enddo
        
    do l=1,atom
        read(11,*)k,mass,x,y,z
        read(12,*)kk,mass,vx,vy,vz
        temp_atom= mass*(vx**2 + vy**2 + vz**2)*zarib/(k_boltz*avo) ! Kelvin
        do i=1, mesh_z
            DO j=1, mesh_y
                if (z>=(zmin+(i-1)*dz) .and. z<(zmin+i*dz))then
                    IF (y>=(ymin+(j-1)*dy) .and. y<(ymin+j*dy))then
                        temp(i,j)= temp(i,j)+temp_atom
                        counter(i,j)=counter(i,j)+ 1
                    ENDIF
                endif    
            ENDDO
        enddo
        
    end do


    do i=1, mesh_z
        DO j=1, mesh_y
            if (counter(i,j)>0)then
            write(21,*)(zmin+(i-1)*dz + zmin+i*dz)/2.0, (ymin+(j-1)*dy + ymin+j*dy)/2.0, temp(i,j)/counter(i,j)
            else
            write(21,*)(zmin+(i-1)*dz + zmin+i*dz)/2.0, (ymin+(j-1)*dy + ymin+j*dy)/2.0, 2500.0
            endif
        ENDDO
        write(21,*)
    enddo
!close (21)
ENDDO


end program

character(len=20) function str(k)
implicit none
!   "Convert an integer to string."
    integer, intent(in) :: k
    write (str, *) k
    str = adjustl(str)
end function str

