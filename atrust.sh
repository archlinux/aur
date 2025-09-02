#!/bin/bash
set -o pipefail
_APPDIR=/usr/share/@appname@/@runpath@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/uem/bin:${_APPDIR}/uem/lib:${_APPDIR}/resources/bin:${_APPDIR}/resources/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export ELECTRON_FORCE_IS_PACKAGED=true
export NODE_ENV=production
cd "${_APPDIR}"
exec "${_RUNNAME}" --no-sandbox --disable-gpu "$@" || exit $?