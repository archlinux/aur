#!/bin/sh
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export GST_PLUGIN_SYSTEM_PATH="${_APPDIR}/gstreamer-1.0:${GST_PLUGIN_SYSTEM_PATH}"
export GST_PLUGIN_PATH="${_APPDIR}/gstreamer-1.0:${GST_PLUGIN_SYSTEM_PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@"
exit