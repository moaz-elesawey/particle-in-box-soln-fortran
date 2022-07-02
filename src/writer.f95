subroutine saver

   use netcdf
   use params
   use variables

   implicit none
   integer(kind=4) :: ncid, ns_id, tn_id
   integer(kind=4) :: xxvar_id, yyvar_id, tvar_id, psivar_id, psi2var_id
   integer(kind=4), dimension(1) :: tdim_id
   integer(kind=4), dimension(2) :: xxdim_id, yydim_id
   integer(kind=4), dimension(3) :: psidim_id, psi2dim_id

   ! create the nc file
   call check(nf90_create(trim(fname), NF90_CLOBBER, ncid))

   ! create the variable dime
   call check(nf90_def_dim(ncid, "ns", ns, ns_id))
   call check(nf90_def_dim(ncid, "tn", tn, tn_id))

   xxdim_id = (/ns_id, ns_id/)
   yydim_id = (/ns_id, ns_id/)
   tdim_id = (/tn_id/)

   psidim_id = (/ns_id, ns_id, tn_id/)
   psi2dim_id = (/ns_id, ns_id, tn_id/)

   ! create variables to store data
   call check(nf90_def_var(ncid, "xx", NF90_FLOAT, xxdim_id, xxvar_id))
   call check(nf90_def_var(ncid, "yy", NF90_FLOAT, yydim_id, yyvar_id))
   call check(nf90_def_var(ncid, "t", NF90_FLOAT, tdim_id, tvar_id))
   call check(nf90_def_var(ncid, "psi", NF90_FLOAT, psidim_id, psivar_id))
   call check(nf90_def_var(ncid, "psi2", NF90_FLOAT, psi2dim_id, psi2var_id))
   call check(nf90_enddef(ncid))
   print *, "creating simulation variables... done!"

   ! store the data in the variables
   call check(nf90_put_var(ncid, xxvar_id, xx))
   print *, "storing xx   variable data... done!"
   call check(nf90_put_var(ncid, yyvar_id, yy))
   print *, "storing yy   variable data... done!"
   call check(nf90_put_var(ncid, tvar_id, ts))
   print *, "storing t    variable data... done!"
   call check(nf90_put_var(ncid, psivar_id, psi))
   print *, "storing psi  variable data... done!"
   call check(nf90_put_var(ncid, psi2var_id, psi2))
   print *, "storing psi2 variable data... done!"

   ! close the nc file
   call check(nf90_close(ncid))

end subroutine saver

subroutine check(istatus)
   use netcdf
   implicit none

   integer, intent(in) :: istatus

   if (istatus /= nf90_noerr) then
      write (*, *) trim(adjustl(nf90_strerror(istatus)))
   end if
end subroutine check
