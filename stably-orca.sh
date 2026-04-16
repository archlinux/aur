#!/bin/bash
# Wrapper for Stably AI Orca.
# The package ships the extracted AppImage tree in /opt/stably-orca
# and launches its AppRun directly — there is no .AppImage file at
# runtime, so AppImageLauncher has nothing to intercept.

# Uncomment the Wayland line below if you run Hyprland/Sway and want native
# Wayland rendering instead of XWayland.
# exec /opt/stably-orca/AppRun --ozone-platform=wayland "$@"
exec /opt/stably-orca/AppRun "$@"
