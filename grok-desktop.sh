#!/bin/sh
# Pacman owns upgrades. The upstream updater installs GitHub AppImages.
export GROK_DESKTOP_DISABLE_UPDATER=1
exec /usr/lib/grok-desktop/grok-desktop "$@"
