subroutine initialize
	use params
	use variables
	implicit none

	integer :: i

	do i = 1, ns, 1
		! initialize x axis values
		xs(i) = dx * float(i)
		! initialize y axis values
		ys(i) = dy * float(i)
		! initialize z axis values
		zs(i) = dz * float(i)
		! initialize psi and psi2 axis values
		psi(i) = 0.0
		psi2(i) = 0.0
	end do
	
	! create the 2D grid
	call meshgrid(xs, ys, nx, ny, xx, yy)

end subroutine initialize

subroutine meshgrid(x, y, nx, ny, xx, yy)
	integer, intent(in) :: nx, ny
	real*8, dimension(nx), intent(in) :: x, y
	real*8, dimension(1:nx, 1:ny), intent(out) :: xx, yy

	xx = spread(x, 1, size(y))
	yy = spread(y, 2, size(x))
end subroutine meshgrid
