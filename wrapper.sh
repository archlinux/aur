#!/bin/sh
export VOUCH_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/vouch"
exec /usr/lib/vouch/vouch "$@"