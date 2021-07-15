program xyz

implicit none

real:: q,x,y,z,c1,c2,c3, mass, temp(1000,100),temp_atom
real:: vx,vy,vz, dx, dy, xmin, xmax, ymin, ymax, zmin, zmax
real:: k_boltz, avo, zarib
integer:: i,j,jj, n, k,kk,l, atom, nfram, mesh_y, mesh_x,counter(1000,100), ignor
character*8 :: c
character(len=20), external :: str

open(unit=11,file="trj",status="old")
open(unit=12,file="trjvel",status="old")


dx=2.11423/1.5
dy=2.20243/1.5
mesh_x=30
mesh_y=30
k_boltz=1.38064852 ! 10-23 m2 kg s-2 K-1
avo=6.0221409      ! 10+23
zarib=10000000.0/3.0

DO jj=1, 1000
open(21, file='Output'//trim(str(jj))//'.txt')
    
read(11,*)
read(11,*)
read(11,*)
read(11,*)atom
read(11,*)
read(11,*)xmin, xmax
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

    do i=1, mesh_x
        DO j=1, mesh_y
            temp(i,j)= 0.0
            counter(i,j)=0
        ENDDO
    enddo
        
    do l=1,atom
        read(11,*)k,mass,x,y,z
        read(12,*)kk,mass,vx,vy,vz
        temp_atom= mass*(vx**2 + vy**2 + vz**2)*zarib/(k_boltz*avo) ! Kelvin
        do i=1, mesh_x
            DO j=1, mesh_y
                if (z>=(xmin+(i-1)*dx) .and. z<(xmin+i*dx))then
                    IF (y>=(ymin+(j-1)*dy) .and. y<(ymin+j*dy))then
                        temp(i,j)= temp(i,j)+temp_atom
                        counter(i,j)=counter(i,j)+ 1
                    ENDIF
                endif    
            ENDDO
        enddo
        
    end do


    do i=1, mesh_x
        DO j=1, mesh_y
            if (counter(i,j)>0)then
            write(21,*)(xmin+(i-1)*dx + xmin+i*dx)/2.0, (ymin+(j-1)*dy + ymin+j*dy)/2.0, temp(i,j)/counter(i,j)
            else
            write(21,*)(xmin+(i-1)*dx + xmin+i*dx)/2.0, (ymin+(j-1)*dy + ymin+j*dy)/2.0, 2500.0
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

