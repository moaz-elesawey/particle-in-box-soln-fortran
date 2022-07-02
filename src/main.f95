program main
   implicit none

   ! initialize variables
   print *, "initializing simulation variables... done!"
   call initialize

   ! solve the wave function
   print *, "solving schrodinger equation... done!"
   call solve_scf

   ! save the data
   print *, "saving simulation results... done!"
   call saver

end program main
