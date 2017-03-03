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
INTEGER, PARAMETER :: maxcyc = 10
real :: start,finish,avgtime
real :: time(maxcyc)

!=======User Defined parameters===
!None
INTEGER, PARAMETER :: size = 100, repeat=10000
real,dimension(size,size,size)::mat1,mat2
integer :: i,j,k,l
!=================================



do cyc=1,maxcyc
call cpu_time(start)
!=========Your test content=====
mat1 = 1d0
do k=1,repeat !Repeat 100000 times
do i=1,size
do j=1,size
do l=1,size
mat2(l,j,i) = mat1(l,j,i)
end do
end do
end do
end do
!===============================





call cpu_time(finish)
time(cyc)=finish-start
write(*,*) 'Finished cycle:',cyc,'Time elpased:',time(cyc)
end do
avgtime=0d0
do avg=1,maxcyc
avgtime=avgtime+time(avg)
end do
write(*,*) 'Averaged time:',avgtime/maxcyc
write(*,*) 'Time test finished!'
end program
