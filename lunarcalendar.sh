#!/bin/bash
set -e
_APPDIR="/opt/@appname@"
export PATH="${_APPDIR}:${_APPDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/bin:${_APPDIR}/lib:${_APPDIR}/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"
_APPNAME="${_APPDIR}/@apprunname@"
cd "${_APPDIR}"
exec "${_APPDIR}/bin//@apprunname@" "$@"