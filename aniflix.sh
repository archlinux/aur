#!/bin/bash
if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec electron /opt/aniflix/aniflix.asar "$@"
else
    exec electron --no-sandbox /opt/aniflix/aniflix.asar "$@"
fi