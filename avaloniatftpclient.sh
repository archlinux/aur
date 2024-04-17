#!/bin/bash
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
_OPTIONS="@options@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export LC_CTYPE=en_US.UTF-8
exec "${_RUNNAME}" "${_OPTIONS}" "$@" || exit $?