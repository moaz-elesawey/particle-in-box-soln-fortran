! solution for the time independent wave equation
subroutine solve_stand
	use params
	use variables
	implicit none

	! solve the wave function of the electron
	psi = g * sin((nx * xs * pi) / a) &
			* sin((ny * ys * pi) / b) &
			* sin((nz * zs * pi) / c)

	! solving the electron density
	psi2  = psi**2

end subroutine solve_stand

! solution for the time dependent wave equation
subroutine solve_scf

end subroutine solve_scf
