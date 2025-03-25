#!/bin/bash

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

if [[ -f "$XDG_CONFIG_HOME/anytype-flags.conf" ]]; then
  ANYTPE_USER_FLAGS="$(grep -v '^#' "$XDG_CONFIG_HOME/anytype-flags.conf")"
fi

# Launch
export ELECTRON_IS_DEV=0
exec /opt/Anytype/anytype $ANYTPE_USER_FLAGS "$@"
