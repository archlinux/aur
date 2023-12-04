#!/bin/bash
set -e
_APPNAME=bluebubbles
_APPDIR="/opt/${_APPNAME}"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_APPDIR}/${_APPNAME}" %U "$@"