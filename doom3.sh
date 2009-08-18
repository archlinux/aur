#!/bin/sh
cd /opt/doom3
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
exec ./doom.x86 $*
