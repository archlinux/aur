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
