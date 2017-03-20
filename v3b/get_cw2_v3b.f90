program get_v3b
!This program read in the v3b.xyz file and do molpro job one by one.
!Split file before calling the program is desired 
use cw2_v3b
use pes_tools
implicit none

real,dimension(3,9)::xx
character::symbb
integer::i
integer::ierr


!filename = '~/2h2oco2/1_ab_initio/trimer&
!/fildtest/1.xyz'

call getarg(1,filename)
open(21,status='old',file=filename)
do
     read(21,*,iostat=ierr) 
     if (ierr < 0) exit
     read(21,*) 
     do i=1,9
        read(21,*) symbb,xx(:,i)
     end do
     xx=xx/auang
     call split_cw2(xx)
end do
close(21)
end program


