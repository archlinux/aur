F90 = gfortran
F77 = $(F90)
F90_OPTS = -O3 -march=native -fopenmp -DUSEOMP -ffree-line-length-0 -fallow-argument-mismatch
F77_OPTS = $(F90_OPTS)
FCCPP = cpp
CPP_ON_OPTS = -cpp -DXS -DISO -DLIBXC
LIB_ARP = -larpack
export USE_SYS_LAPACK=true
LIB_LPK = -llapack -lblas
LIB_FFT = fftlib.a
LIB_BZINT = libbzint.a
LIB_SCLPK = -lscalapack

LIBS = $(LIB_ARP) $(LIB_LPK) $(LIB_FFT) $(LIB_BZINT) -lgomp

F90_DEBUGOPTS = -g -fbounds-check -fbacktrace -Wall -ffree-line-length-0
F77_DEBUGOPTS = $(F90_DEBUGOPTS)

MPIF90 = mpif90
MPIF90_OPTS = $(F90_OPTS) $(CPP_ON_OPTS) -DMPI -DMPIRHO -DMPISEC
F77MT = $(F77)
F90MT = $(F90)
SMP_LIBS = $(LIBS)
SMPF90_OPTS = -fopenmp $(F90_OPTS) 
SMPF77_OPTS = $(SMPF90_OPTS) 

BUILDMPI = true
LIBS_MPI = $(LIB_SCLPK) 
MPIF90_CPP_OPTS += $(CPP_SCLPK)
