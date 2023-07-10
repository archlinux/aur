#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/wubi-dict-editor/wubi-dict-editor.asar "$@"
else
    exec electron --no-sandbox /opt/wubi-dict-editor/wubi-dict-editor.asar "$@"
fi