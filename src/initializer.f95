subroutine initialize
   use params
   use variables
   implicit none

   integer:: i

   do i = 1, ns, 1
      ! initialize x axis values
      xs(i) = dx*float(i)
      ! initialize y axis values
      ys(i) = dy*float(i)
      ! initialize z axis values
      zs(i) = dz*float(i)

   end do

   do i = 1, tn, 1
      ts(i) = dt*float(i)
   end do

   ! initialize psi and psi2 axis values
   psi = 0.0
   psi2 = 0.0

   zz = 0.0
   ! create the 2D grid
   call meshgrid(xs, ys, ns, xx, yy)

end subroutine initialize

subroutine meshgrid(x, y, n, xx, yy)
   ! routine to create a grid from x and y arrays

   integer, intent(in):: n
   real*8, dimension(n), intent(in):: x, y
   real*8, dimension(1:n, 1:n), intent(out):: xx, yy

   xx = spread(x, 1, size(y))
   yy = spread(y, 2, size(x))
end subroutine meshgrid

subroutine print_mat2d(xx, n)
   implicit none
   real*8, dimension(1:n, 1:n), intent(in):: xx
   integer, intent(in):: n
   integer:: i

   do i = 1, n, 1
      print *, xx(:, i)
   end do

end subroutine print_mat2d

