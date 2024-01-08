#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}/usr/bin/${PATH:+:$PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/usr/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" | exit