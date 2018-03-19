export PGI=/opt/pgi
export PGI_HOME=${PGI}/linux86-64/@release@
export PATH=${PATH}:${PGI_HOME}/bin
export PATH=${PATH}:${PGI_HOME}/mpi/openmpi/bin
export PATH=${PATH}:${PGI_HOME}/mpi/mvapich/bin
if [[ -z ${LD_LIBRARY_PATH} ]] ; then
  export LD_LIBRARY_PATH=${PGI_HOME}/lib
  export LD_LIBRARY_PATH=${PGI_HOME}/mpi/openmpi/lib
else
  export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${PGI_HOME}/lib
  export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${PGI_HOME}/mpi/openmpi/lib
fi
if [[ -z ${MANPATH} ]] ; then
  export MANPATH=${PGI_HOME}/man
else
  export MANPATH=${MANPATH}:${PGI_HOME}/man
fi
if [[ -z ${LM_LICENSE_FILE} ]] ; then
  export LM_LICENSE_FILE=${PGI}/license.dat
else
  export LM_LICENSE_FILE=${LM_LICENSE_FILE}:${PGI}/license.dat
fi
