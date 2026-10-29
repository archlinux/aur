#!/bin/sh
# OpenCode Studio launcher: backend API (127.0.0.1:1920+) + web UI (localhost:1080)
BASE=/usr/lib/opencode-studio
UI_PORT="${STUDIO_UI_PORT:-1080}"

node "$BASE/server/index.js" &
BACKEND=$!
PORT="$UI_PORT" HOSTNAME=127.0.0.1 NODE_ENV=production node "$BASE/client/server.js" &
FRONTEND=$!

cleanup() {
    kill "$BACKEND" "$FRONTEND" 2>/dev/null
    wait 2>/dev/null
}
trap cleanup EXIT INT TERM

sleep 2
xdg-open "http://localhost:$UI_PORT" >/dev/null 2>&1 &

wait "$FRONTEND"
