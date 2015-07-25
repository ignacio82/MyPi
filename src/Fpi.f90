Module Fortranpi
IMPLICIT NONE
contains
subroutine dboard(darts, dartsscore) bind(C, name="dboard_")
  use, intrinsic :: iso_c_binding, only : c_double, c_int
  integer(c_int), intent(in)           :: darts
  real(c_double), intent(out)          :: dartsscore
  real(c_double)                       :: x_coord, y_coord
  integer(c_int)                       :: score, n

score = 0
do n = 1, darts
  call random_number(x_coord)
  call random_number(y_coord)

  if ((x_coord**2 + y_coord**2) <= 1.0d0) then
  score = score + 1
  end if
end do

dartsscore = 4.0d0*score/darts

end subroutine dboard

subroutine pi(avepi, DARTS, ROUNDS) bind(C, name="pi_")
  use, intrinsic :: iso_c_binding, only : c_double, c_int
  real(c_double), intent(out)            ::  avepi
  integer(c_int), intent(in)             ::  DARTS, ROUNDS
  integer(c_int)                         ::  MASTER, rank, i, n
  integer(c_int), allocatable            ::  seed(:)
  real(c_double)                         ::  pi_est, homepi, pirecv, pisum

! we set it to zero in the sequential run
rank = 0
! initialize the random number generator
! we make sure the seed is different for each task
call random_seed()
call random_seed(size = n)
allocate(seed(n))
seed = 12 + rank*11
call random_seed(put=seed(1:n))
deallocate(seed)

avepi = 0
do i = 0, ROUNDS-1
  call dboard(darts, pi_est)
  ! calculate the average value of pi over all iterations
  avepi = ((avepi*i) + pi_est)/(i + 1)
end do
end subroutine pi

end module Fortranpi
