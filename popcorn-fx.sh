#!/bin/bash
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/main/runtimes/17.0.6/jre/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/main/0.7.5:${_APPDIR}/main/runtimes/17.0.6/jre/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?