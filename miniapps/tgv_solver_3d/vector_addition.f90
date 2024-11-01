program vector_addition
  integer, dimension(10) :: A, B, C
  integer :: i

  do i = 1, 10
    A(i) = i * 100
    B(i) = i
    C(i) = 1000
  end do

  !$acc parallel loop
  do i = 1, 10
    C(i) = A(i) + B(i)
  end do
  !$acc end parallel loop

  do i = 1, 10
    print *, C(i)
  end do
end program vector_addition
