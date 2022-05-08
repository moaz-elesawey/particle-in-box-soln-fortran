subroutine saver(filename)
	use params
	use variables
	character(len=*), intent(in) :: filename
	integer :: i, j
	
	! 100 format(f6.6, f6.6, f6.6, f6.6, f6.6)
	! open(unit=99, file=filename)
	! 	do i = 1, ns, 1
	! 		write(99, *) xs(i), ys(i), zs(i), psi(i), psi2(i)
	! 	end do
	! close(99)

	100 format(f6.3, f6.3, f6.3, f6.3, f6.3)
	open(unit=99, file=filename)
		do i = 1, ns, 1
			do j = 1, ns, 1
				write(99, *) xx(i, j), yy(i, j), zz(i, j), psi(i, j), psi2(i, j)
			end do
		end do
	close(99)


end subroutine saver
