#!/bin/bash

if [ -z "$XDG_DATA_HOME" ]; then
    SAVEPATH="$HOME/.local/share/sm64coopdx"
else
    SAVEPATH="$XDG_DATA_HOME/sm64coopdx"
fi

mkdir -p "$SAVEPATH"

LD_LIBRARY_PATH="/usr/lib/sm64coopdx:$LD_LIBRARY_PATH" \
    /usr/share/sm64coopdx/sm64coopdx \
    --savepath "$SAVEPATH" "$@"