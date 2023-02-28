#!/bin/bash

export ELECTRON_FORCE_IS_PACKAGED=true

if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec @ELECTRON@ /usr/lib/aliyunpan-liupan1890/app.asar "$@"
else
    exec electron20 --no-sandbox /usr/lib/aliyunpan-liupan1890/app.asar "$@"
fi
