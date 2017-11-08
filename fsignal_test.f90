program fsignal_test
   call register_kill_signal_handler(handle_sigkill)

   print *, "Sleeping..."
   call sleep(20) ! Do something that will take some time
   print *, "Process completed"

contains
   subroutine handle_sigkill
      print *, "Process interrupted, exiting..."
      call exit(0)
   end subroutine handle_sigkill
end program

