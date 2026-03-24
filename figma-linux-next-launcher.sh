#!/bin/bash
# figma-linux-next launcher

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    OZONE_FLAGS="--ozone-platform-hint=auto --enable-features=UseOzonePlatform,WaylandWindowDecorations"
else
    OZONE_FLAGS=""
fi

PERF_FLAGS="--ignore-gpu-blocklist \
            --enable-gpu-rasterization \
            --enable-zero-copy \
            --enable-features=VaapiVideoDecoder,VaapiVideoEncoder,CanvasOopRasterization \
            --enable-accelerated-2d-canvas \
            --enable-webgl \
            --enable-webgl2-compute-context \
            --disable-smooth-scrolling"

MEMORY_FLAGS="--js-flags='--max-old-space-size=4096' \
              --disk-cache-size=104857600"

if command -v electron &> /dev/null; then
    ELECTRON_BIN="electron"
elif [ -f "/usr/lib/electron/electron" ]; then
    ELECTRON_BIN="/usr/lib/electron/electron"
else
    echo "Error: electron not found. Install it: sudo pacman -S electron" >&2
    exit 1
fi

if [ -f "/usr/lib/figma-linux-next/dist/main/main.js" ]; then
    APP_PATH="/usr/lib/figma-linux-next"
elif [ -f "./dist/main/main.js" ]; then
    APP_PATH="."
else
    echo "Error: figma-linux-next app not found in /usr/lib/figma-linux-next" >&2
    exit 1
fi

exec "$ELECTRON_BIN" "$APP_PATH" \
    $OZONE_FLAGS \
    $PERF_FLAGS \
    $MEMORY_FLAGS \
    "$@"
