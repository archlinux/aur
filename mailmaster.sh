#!/bin/bash
set -o pipefail
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
# Use bundled Qt libraries with proper plugin path
export LD_LIBRARY_PATH="${_APPDIR}:${_APPDIR}/lib:/usr/lib:${LD_LIBRARY_PATH}"
export QT_PLUGIN_PATH="${_APPDIR}/plugins:/usr/lib/qt/plugins:${QT_PLUGIN_PATH}"
# Set Qt platform to xcb
export QT_QPA_PLATFORM=xcb
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
./@runname@ "$@" || exit $?