#!/bin/sh
set -e
APPDIR=/opt/shutter-encoder
export PATH="${APPDIR}/usr/bin/${PATH:+:$PATH}"
export LD_LIBRARY_PATH="${APPDIR}/usr/lib/x86_64-linux-gnu/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
EXEC=$(grep -e '^Exec=.*' "${HERE}"/*.desktop | head -n 1 | cut -d "=" -f 2 | cut -d " " -f 1)
exec "${APPDIR}/shutter-encoder" "$@"