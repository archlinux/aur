#!/bin/bash
set -o pipefail
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/:${LD_LIBRARY_PATH}"
export LD_PRELOAD="${_APPDIR}/codecs/ogg.so:${_APPDIR}/codecs/vorbis.so:${LD_PRELOAD}"
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec "${_RUNNAME}" "$@" || exit $?