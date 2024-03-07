#!/bin/bash
set -e
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?