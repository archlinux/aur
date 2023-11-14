#!/usr/bin/env bash

_scriptdir="$(dirname `readlink -f "$0"`)"

# Allow users to override command-line options
if [[ -f "$XDG_CONFIG_HOME/beeper-flags.conf" ]]; then
   _USER_FLAGS="$(cat $XDG_CONFIG_HOME/beeper-flags.conf)"
fi

# Launch
exec electron "${_scriptdir:?}/resources/app.asar" ${_USER_FLAGS} "$@"
