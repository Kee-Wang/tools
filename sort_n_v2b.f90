program main

!This programed used to sort dimer configurations in the energy order and genertate
!v2b accroding to this order. Moreover, threshold is used here to filter out the
!extremly high energy
!Requirement: dimer configs and monoer configs should be in same sequence.

implicit none


double precision,allocatable::dimer(:),xx(:,:,:),h2o(:),co2(:)
character::sym(6)*1,symy(6)*1
integer:: i,j,N,units(100)
double precision::switchE,tempxx(3,6),threshold
character::filenames*20(100)
threshold = 10e10 !unit: cm-1
N = 47358
allocate(dimer(N))
allocate(h2o(N))
allocate(co2(N))
allocate(xx(3,6,N))

filenames(1)='co2_47358.abE'
filenames(2)='h2o_47358.abE'
filenames(3)='dimer_47358.abE'
filenames(4)='dimer.sort'
filenames(5)='v2b.sort'
filenames(6)='dimer.sort.cm'

open(11,file=filenames(1),status='old')
open(12,file=filenames(2),status='old')
open(13,file=filenames(3),status='old')
open(14,file=filenames(4),status='unknown')
open(15,file=filenames(5),status='unknown')
open(16,file=filenames(6),status='unknown')


symy(1:3)='O'
symy(4:5)='H'
symy(6)='C'


do i=1,N

read(11,*) 
read(11,*) co2(i)
read(11,*) ; read(11,*) ;read(11,*)

read(12,*)
read(12,*) h2o(i)
read(12,*) ; read(12,*) ;read(12,*)

read(13,*) 
read(13,*) dimer(i)
do j=1,6
read(13,*) sym(j),xx(:,j,i)
if(sym(j) .ne. symy(j)) then
write(*,*) i,'stop'
stop
end if
end do

end do

do i=1,N
 do j=i,N
   if ( dimer(i) - dimer(j) > 0) then
   call switch(dimer(i),dimer(j))
   call switch(co2(i),co2(j))
   call switch(h2o(i),h2o(j))

   tempxx(:,:)=xx(:,:,i)
   xx(:,:,i)=xx(:,:,j)
   xx(:,:,j)=tempxx(:,:)
end if
end do
end do

do i=1,N

if ((dimer(i)-dimer(1))*219474.63 < threshold) then
write(16,*) 6
write(16,*) (dimer(i)-dimer(1))*219474.63
do j=1,6
write(16,'(A4,3F15.10)') sym(j),xx(:,j,i)
end do


write(14,*) 6
write(14,*) dimer(i)
do j=1,6
write(14,'(A4,3F15.10)') sym(j),xx(:,j,i)
end do

write(15,*) 6
write(15,*) dimer(i)-co2(i)-h2o(i)
do j=1,6
write(15,'(A4,3F15.10)') sym(j),xx(:,j,i)
end do

else
write(*,*) 'Total configurations less than', threshold,'cm-1 is',i,'/',N
stop
end if



end do
end

subroutine switch(a,b)
double precision::a
double precision::b
double precision::c

c=a
a=b
b=c
return
end subroutine

