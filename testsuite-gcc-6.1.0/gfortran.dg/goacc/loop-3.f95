! { dg-do compile }
! { dg-additional-options "-std=f2008" }

subroutine test1
  implicit none
  integer :: i, j
  
  ! !$acc end loop not required by spec
  !$acc loop
  do i = 1,5
  enddo
  !$acc end loop ! { dg-warning "Redundant" }

  !$acc loop
  do i = 1,5
  enddo
  j = 1
  !$acc end loop ! { dg-error "Unexpected" }

  !$acc parallel
  !$acc loop
  do i = 1,5
  enddo
  !$acc end parallel
  !$acc end loop ! { dg-error "Unexpected" }
  
  ! OpenACC supports Fortran 2008 do concurrent statement
  !$acc loop
  do concurrent (i = 1:5)
  end do

  !$acc loop
  outer_loop: do i = 1, 5
    inner_loop: do j = 1,5
      if (i .eq. j) cycle outer_loop
      if (i .ne. j) exit outer_loop ! { dg-error "EXIT statement" }
    end do inner_loop
  end do outer_loop 

  outer_loop1: do i = 1, 5
    !$acc loop
    inner_loop1: do j = 1,5
      if (i .eq. j) cycle outer_loop1 ! { dg-error "CYCLE statement" }
    end do inner_loop1
  end do outer_loop1

  !$acc loop collapse(2)
  outer_loop2: do i = 1, 5
    inner_loop2: do j = 1,5
      if (i .eq. j) cycle outer_loop2 ! { dg-error "CYCLE statement" }
      if (i .ne. j) exit outer_loop2 ! { dg-error "EXIT statement" }
    end do inner_loop2
  end do outer_loop2 
end subroutine test1

