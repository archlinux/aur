#!/bin/sh

set -e

export PYTHONHOME=/usr/@TRIPLE@

if test -z "${PYTHONPATH}"
then
  export PYTHONPATH=/usr/@TRIPLE@/lib/python@PYVER@
else
  export PYTHONPATH="${PYTHONPATH};/usr/@TRIPLE@/lib/python@PYVER@"
fi

# https://bugs.winehq.org/show_bug.cgi?id=51813
set -o pipefail
@TRIPLE@-wine /usr/@TRIPLE@/bin/python@PYVER@.exe "$@" | tee
