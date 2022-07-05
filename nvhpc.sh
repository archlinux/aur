if command -v module 2>&1 >/dev/null; then
  module use /opt/nvidia/modulefiles
else
export nvhome=/opt/nvidia
export target=Linux_x86_64
export version=22.5

export nvcudadir=$nvhome/$target/$version/cuda
export nvcompdir=$nvhome/$target/$version/compilers
export nvmathdir=$nvhome/$target/$version/math_libs
export nvcommdir=$nvhome/$target/$version/comm_libs

export NVHPC=$nvhome
export CC=$nvcompdir/bin/nvc
export CXX=$nvcompdir/bin/nvc++
export FC=$nvcompdir/bin/nvfortran
export F90=$nvcompdir/bin/nvfortran
export F77=$nvcompdir/bin/nvfortran
export CPP=cpp

export PATH=$nvcudadir/bin:$PATH
export PATH=$nvcompdir/bin:$PATH
export PATH=$nvcommdir/mpi/bin:$PATH

export LD_LIBRARY_PATH=$nvcudadir/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$nvcompdir/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$nvmathdir/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$nvcommdir/mpi/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$nvcommdir/nccl/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$nvcommdir/nvshmem/lib:$LD_LIBRARY_PATH

export CPATH=$nvcudadir/include:$CPATH
export CPATH=$nvmathdir/include:$CPATH
export CPATH=$nvcommdir/mpi/include:$CPATH
export CPATH=$nvcommdir/nccl/include:$CPATH
export CPATH=$nvcommdir/nvshmem/include:$CPATH

export MANPATH=$nvcompdir/man:$MANPATH

export OPAL_PREFIX=$nvcommdir/mpi
fi
