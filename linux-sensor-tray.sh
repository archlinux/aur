#!/usr/bin/env bash
# AUR-installed copy: pacman owns updates, so disable in-app auto-updater.
export LST_SKIP_AUTO_UPDATE=1
exec /opt/linux-sensor-tray/linux-sensor-tray "$@"
