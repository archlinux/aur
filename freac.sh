#!/bin/sh
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/:${LD_LIBRARY_PATH}"
export LD_PRELOAD="${_APPDIR}/codecs/ogg.so:${_APPDIR}/codecs/vorbis.so:${LD_PRELOAD}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit