#!/bin/sh
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
cd "${_APPDIR}" || exit
exec "${_RUNNAME}" "$@"
exit