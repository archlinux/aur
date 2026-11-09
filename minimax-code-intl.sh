#!/bin/sh
# MiniMax Code desktop launcher (international build).
# The bundled Electron runtime is installed without chrome-sandbox, so the
# Chromium sandbox is disabled the same way as the upstream catpaw port. The
# application keeps its own agent sandbox (bubblewrap) for tool execution.
set -eu
PROFILE="${MINIMAX_CODE_PROFILE:-${XDG_CONFIG_HOME:-$HOME/.config}/minimax-code-intl}"
exec /opt/minimax-code-intl/minimax-code --no-sandbox --user-data-dir="$PROFILE" "$@"
