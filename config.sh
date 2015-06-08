#=================================================
#=GA=Settings
#=================================================

export USE_MPI=yes
export USE_MPIF=yes
export USE_MPIF4=yes

export MPI_LOC=/usr/ #location of openmpi installation
export MPI_LIB=$MPI_LOC/lib/openmpi
export MPI_INCLUDE=$MPI_LOC/include/openmpi
export LIBMPI="-pthread -Wl,--enable-new-dtags -lmpi_usempif08 -lmpi_usempi_ignore_tkr -lmpi_mpifh -lmpi"

#=================================================
#=NWChem=Settings
#=================================================

export NWCHEM_MODULES="all python"
export NWCHEM_TOP=$(pwd)

export PYTHONHOME=/usr
export PYTHONVERSION=2.7
export PYTHONLIBTYPE=so
#export USE_PYTHON64=y

export BLASOPT="-llapack -lblas"

