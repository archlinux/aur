#!/bin/sh
_APPDIR=/opt/@appname@
_APPNAME=@runappname@
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${LD_LIBRARY_PATH}"
cd "${_APPDIR}"
exec "${_APPDIR}/${_APPNAME}" "$@"