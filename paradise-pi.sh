#!/bin/bash
_ELECTRON=/usr/bin/electron24
_APPDIR="/opt/paradise-pi/resources/app"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec "${_ELECTRON}" "${_APPDIR}" "$@"
else
    exec "${_ELECTRON}" "${_APPDIR}" --no-sandbox "$@"
fi