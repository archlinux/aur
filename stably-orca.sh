#!/bin/bash
# Wrapper for Stably AI Orca AppImage.
# Uncomment the Wayland line below if you run Hyprland/Sway and want native
# Wayland rendering instead of XWayland.
# exec /opt/stably-orca/orca.AppImage --ozone-platform=wayland "$@"
exec /opt/stably-orca/orca.AppImage "$@"
