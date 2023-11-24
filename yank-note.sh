#!/bin/bash
_ELECTRON=/usr/bin/electron22
APPDIR="/usr/lib/yank-note"
export PATH="${APPDIR}:${PATH}"
_ASAR="${APPDIR}/app.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else复制从 AUR上的yank-note
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi