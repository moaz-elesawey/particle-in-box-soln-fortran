subroutine saver(filename)
	use params
	use variables
	character(len=*), intent(in) :: filename
	integer :: i
	
	100 format(f6.6, f6.6, f6.6, f6.6, f6.6)
	open(unit=99, file=filename)
		do i = 1, ns, 1
			write(99, *) xs(i), ys(i), zs(i), psi(i), psi2(i)
		end do
	close(99)

end subroutine saver
