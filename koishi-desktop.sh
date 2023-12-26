#!/bin/bash
set -e
_APPDIR="/opt/@appname@"
_RUNAPP="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${_APPDIR}/bin:${PATH}"
cd "${_APPDIR}"
exec "${_RUNAPP}" "$@" | exit