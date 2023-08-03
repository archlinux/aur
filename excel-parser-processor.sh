#!/bin/bash
_ELECTRON=/usr/bin/electron13
_ASAR="/opt/excel-parser-processor/excel-parser-processor.asar"
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} ${_ASAR} "$@"
else
    exec ${_ELECTRON} ${_ASAR} --no-sandbox "$@"
fi