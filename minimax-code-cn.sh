#!/bin/sh
# MiniMax Code desktop launcher (mainland-China build).
set -eu
PROFILE="${MINIMAX_CODE_PROFILE:-${XDG_CONFIG_HOME:-$HOME/.config}/minimax-code-cn}"
exec /opt/minimax-code-cn/minimax-code-cn --no-sandbox --user-data-dir="$PROFILE" "$@"
