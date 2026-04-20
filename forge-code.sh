#!/bin/bash
# Forge-Code launcher — handles TTY detection and session wrapping
# Detaches from terminal if invoked from a non-TTY context (desktop shortcut, etc.)
# while preserving ZSH plugin integration for interactive sessions.

FORGE_BIN="/usr/bin/forge"
FORGE_LAUNCHER_VERSION="1"

# If no TTY is attached and FORGE_IN_SESSION is not set, detach cleanly.
# This prevents terminal-reserved xterms when launched from desktop files.
if [ ! -t 0 ] && [ -z "$FORGE_IN_SESSION" ]; then
    exec setsid -w "$FORGE_BIN" "$@" </dev/null >/dev/null 2>&1
else
    exec "$FORGE_BIN" "$@"
fi
