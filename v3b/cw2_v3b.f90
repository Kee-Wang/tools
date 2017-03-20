module cw2_v3b
implicit none
character,dimension(9),parameter::symbs_cw2=&
(/'O','O','C','H','H','O','H','H','O'/)
character(32),parameter::theory='mp2'
character(32),parameter::basis = 'avtz'
character(32),parameter::energy = 'EMP2'
!Use  EMP2 for mp2 energy and energy(2) for ccsd(t) energy
integer::global_count_v3b=0
integer::global_count = 0


contains

subroutine split_cw20(xx)
real,dimension(:,:)::xx
real,dimension(3,60)::xxw
real,dimension(3,9)::xxcw2
integer::i,j,k

xxcw2(:,1:3) = xx(:,1:3)
xxw(:,:) = xx(:,4:63)

do i = 1,20
do j = i+1,20
xxcw2(:,4:6) = xxw(:, 3*i-2:3*i)
xxcw2(:,7:9) = xxw(:, 3*j-2:3*j)
call split_cw2(xxcw2)
write(*,*)
write(*,*) i,j
write(*,*)
do k = 1,9
write(*,*) symbs_cw2(k),xxcw2(:,k)
end do
end do
end do




end subroutine



subroutine split_cw2(xx)
real,dimension(3,9)::xx
integer::units
character(len=80)::commandline
character(len=12)::filename
units = 12
global_count_v3b = global_count_v3b + 1
write (filename, "(A3,I5.5,A4)") 'v3b', global_count_v3b,'.inp'
write (commandline, "(A51,A12)") &
'/usr/local/bin/molprop_2010_1_Linux_x86_64_i8 -n 4 ',filename
write(*,*) commandline
open(file =filename ,unit = units,status = 'unknown')
!open(file = trim(filename) ,unit = units,status = 'unknown')




write(units,*) '***,For CO2-H2O-H2O v3b'
write(units,*) 'memory,200,m'
write(units,*) 'basis=',basis
write(units,*)


call wrt_trimer(xx,units)

call wrt_dimer(xx,units)

call wrt_monomer(xx,units)


write(units,*) 'v2b(1) = v_dimer(1) - v_monomer(1) - v_monomer(2)'
write(units,*) 'v2b(2) = v_dimer(2) - v_monomer(1) - v_monomer(3)'
write(units,*) 'v2b(3) = v_dimer(3) - v_monomer(2) - v_monomer(3)'
write(units,*) 'v2ball = v2b(1) + v2b(2) + v2b(3)'
write(units,*) 'v1ball = v_monomer(1) + v_monomer(2) + v_monomer(3)'
write(units,*) 'v3b = v_trimer - v1ball - v2ball'
write(units,*) 'show,v_trimer,v_dimer,v_monomer,v1ball,v2b,v2ball,v3b'

close(units)

call system(commandline)

global_count = global_count + 1
!if (global_count > 2) then
!write(*,*) 'stopped by user'
!stop
!end if
!execute molpro(filename)
!call get_v3b(xx,filename)
end subroutine

!subroutine grab_v3b(xx,units)
!real,dimension(:,:)::xx
!integer::units, i
!integer::v3bline = 1713
!real::v3b
!character(len=

!open(file='mp.out',unit = 99, status = 'old')
!do i = 1,v3bline
!read(99,*)
!end do
!read(99,*) chara,eq,v3b
!write(*,*) 6

!end subroutine



subroutine wrt_monomer(xx,units)
real,dimension(:,:)::xx
integer::units,i
!First
write(units,*)
write(units,*) 'geomtyp=xyz'
write(units,*) 'geometry={'
write(units,*)  3
write(units,*) 
do i = 1,3
write(units,*)  symbs_cw2(i),xx(:,i)
end do
write(units,*)  '}'
write(units,*) 'hf'
write(units,*)  theory
write(units,*) 'v_monomer(1) =', energy
write(units,*)


!Second
write(units,*)
write(units,*) 'geomtyp=xyz'
write(units,*) 'geometry={'
write(units,*)  3
write(units,*) 
do i = 4,6
write(units,*)  symbs_cw2(i),xx(:,i)
end do
write(units,*)  '}'
write(units,*) 'hf'
write(units,*)  theory
write(units,*)
write(units,*) 'v_monomer(2) =', energy
write(units,*)

!Third
write(units,*)
write(units,*) 'geomtyp=xyz'
write(units,*) 'geometry={'
write(units,*)  3
write(units,*) 
do i = 7,9
write(units,*)  symbs_cw2(i),xx(:,i)
end do
write(units,*)  '}'
write(units,*) 'hf'
write(units,*)  theory
write(units,*)
write(units,*) 'v_monomer(3) =', energy
write(units,*)
return
end subroutine

subroutine wrt_dimer(xx,units)
real,dimension(:,:)::xx
integer::units,i

!First
write(units,*)
write(units,*) 'geomtyp=xyz'
write(units,*) 'geometry={'
write(units,*)  6
write(units,*) 
do i = 1,6
write(units,*)  symbs_cw2(i),xx(:,i)
end do
write(units,*)  '}'
write(units,*) 'hf'
write(units,*)  theory
write(units,*)
write(units,*) 'v_dimer(1)=', energy
write(units,*)

!Second
write(units,*)
write(units,*) 'geomtyp=xyz'
write(units,*) 'geometry={'
write(units,*)  6
write(units,*) 
do i = 1,3
write(units,*)  symbs_cw2(i),xx(:,i)
end do
do i = 7,9
write(units,*)  symbs_cw2(i),xx(:,i)
end do
write(units,*)  '}'
write(units,*) 'hf'
write(units,*)  theory
write(units,*)
write(units,*) 'v_dimer(2) =',energy
write(units,*)

!Third
write(units,*)
write(units,*) 'geomtyp=xyz'
write(units,*) 'geometry={'
write(units,*)  6
write(units,*) 
do i = 4,9
write(units,*)  symbs_cw2(i),xx(:,i)
end do
write(units,*)  '}'
write(units,*) 'hf'
write(units,*)  theory
write(units,*)
write(units,*) 'v_dimer(3) =', energy
write(units,*)
return
end subroutine



subroutine wrt_trimertemp(xx)
!Inputfile is a cw2 trimer
real,dimension(:,:)::xx
integer::units,i

!units = 98
!open(file='v3bxx.temp',status = 'unknown',unit = units)
!write(units,*)  9
!write(units,*) 
!do i = 1,9
!write(units,*)  symbs_cw2(i),xx(:,i)
!end do

end subroutine
subroutine wrt_trimer(xx,units)
!Inputfile is a cw2 trimer
real,dimension(:,:)::xx
integer::units,i


write(units,*)
write(units,*) 'geomtyp=xyz'
write(units,*) 'geometry={'
write(units,*)  9
write(units,*) 
do i = 1,9
write(units,*)  symbs_cw2(i),xx(:,i)
end do
write(units,*)  '}'
write(units,*) 'hf'
write(units,*)  theory
write(units,*)
write(units,*) 'v_trimer =', energy

end subroutine
end module
