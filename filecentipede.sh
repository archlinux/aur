#!/bin/sh
_APPDIR=/opt/@appname@
_APPNAME=@runappname@
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:$QT_PLUGIN_PATH"
cd "${_APPDIR}"
exec "${_APPDIR}/${_APPNAME}" "$@"