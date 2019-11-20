export _gccver=8.3.0
export AMBER_PREFIX=/opt/ambertools
export AMBERHOME=/opt/ambertools
export PATH="${AMBER_PREFIX}/bin:${PATH}"

if [ -z "$PYTHONPATH" ]; then
    export PYTHONPATH="${AMBER_PREFIX}/lib/python2.7/site-packages"
else
    export PYTHONPATH="${AMBER_PREFIX}/lib/python2.7/site-packages:${PYTHONPATH}"
fi
if [ -z "${LD_LIBRARY_PATH}" ]; then
   export LD_LIBRARY_PATH="${AMBER_PREFIX}/lib"
else
   export LD_LIBRARY_PATH="${AMBER_PREFIX}/lib:${LD_LIBRARY_PATH}"
fi

if [ -d "/opt/cuda" ]; then
    export CUDA_HOME="/opt/cuda"
    export LD_LIBRARY_PATH="/opt/cuda/lib:/opt/cuda/lib64:${LD_LIBRARY_PATH}"
fi

export LD_LIBRARY_PATH="/usr/lib/gcc/x86_64-pc-linux-gnu/${_gccver}:${LD_LIBRARY_PATH}"
