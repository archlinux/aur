#!/bin/bash

export CC=gcc
export CFLAGS="${CFLAGS} -Wno-old-style-definition -Wno-implicit-function-declaration -std=gnu89"
export FFLAGS="${FFLAGS} -std=legacy"
export CXX=g++
export FC=gfortran
export F77=gfortran

# Essential NWChem build variables
export NWCHEM_TOP="${srcdir}/${_pkgname}"
export NWCHEM_TARGET=LINUX64
export NWCHEM_MODULES="all python"

# MPI Configuration
export USE_MPI=y
export USE_MPIF=y
export USE_MPIF4=y
export ARMCI_NETWORK=MPI-PR

# Python Configuration
# Arch typically uses Python 3.x
export USE_PYTHONCONFIG=y
export PYTHONVERSION=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
export PYTHONHOME=/usr

# Use system OpenBLAS (Arch packages OpenBLAS with LP64, not ILP64)
export USE_64TO32=y
export BLAS_SIZE=4
export BLASOPT="-lopenblas -lpthread -lrt"
export LAPACK_LIB="-lopenblas"
export BUILD_SCALAPACK=y
export SCALAPACK_SIZE=4

# ScaLAPACK support (Arch provides scalapack package)
# export USE_SCALAPACK=y
# export SCALAPACK_SIZE=4
# export SCALAPACK="-L/usr/lib -lscalapack"
# export SCALAPACK_LIB="-L/usr/lib -lscalapack"

# Recommended optimizations for modern systems
export USE_NOIO=TRUE
export USE_NOFSCHECK=TRUE

# Add MPI compiler wrappers to PATH if not already there
if command -v mpif90 &> /dev/null; then
    # Let NWChem auto-detect MPI settings from mpif90
    export PATH="/usr/bin:$PATH"
else
    # Fallback: manually specify MPI paths
    export MPI_INCLUDE=/usr/include/openmpi
    export MPI_LIB=/usr/lib/openmpi
    export LIBMPI="-lmpi_usempif08 -lmpi_mpifh -lmpi"
fi
