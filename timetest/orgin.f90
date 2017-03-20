program timetest
!=====================
!This program is the templete to do a 10 round time test on the give task
!
!====================
implicit none
integer :: i, k
real :: start,finish,avgtime
real :: t(10)

!=======User Defined parameters
!None
!============================


do k=1,10
call cpu_time(start)
!=========Your test content









!=========================

call cpu_time(finish)
t(k)=finish-start
write(*,*) 'Finished cycle:',k,'Time elpased:',t(k)
end do
avgtime=0
do i=1,10
avgtime=avgtime+t(i)
end do
write(*,*) 'Averaged time:',avgtime/10.0
write(*,*) 'Time test finished!'
end program
