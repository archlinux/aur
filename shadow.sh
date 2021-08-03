#!/bin/bash
set -e

APPDIR=/opt/shadow-tech
export PATH=${APPDIR}:${PATH}
export XDG_DATA_DIRS=${APPDIR}/usr/share/:${XDG_DATA_DIRS}
export LD_LIBRARY_PATH=${APPDIR}/resources/app.asar.unpacked/release/native:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${APPDIR}/usr/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${APPDIR}:${LD_LIBRARY_PATH}
export LD_PRELOAD=/usr/lib/libcurl.so.4

exec ${APPDIR}/shadow $@
