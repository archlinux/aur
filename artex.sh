#!/bin/sh
# Run ARTEX as the current user with per-user config and state.
# The artex.service unit uses /etc/artex and /var/lib/artex instead.
state=${XDG_DATA_HOME:-$HOME/.local/share}/artex
: "${ARTEX_CONFIG:=${XDG_CONFIG_HOME:-$HOME/.config}/artex/config.json}"
: "${ARTEX_JWT_KEY_DIR:=$state/keys}"
export ARTEX_CONFIG ARTEX_JWT_KEY_DIR
mkdir -p "$state/data" "$ARTEX_JWT_KEY_DIR"
exec /usr/lib/artex/artex -data "$state/data" "$@"
