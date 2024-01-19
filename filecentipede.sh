#!/bin/sh
_APPDIR=/opt/@appname@
_RUNNAME=@runname@
export PATH="${_APPDIR}:${_APPDIR}/lib:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/lib:${_APPDIR}/lib/platforms:${_APPDIR}/lib/platforms/imageformats:${_APPDIR}/lib/platforms/platforminputcontexts:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:$QT_PLUGIN_PATH"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?