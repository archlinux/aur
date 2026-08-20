#!/bin/sh
# Rikkahub desktop app launcher (Arch Linux package).
# The Tauri shell spawns the bundled Bun sidecar and keeps user data under
# $XDG_DATA_HOME/rikkahub-pc (see the resolve-data-dir patch).
exec /opt/rikkahub-pc/rikkahub "$@"
