#!/bin/sh
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
_ARGS="--enable-features=UseOzonePlatform --ozone-platform=wayland --ozone-platform-hint=wayland"
export PATH="${_APPDIR}:${PATH}"
export LD_LIBRARY_PATH="${_APPDIR}/swiftshader:${_APPDIR}/lib:${LD_LIBRARY_PATH}"
export ELECTRON_IS_DEV=0
export NODE_ENV=production
export ELECTRON_FORCE_IS_PACKAGED=true
cd "${_APPDIR}"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec "${_ARGS}" electron@electronversion@ "${_RUNNAME}" "$@" || exit $?
else
    exec "${_ARGS}" electron@electronversion@ "${_RUNNAME}" --no-sandbox "$@" || exit $?
fi