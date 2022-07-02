! solution for the time dependent wave equation
subroutine solve_scf

   use params
   use variables

   implicit none

   integer :: i

100 format("solving for timestep t = ", i4, " of ", i4)

   do i = 1, tn, 1
      ! message to the user
      if (mod(i, 50) .eq. 0) then
         print 100, i, tn
      end if

      psi(:, :, i) = sin((nx*xx*pi)/a)**2 &
                     + sin((ny*yy*pi)/b)**2 &
                     + (sin((nx*xx*pi)/a) &
                        *sin((ny*yy*pi)/b) &
                        *cos(ts(i)))

   end do

   ! solving the electron density
   psi2 = psi**2
end subroutine solve_scf
