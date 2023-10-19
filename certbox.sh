#!/bin/bash
_ELECTRON=/usr/bin/electron26
_APPDIR="/opt/certbox/resources/app/"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_APPDIR} "$@"
else
    exec ${_ELECTRON} ${_APPDIR} --no-sandbox "$@"
fi