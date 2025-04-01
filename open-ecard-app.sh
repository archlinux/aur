#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/bin/@runname@"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export PATH="${_APPDIR}/bin:${JAVA_HOME}/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${_APPDIR}/lib/runtime/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?