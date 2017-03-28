#!/bin/sh
export PYMOL_PATH="/opt/mgltools2/lib/python2.7/site-packages/pymol/pymol_path"
"/usr/bin/pythonsh-mg" "/opt/mgltools2/lib/python2.7/site-packages/pymol/__init__.py" "$@"
