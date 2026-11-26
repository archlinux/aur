#!/bin/sh

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

if [ -f "$XDG_CONFIG_HOME/pawtop-flags.conf" ]; then
    PAWTOP_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/pawtop-flags.conf")"
fi

case " $* " in
    *" --wayland "*)
        if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
            echo "Forcing Wayland"
            PAWTOP_USER_FLAGS="$PAWTOP_USER_FLAGS --enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL --ozone-platform=wayland"
        fi
        ;;
esac

exec /usr/lib/pawtop/pawtop $PAWTOP_USER_FLAGS "$@"
