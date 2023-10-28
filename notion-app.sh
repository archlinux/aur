#!/bin/sh

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/notion-flags.conf ]]; then
    NOTION_USER_FLAGS="$(grep -v '^#' $XDG_CONFIG_HOME/notion-flags.conf)"
fi

# Launch
exec electron /usr/lib/notion-app/app.asar $NOTION_USER_FLAGS "$@"
