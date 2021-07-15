program xyz

implicit none

real:: q,x(100000),y(100000),z(100000),c1,c2,c3, mass(100000)
integer:: i,j,k,l,atom, nfram
character*8 :: c


open(unit=11,file="trj",status="old")
open(unit=21,file="outtrj.xyz")

write(*,*)"how many frams do you want to convert?"
read(*,*)nfram


DO j=1, nfram
read(11,*)
read(11,*)
read(11,*)
read(11,*)atom
read(11,*)
read(11,*)
read(11,*)
read(11,*)
read(11,*)

write(21,*)atom
write(21,*)

do l=1,atom
  read(11,*)i,q,mass(i),x(i),y(i),z(i)
end do
 
do i=1,atom
    if(mass(i)==1.008)then
    write(21,*)"H",x(i),y(i),z(i)
    elseif(mass(i)==12.0)then
    write(21,*)"C",x(i),y(i),z(i)
    elseif(mass(i)==14.0)then
    write(21,*)"N",x(i),y(i),z(i)
    elseif(mass(i)==15.9994)then
    write(21,*)"O",x(i),y(i),z(i)
    elseif(mass(i)==1.00794)then
    write(21,*)"H",x(i),y(i),z(i)
    elseif(mass(i)==12.0107)then
    write(21,*)"C",x(i),y(i),z(i)
    elseif(mass(i)==14.0067)then
    write(21,*)"N",x(i),y(i),z(i)
    elseif(mass(i)==15.999)then
    write(21,*)"O",x(i),y(i),z(i)
    elseif(mass(i)==20.0)then
      write(21,*)"A",x(i),y(i),z(i)
    elseif(mass(i)==19.9)then
      write(21,*)"B",x(i),y(i),z(i)
    elseif(mass(i)==10.01)then
      write(21,*)"D",x(i),y(i),z(i)
    elseif(mass(i)==9.99)then
      write(21,*)"E",x(i),y(i),z(i)
    elseif(mass(i)==20.01)then
      write(21,*)"F",x(i),y(i),z(i)
    elseif(mass(i)==50.0)then
      write(21,*)"g",x(i),y(i),z(i)  
    elseif(mass(i)==5.0)then
      write(21,*)"k",x(i),y(i),z(i)
    elseif(mass(i)==21.00)then
      write(21,*)"g",x(i),y(i),z(i)  
    elseif(mass(i)==21.001)then
      write(21,*)"k",x(i),y(i),z(i)
    elseif(mass(i)==0.99)then
      write(21,*)"C",x(i),y(i),z(i)
    elseif(mass(i)==1.01)then
      write(21,*)"B",x(i),y(i),z(i)
    elseif(mass(i)==1.02)then
      write(21,*)"D",x(i),y(i),z(i)
    elseif(mass(i)==1.001)then
      write(21,*)"D",x(i),y(i),z(i)
    elseif(mass(i)==1)then
      write(21,*)"A",x(i),y(i),z(i)
    elseif(mass(i)==2.0)then
      write(21,*)"B",x(i),y(i),z(i)
    elseif(mass(i)==3.0)then
      write(21,*)"C",x(i),y(i),z(i)
    elseif(mass(i)==4.0)then
      write(21,*)"D",x(i),y(i),z(i)
    elseif(mass(i)==5.0)then
      write(21,*)"E",x(i),y(i),z(i)
    else 
    write(21,*)"Si",x(i),y(i),z(i)
    end if
end do

ENDDO
end program
