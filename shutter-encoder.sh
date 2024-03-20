#!/bin/bash
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}/usr/bin:${_APPDIR}/usr/bin/JRE/bin:${_APPDIR}/usr/bin/Library:$PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/usr/lib/x86_64-linux-gnu:${_APPDIR}/usr/bin/JRE/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?