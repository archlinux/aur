#!/bin/bash

if [[ "$XDG_CURRENT_DESKTOP" == "Hyprland" ]] || pgrep -x "Hyprland" > /dev/null; then
    export WEBKIT_DISABLE_DMABUF_RENDERER=1
fi

exec /usr/lib/fluautoclicker/fluautoclicker "$@"
