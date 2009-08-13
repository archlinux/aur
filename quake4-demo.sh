#!/bin/sh
cd /opt/quake4-demo
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.
exec ./quake4.x86 "$@"
