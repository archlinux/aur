#!/bin/sh
set -e
_APPDIR="/opt/@appname@"
_RUNNAME="${_APPDIR}/@runappname@"
export LC_CTYPE=en_US.UTF-8
export PATH="${_APPDIR}:${PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" | exit