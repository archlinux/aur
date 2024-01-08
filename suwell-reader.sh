#!/bin/bash
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/Reader_Pro/@runname@"
export PATH="${_APPDIR}/Reader_Pro:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/Reader_Pro:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/Reader_Pro:${QT_PLUGIN_PATH}"
cd "${_APPDIR}" || exit
exec "${_RUNNAME}" "$@" | exit