if command -v module 2>&1 >/dev/null; then
  module use /opt/nvidia/hpc_sdk/modulefiles
else
  nvhome=/opt/nvidia/hpc_sdk
  target=Linux_x86_64
  version=23.7

  nvcudadir=$nvhome/$target/$version/cuda
  nvcompdir=$nvhome/$target/$version/compilers
  nvmathdir=$nvhome/$target/$version/math_libs
  nvcommdir=$nvhome/$target/$version/comm_libs

  export NVHPC=$nvhome
  export NVHPC_ROOT=$nvhome/$target/$version
  export CC=$nvcompdir/bin/nvc
  export CXX=$nvcompdir/bin/nvc++
  export FC=$nvcompdir/bin/nvfortran
  export F90=$nvcompdir/bin/nvfortran
  export F77=$nvcompdir/bin/nvfortran
  export CPP=cpp

  export PATH=$nvcudadir/bin:"$PATH"
  export PATH=$nvcompdir/bin:"$PATH"
  export PATH=$nvcommdir/mpi/bin:"$PATH"
  export PATH=$nvcompdir/extras/qd/bin:"$PATH"

  export LD_LIBRARY_PATH=$nvcudadir/lib64:"$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH=$nvcudadir/extras/CUPTI/lib64:"$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH=$nvcompdir/extras/qd/lib:"$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH=$nvcompdir/lib:"$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH=$nvmathdir/lib64:"$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH=$nvcommdir/mpi/lib:"$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH=$nvcommdir/nccl/lib:"$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH=$nvcommdir/nvshmem/lib:"$LD_LIBRARY_PATH"

  export CPATH=$nvmathdir/include:"$CPATH"
  export CPATH=$nvcommdir/mpi/include:"$CPATH"
  export CPATH=$nvcommdir/nccl/include:"$CPATH"
  export CPATH=$nvcommdir/nvshmem/include:"$CPATH"
  export CPATH=$nvcompdir/extras/qd/include/qd:"$CPATH"

  export MANPATH=$nvcompdir/man:"$MANPATH"

  export OPAL_PREFIX=$nvcommdir/mpi
fi
