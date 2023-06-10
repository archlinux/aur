#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/bluemail-flags.conf ]]; then
   BLUEMAIL_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/bluemail-flags.conf | tr '\n' ' ')"
fi

# Launch
# Currently, the application is broken under Wayland and requires --no-sandbox to launch.
# --ozone-platform=x11 and --no-sandbox flags are enforced to workaround this.
# To be removed after Bluemail updates their Electron (which is still at v13.3.0...)
exec /opt/bluemail/bluemail $BLUEMAIL_USER_FLAGS --no-sandbox --ozone-platform=x11 "$@"
