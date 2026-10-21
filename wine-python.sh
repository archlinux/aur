#!/bin/sh

set -e

export PYTHONHOME=/usr/@TRIPLE@

if test -z "${PYTHONPATH}"
then
  export PYTHONPATH=/usr/@TRIPLE@/lib/python@PYVER@
else
  export PYTHONPATH="${PYTHONPATH};/usr/@TRIPLE@/lib/python@PYVER@"
fi

if test -z "${PYTHON_PATHCONFIG_WARNINGS}"
then
  export PYTHON_PATHCONFIG_WARNINGS=0
fi

# https://bugs.winehq.org/show_bug.cgi?id=51813
set -o pipefail
@TRIPLE@-wine /usr/@TRIPLE@/bin/python@PYVER@.exe "$@" | tee
