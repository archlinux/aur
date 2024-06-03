#!/bin/bash
set -o pipefail
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/jre/bin:${PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?