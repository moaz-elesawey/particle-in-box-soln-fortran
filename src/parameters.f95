! holding all contants and variable of the program

module params
	implicit none

	! nodes in the x direction
	integer, parameter :: nx = 2
	! nodes in the y direction
	integer, parameter :: ny = 4
	! nodes in the z direction
	integer, parameter :: nz = 4

	! number of points to work with
	integer, parameter :: ns = 100

	! width of the box in the x direction
	real, parameter :: a = 2.0
	! width of the box in the y direction
	real, parameter :: b = 4.0
	! width of the box in the z direction
	real, parameter :: c = 2.0

	! increamental value for each axis
	real, parameter :: dx = a / float(ns)
	real, parameter :: dy = b / float(ns)
	real, parameter :: dz = c / float(ns)

	! planks constant (using hartree units (a.u.))
	real, parameter :: h = 1.0
	! mass of the electron also (a.u.)
	real, parameter :: m = 1.0

	! times factor 
	real, parameter :: g = sqrt(8.0 / (a*b*c))
	! value of exp and pi
	real, parameter :: e = 2.718281828459045
	real, parameter :: pi = 4.0 * atan(1.0)

end module params

module variables
	use params
	implicit none

	! directions of the box x, y, z
	real*8, dimension(1:ns) :: xs
	real*8, dimension(1:ns) :: ys
	real*8, dimension(1:ns) :: zs

	real*8, dimension(1:ns, 1:ns) :: xx, yy, zz

	! wave function solution
	real*8, dimension(1:ns, 1:ns) :: psi
	! electron density
	real*8, dimension(1:ns, 1:ns) :: psi2

end module variables
