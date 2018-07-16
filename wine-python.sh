#!/bin/sh

set -e

export PYTHONHOME=/usr/@TRIPLE@
export PYTHONPATH=/usr/@TRIPLE@/lib/python@PYVER@

@TRIPLE@-wine /usr/@TRIPLE@/bin/python@PYVER@.exe "$@"
