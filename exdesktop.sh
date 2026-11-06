#!/bin/sh
DIR=/opt/exdesktop
export LD_LIBRARY_PATH="$DIR/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export PYTHONHOME="$DIR/python311"
exec "$DIR/exDesktop-bin" "$@"
