#!/bin/sh

export LD_LIBRARY_PATH=/opt/cajviewer/lib:$LD_LIBRARY_PATH 

exec /opt/cajviewer/bin/cajviewer "$@"
