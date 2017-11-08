# Simple kill signal handling in Fortran

As mentioned
[many](https://wiki.scinet.utoronto.ca/wiki/index.php/Using_Signals#Trapping_signals_in_Fortran)
[places](https://www.sharcnet.ca/help/images/4/42/Fortran_Signal_Handling.pdf)
on the internet there isn't _one_ way for catching interrupt signals across all
platforms and compilers. This implementation aim to be platform and compiler
independent by:

- importing signal values from system-dependent C-header file
- registering the signal handler in C

To see how the example here works follow the instructions below:

1. Compile with cmake:

```
> mkdir build
> cd build/
> cmake ..
> make
```

2. And then run:

```
> ./signal_test

Sleeping...
Process completed
```

3. To see the effect of interrupting the program hit `CTRL-C` while it's running

```
> ./signal_test

Sleeping...
^C Process interrupted, exiting...
```

You can now implement any cleanup in the signal handling subroutine, for
example closing any open netCDF files. The necessary code is in [fsignal_test.f90](fsignal_test.f90) and [csigfun.c](csigfun.c)

Inspired from https://www.sharcnet.ca/help/images/4/42/Fortran_Signal_Handling.pdf
