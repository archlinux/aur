#!/usr/bin/env bash

# Allow users to override command-line options
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
_FLAGFILE="$XDG_CONFIG_HOME/mercury-flags.conf"
if [[ -f "$_FLAGFILE" ]]; then
  _USER_FLAGS=$(cat "$_FLAGFILE")
fi

# Launch
exec /opt/mercury-browser-sse4/mercury $_USER_FLAGS "$@"

