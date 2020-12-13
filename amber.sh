export AMBERHOME="/opt/amber"
export PATH="${AMBERHOME}/bin:${PATH}"

if [ -z "${LD_LIBRARY_PATH}" ]; then
   export LD_LIBRARY_PATH="${AMBERHOME}/lib"
else
   export LD_LIBRARY_PATH="${AMBERHOME}/lib:${LD_LIBRARY_PATH}"
fi

if [ -z "${PERL5LIB}" ]; then
    export PERL5LIB="${AMBERHOME}/lib/perl"
else
    export PERL5LIB="${AMBERHOME}/lib/perl:${PERL5LIB}"
fi

export _pyver=3.9
if [ -z "${PYTHONPATH}" ]; then
    export PYTHONPATH="${AMBERHOME}/lib/python${_pyver}/site-packages"
else
    export PYTHONPATH="${AMBERHOME}/lib/python${_pyver}/site-packages:${PYTHONPATH}"
fi

export _gccver=9.3.0
export LD_LIBRARY_PATH="/usr/lib/gcc/x86_64-pc-linux-gnu/${_gccver}:${LD_LIBRARY_PATH}"
