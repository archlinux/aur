#!/bin/sh
set -e
_APPDIR=/opt/@appname@
_APPNAME=@runappname@
export LC_CTYPE=en_US.UTF-8
export PATH="${_APPDIR}:${PATH}"
cd "${_APPDIR}"
exec "${_APPDIR}/${_APPNAME}"