#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/pawtop-flags.conf ]]; then
    PAWTOP_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/pawtop-flags.conf)"
fi

if [[ " $@ " == *" --wayland "* ]]; then
    if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
        echo "Forcing Wayland"
        PAWTOP_USER_FLAGS="$PAWTOP_USER_FLAGS --enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL --ozone-platform=wayland"
    fi
fi

# Launch
exec electron /usr/lib/pawtop/app.asar $PAWTOP_USER_FLAGS "$@"
