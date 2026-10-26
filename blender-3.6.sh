#!/bin/bash
_BLENDER_DIR="/opt/blender-3.6-lts"
export LD_LIBRARY_PATH="${_BLENDER_DIR}/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

# Ensure opaque XWayland surface to prevent Wayland EGL visual transparency glitches
if [ -n "$WAYLAND_DISPLAY" ]; then
    export WAYLAND_DISPLAY=""
    export DISPLAY="${DISPLAY:-:0}"
fi

exec "${_BLENDER_DIR}/blender" "$@"

