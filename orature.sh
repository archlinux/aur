#!/bin/bash
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/jre/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/jre/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?