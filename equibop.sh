#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/equibop-flags.conf ]]; then
    EQUIBOP_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/equibop-flags.conf)"
fi

# Detect Wayland and add specific flags if running on Wayland
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    EQUIBOP_USER_FLAGS="$EQUIBOP_USER_FLAGS --enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL --ozone-platform=wayland"
fi

# Launch
exec electron33 /usr/lib/equibop/app.asar $EQUIBOP_USER_FLAGS "$@"
