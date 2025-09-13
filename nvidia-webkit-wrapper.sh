#!/bin/bash
DIR=$(readlink -f "$0" | xargs dirname)
export LD_LIBRARY_PATH="$DIR/bin:$LD_LIBRARY_PATH"

# Enable WEBKIT_DISABLE_DMABUF_RENDERER with NVIDIA on Wayland
if [ "$XDG_SESSION_TYPE" = "wayland" ] && [ "$ZINK_DISABLE_OVERRIDE" != "1" ]; then
    if command -v glxinfo >/dev/null 2>&1; then
        VENDOR=$(glxinfo | grep "OpenGL vendor string:" | sed 's/.*: //')
        RENDERER=$(glxinfo | grep "OpenGL renderer string:" | sed 's/.*: //')
        if echo "$VENDOR $RENDERER" | grep -qi "NVIDIA"; then
            export WEBKIT_DISABLE_DMABUF_RENDERER=1
        fi
    fi
fi

exec "$DIR/deadlock-modmanager-bin" "$@"
