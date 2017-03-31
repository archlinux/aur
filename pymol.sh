#!/bin/sh
export PYMOL_PATH="/opt/mgltools2/lib/python2.7/site-packages/pymol/pymol_path"
export LD_PRELOAD='/usr/lib/libstdc++.so.6 /usr/lib/libgcc_s.so.1 /usr/lib/libxcb.so.1 /usr/lib/libz.so' 
"/usr/bin/pythonsh-mg" "/opt/mgltools2/lib/python2.7/site-packages/pymol/__init__.py" "$@"
