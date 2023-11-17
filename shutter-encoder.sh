#!/bin/sh
set -e
APPDIR=/opt/shutter-encoder
export PATH="${APPDIR}/usr/bin/${PATH:+:$PATH}"
export LD_LIBRARY_PATH="${APPDIR}/usr/lib/x86_64-linux-gnu/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
exec "${APPDIR}/shutter-encoder" "$@"