#!/bin/bash
# Wrapper for Stably AI Orca.
# The package ships the extracted AppImage tree in /opt/stably-orca
# and launches its AppRun directly — there is no .AppImage file at
# runtime, so AppImageLauncher has nothing to intercept.

# The upstream AppRun auto-detects APPDIR by walking parents looking for
# "$path/$1". When the first user-supplied argument is a flag (e.g.
# --disable-gpu), that probe never matches and APPDIR collapses to empty,
# so AppRun tries to exec /orca. Set APPDIR explicitly to bypass that.
export APPDIR=/opt/stably-orca

# Disable Vulkan: Electron's Wayland Ozone backend is not Vulkan-compatible,
# and on NVIDIA the Vulkan path makes the window render blank. Chromium falls
# back to GL and renders normally. Users can override by re-enabling features.
#
# Uncomment the Wayland line below if you run Hyprland/Sway and want native
# Wayland rendering instead of XWayland.
# exec "${APPDIR}/AppRun" --ozone-platform=wayland --disable-features=Vulkan "$@"
exec "${APPDIR}/AppRun" --disable-features=Vulkan "$@"
