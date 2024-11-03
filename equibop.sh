#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/equibop-flags.conf ]]; then
    EQUIBOP_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/equibop-flags.conf)"
fi

if [[ " $@ " == *" --wayland "* ]]; then
    if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
        echo "Forcing Wayland"
        EQUIBOP_USER_FLAGS="$EQUIBOP_USER_FLAGS --enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL --ozone-platform=wayland"
    fi
fi

# Launch
exec electron33 /usr/lib/equibop/app.asar $EQUIBOP_USER_FLAGS "$@"
