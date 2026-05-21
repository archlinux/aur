#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/antigravity-ide-flags.conf ]]; then
    ANTIGRAVITY_IDE_USER_FLAGS="$(sed 's/#.*//' $XDG_CONFIG_HOME/antigravity-ide-flags.conf | tr '\n' ' ')"
fi

# Launch
exec /opt/antigravity-ide/bin/antigravity-ide "$@" $ANTIGRAVITY_IDE_USER_FLAGS
