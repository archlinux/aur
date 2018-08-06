#!/bin/sh

set -e

export PYTHONHOME=/usr/@TRIPLE@

if test -z "${PYTHONPATH}"
then
  export PYTHONPATH=/usr/@TRIPLE@/lib/python@PYVER@
else
  export PYTHONPATH="${PYTHONPATH};/usr/@TRIPLE@/lib/python@PYVER@"
fi

@TRIPLE@-wine /usr/@TRIPLE@/bin/python@PYVER@.exe "$@"
