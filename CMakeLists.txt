project(signal_test C Fortran)

add_library(clib csigfun.c)

add_executable(signal_test fsignal_test.f90)
target_link_libraries(signal_test clib)
