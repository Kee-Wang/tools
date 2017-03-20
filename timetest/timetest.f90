module timetest
!=====================
!This program is the templete to do a 10 round time test on the give task
!
!====================
implicit none
!private
integer :: time_i, time_k, times
real :: start,finish,avgtime
real :: time_t

contains

subroutine tic()


!=======User Defined parameters
!None
!============================


call cpu_time(start)
!=========Your test content


end subroutine

subroutine toc()

call cpu_time(finish)
time_t=finish-start
write(*,*) 'Time elpased:',time_t
!avgtime=0
!do i=1,10
!avgtime=avgtime+t(i)
!end do
!write(*,*) 'Averaged time:',avgtime/10.0
!write(*,*) 'Time test finished!'
end subroutine

end module
