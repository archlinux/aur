#!/bin/bash
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LIBRARY_PATH="${_APPDIR}/lib:${LIBRARY_PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit