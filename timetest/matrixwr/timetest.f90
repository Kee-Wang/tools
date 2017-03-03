program timetest
!=====================
!This program is the templete to do a 10 round time test on the given task
!
!Kee
!kee.wang@emory.edu
!Feb 13, 2017
!Note this is for matrix read write in 2d
!====================
implicit none
integer :: cyc, avg
real :: start,finish,avgtime
real :: time(10)

!=======User Defined parameters===
!None
real,dimension(100000,100000)::mat1,mat2
integer :: i,j,k
!=================================



do cyc=1,10
call cpu_time(start)
!=========Your test content=====
mat1 = 1d0
do k=1,1000000 !Repeat 100000 times
do i=1,100000
do j=1,100000
mat2(i,j) = mat1(i,j)
end do
end do
end do
!===============================





call cpu_time(finish)
time(cyc)=finish-start
write(*,*) 'Finished cycle:',cyc,'Time elpased:',time(cyc)
end do
avgtime=0
do avg=1,10
avgtime=avgtime+time(avg)
end do
write(*,*) 'Averaged time:',avgtime/10.0
write(*,*) 'Time test finished!'
end program
