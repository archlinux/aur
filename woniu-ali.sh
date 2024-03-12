#!/bin/bash
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
_OPTIONS="@options@"
export JAVA_HOME="${_APPDIR}/jre"
export PATH="${_APPDIR}:${JAVA_HOME}/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/jre/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "${_OPTIONS}" "$@" || exit $?