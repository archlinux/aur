#!/bin/bash
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/Reader_Pro/@runname@"
export PATH="${_APPDIR}/Reader_Pro:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/Reader_Pro:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/Reader_Pro:${QT_PLUGIN_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?