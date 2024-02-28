#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/jre/bin:${PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?