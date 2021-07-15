program frame
implicit none

integer:: i,j,k
real:: x,y,z, t
real:: x2,y2,z2
real:: red, green, blue
character*4:: chr

open(11,file="block",status="old")
open(12,file="fram",status="old")
open(21,file="out")

do i=1, 29
    read(11,*)
enddo

 write(21,*)"Begin_Scene                                                        "
 write(21,*)"Resolution 2568 2625                                               "
 write(21,*)"Shader_Mode Medium                                                 "
 write(21,*)"  Trans_VMD                                                        "
 write(21,*)"  Fog_VMD                                                          "
 write(21,*)"End_Shader_Mode                                                    "
 write(21,*)" Camera                                                            "
 write(21,*)"  Projection Orthographic                                          "
 write(21,*)"  Zoom 0.333333                                                    "
 write(21,*)"  Aspectratio 1                                                    "
 write(21,*)"  Antialiasing 12                                                  "
 write(21,*)"  Raydepth 50                                                      "
 write(21,*)"  Center  0 0 -2                                                   "
 write(21,*)"  Viewdir 0 0 2                                                    "
 write(21,*)"  Updir   0 1 0                                                    "
 write(21,*)"End_Camera                                                         "
 write(21,*)"Directional_Light Direction 0.1 -0.1 1 Color 1 1 1                 "
 write(21,*)"Directional_Light Direction -1 -2 0.5 Color 1 1 1                  "
 write(21,*)"                                                                   "
 write(21,*)"Background 0 0 0                                                   "

do i=1, 12
    read(11,*)    
    read(11,*)    chr, x,y,z
    read(11,*)    chr,x2,y2,z2
    read(11,*)     
    read(11,*)    
    read(11,*)    
    read(11,*)  
    read(11,*)
    
    
    write(21,*)    "FCylinder"
    write(21,*)    "Base", x,y,z
    write(21,*)    "Apex", x2,y2,z2
    write(21,*)    "Rad 0.01" 
    write(21,*)    "Texture"
    write(21,*)    "Ambient 1 Diffuse 0 Specular 0 Opacity 1"
    write(21,*)    "Phong Plastic 0.5 Phong_size 40 Color 1 1 1 TexFunc 0"
    write(21,*)
enddo

write(21,*)"# MoleculeID: 0 ReprID: 0 Beginning VDW"

do i=1, 200
    read(12,*)j,k
    if(k==1)then
        red=1.0
        green=1.0
        blue=1.0
    elseif(k==2)then
        red=204.0/255.0
        green=102.0/255.0
        blue=0.0
    elseif(k==3)then
        red=128.0/255.0
        green=128.0/255.0
        blue=128.0/255.0
    elseif(k==4)then
        red=128.0/255.0
        green=128.0/255.0
        blue=128.0/255.0
    elseif(k==5)then
        red=204.0/255.0
        green=204.0/255.0
        blue=0.0
    elseif(k==6)then
        red=0.0
        green=204.0/255.0
        blue=102.0/255.0
    elseif(k==7)then
        red=153.0/255.0
        green=0.0
        blue=204.0/255.0
    else
        red=122.0/255.0
        green=178.0/255.0
        blue=1.0   
    endif
    
    
    read(11,*)
    read(11,*) 
    read(11,*)chr, x,y,z 
    read(11,*)chr ,t 
    read(11,*)
    read(11,*)
    read(11,*)
    
    write(21,*)" "
    write(21,*)"Sphere"
    write(21,*)"Center", x,y,z
    write(21,*)"Rad",t
    write(21,*)"Texture"
    write(21,*)"Ambient 0 Diffuse 0.65 Specular 0 Opacity 1"
    write(21,*)"Phong Plastic 0.5 Phong_size 40 Color", red, green, blue, "TexFunc 0"
    
enddo


write(21,*)" "
write(21,*)"End_Scene" 

end