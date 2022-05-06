program main
	implicit none

	! initialize variables
	call initialize

	! solve the wave function
	call solve_stand

	! save the data
	call saver("data.dat")

end program main
