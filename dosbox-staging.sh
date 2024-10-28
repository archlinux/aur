#!/bin/bash
set -o pipefail
_APPDIR=/usr/lib/@appname@
_RUNNAME="${_APPDIR}/@runname@"
export PATH="${_APPDIR}:${PATH}"
case "${XDG_SESSION_TYPE}" in
    wayland)
        _ARGS="WAYLAND_DISPLAY=wayland"
    ;;
    x11)
        _ARGS="WAYLAND_DISPLAY=x11"
    ;;
esac
cd "${_APPDIR}" || { echo "Failed to change directory to ${_APPDIR}"; exit 1; }
exec env "${_ARGS}" "${_RUNNAME}" "$@" || exit $?