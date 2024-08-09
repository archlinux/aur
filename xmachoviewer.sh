#!/bin/bash
set -euo pipefail
_APPDIR=/opt/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
cd "${_APPDIR}"
exec "${_RUNNAME}" "$@" || exit $?