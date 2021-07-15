program center
implicit none

integer:: i,j,k,natom,shomar,flag
real:: x,y,z,r
character:: chr

open(11,file="x.xyz",status="old")
open(21,file="center")
open(22,file="removed.xyz")

read(11,*)natom
read(11,*)

write(22,*)natom-100
write(22,*)

shomar=1
do i=1, natom
    read(11,*)chr,x,y,z
    r=sqrt(x**2 + y**2 + z**2)
    flag=1
    if (r <9.02) then
        write(*,*)shomar,i
        write(21,*)i
        shomar=shomar+1
        flag=0
    endif
    if (flag==1)then
        write(22,*)chr,x,y,z
    endif
enddo

end


