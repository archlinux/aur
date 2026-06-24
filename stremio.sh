#!/bin/bash
export SERVER_PATH=/usr/share/stremio/server.js

# https://github.com/Stremio/stremio-linux-shell/blob/main/data/stremio.sh
# Use GSK OpenGL renderer for Nvidia cards
VENDOR=$(glxinfo | grep "OpenGL vendor string:" | sed 's/.*: //')
RENDERER=$(glxinfo | grep "OpenGL renderer string:" | sed 's/.*: //')
if echo "$VENDOR $RENDERER" | grep -qi "NVIDIA"; then
    export GSK_RENDERER=opengl
fi

# Use the systems self-hosted stremio-web if available
if command -v stremio-web >/dev/null 2>&1; then
    /usr/bin/stremio-web &
    STREMIO_WEB_PID=$!
    URL_ARG="--url http://localhost:8080"
fi

/usr/lib/stremio/stremio $URL_ARG "$@"

if [ -n "$STREMIO_WEB_PID" ]; then
    kill $STREMIO_WEB_PID
fi
