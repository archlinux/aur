# ===== MPI (autodetect via mpifort in PATH) =====
export USE_MPI=y
export USE_MPIF=y
export USE_MPIF4=y
export ARMCI_NETWORK=MPI-PR
# Do NOT set LIBMPI/MPI_LIB/MPI_INCLUDE here.

# ===== NWChem core =====
export NWCHEM_MODULES="all python"
export NWCHEM_TOP="$(pwd)"

# ===== Python (use system major.minor) =====
export USE_PYTHONCONFIG=y
export PYTHONVERSION="$(python -c 'import sys;print(f\"{sys.version_info[0]}.{sys.version_info[1]}\")')"
# PYTHONHOME not needed; NWChem uses python-config

# ===== Math libs: OpenBLAS (LP64) + ScaLAPACK (LP64) =====
export USE_64TO32=y
export BLAS_SIZE=4
export BLASOPT="-lopenblas"
export LAPACK_LIB="${BLASOPT}"

export USE_SCALAPACK=y
export SCALAPACK_SIZE=4
export SCALAPACK="-lscalapack"

# Optional QoL
export USE_NOFSCHECK=TRUE
