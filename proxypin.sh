#!/bin/bash
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}/lib:${PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?