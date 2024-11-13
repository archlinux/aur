#!/usr/bin/env bash

# Set strict error handling
set -euo pipefail

# Define constants
readonly BOOSTEROID_BIN="/usr/bin/boosteroid.bin"
readonly QT_PLATFORM="xcb"

# Video acceleration and rendering flags - uncomment to use
declare -A FLAGS=(
#    [vdpau]="Video Decode and Presentation API for Unix (VDPAU)"
#    [vaapi]="Video Acceleration API (VA-API)"
#    [cuda]="NVIDIA cuda rendering"
#    [s]="software renderer"
)

# Set Qt platform
export QT_QPA_PLATFORM="${QT_PLATFORM}"

# Construct flags string
FLAGS_STRING=""
for flag in "${!FLAGS[@]}"; do
    # Skip commented flags (those with descriptions)
    if [[ -n "${FLAGS[$flag]}" ]]; then
        FLAGS_STRING+="-${flag} "
    fi
done

# Execute boosteroid with flags and pass through any additional arguments
exec "${BOOSTEROID_BIN}" ${FLAGS_STRING} "$@"
