#!/bin/bash
# Wrapper for Stably AI Orca AppImage.
# Disable AppImageLauncher integration: the package already ships a
# .desktop entry and the AppImage lives in /opt under pacman's control,
# so AppImageLauncher's "move and integrate" flow would break the package.
export APPIMAGELAUNCHER_DISABLE=1

# Uncomment the Wayland line below if you run Hyprland/Sway and want native
# Wayland rendering instead of XWayland.
# exec /opt/stably-orca/orca.AppImage --ozone-platform=wayland "$@"
exec /opt/stably-orca/orca.AppImage "$@"
