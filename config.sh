#=======================================================================#
#                              GA Settings                              #
#=======================================================================#

export CC=gcc
export CXX=g++
export FC=gfortran
export F77=gfortran

export USE_MPI=y
export USE_MPIF=y
export USE_MPIF4=y

export ARMCI_NETWORK=MPI-PR

export USE_64TO32=y

export BLASOPT="-lblas"
export BLAS_SIZE=4

export USE_SCALAPACK=y
export SCALAPACK_SIZE=4
export SCALAPACK="-lscalapack"

export LAPACK_LIB="-llapack"

#=======================================================================#
#                            NWChem Settings                            #
#=======================================================================#

export NWCHEM_TARGET="${NWCHEM_TARGET:-LINUX64}"
export NWCHEM_MODULES="all nwxc python"
export NWCHEM_TOP=$(pwd)

export USE_PYTHONCONFIG=y
export PYTHONVERSION="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
export PYTHONHOME=/usr

export LARGE_FILES=TRUE
export USE_NOFSCHECK=TRUE

export MRCC_METHODS=TRUE
#export CCSDTQ=TRUE
#export CCSDTLR=TRUE
#export IPCCSD=TRUE
#export EACCSD=TRUE

#=======================================================================#
#                             CUDA Settings                             #
#=======================================================================#

#export TCE_CUDA=y
#export CUDA_HOME=/opt/cuda
#export CUDA_LIBS="-L$CUDA_HOME/lib64 -lcudart"
#export CUDA_INCLUDE="-I. -I$CUDA_HOME/include"