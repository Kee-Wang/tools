program main
use timetest
integer::i
real::a


call tic()
do i = 1,100000
a = i*8+i*i
end do
call toc()
end program
