#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_APPNAME=@apprunname@
export PATH="${_APPDIR}:${_APPDIR}/jre/bin:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/jre/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_APPDIR}/${_APPNAME}" "$@"