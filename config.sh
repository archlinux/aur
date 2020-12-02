#=======================================================================#
#                              GA Settings                              #
#=======================================================================#

export CC=gcc
export CXX=g++
export FC=gfortran
export F77=gfortran

export USE_MPI=yes
export MPI_LOC=/usr
export MPI_LIB=$MPI_LOC/lib/openmpi
export MPI_INCLUDE=$MPI_LOC/include
export LIBMPI="-lmpi_usempif08 -lmpi_usempi_ignore_tkr -lmpi_mpifh -lmpi"

export ARMCI_NETWORK=MPI-PR

export USE_64TO32=y

export HAS_BLAS=yes
export BLASOPT="-lblas"
export BLAS_SIZE=4

export USE_SCALAPACK=y
export SCALAPACK_SIZE=4
export SCALAPACK="-lscalapack"

export LAPACK_SIZE=4
export LAPACK_LIB="-llapack"

#=======================================================================#
#                            NWChem Settings                            #
#=======================================================================#

export NWCHEM_TARGET=LINUX64
export NWCHEM_MODULES="all nwxc python"
export NWCHEM_TOP=$(pwd)

export USE_PYTHONCONFIG=y
export PYTHONHOME=/usr
export PYTHONVERSION=3.9
export PYTHONLIBTYPE=so

export LARGE_FILES=TRUE
export USE_NOFSCHECK=TRUE

export MRCC_METHODS=y
export CCSDTQ=y
export CCSDTLR=y
export IPCCSD=y
export EACCSD=y

#=======================================================================#
#                             CUDA Settings                             #
#=======================================================================#

#export TCE_CUDA=y
#export CUDA_HOME=/opt/cuda
#export CUDA_LIBS="-L$CUDA_HOME/lib64 -lcudart"
#export CUDA_INCLUDE="-I. -I$CUDA_HOME/include"
