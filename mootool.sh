#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_APPNAME=@runappname@
export PATH="${_APPDIR}:${PATH}"
cd "${_APPDIR}"
exec "${_APPDIR}/${_APPNAME}"