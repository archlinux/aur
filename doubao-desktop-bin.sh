#!/bin/sh
# Doubao Desktop - web app wrapper
URL="https://www.doubao.com/chat/"

# Try Chromium app-mode first (no address bar, feels native)
if command -v chromium >/dev/null 2>&1; then
    exec chromium --app="$URL" --class=Doubao "$@"
elif command -v google-chrome-stable >/dev/null 2>&1; then
    exec google-chrome-stable --app="$URL" --class=Doubao "$@"
elif command -v google-chrome >/dev/null 2>&1; then
    exec google-chrome --app="$URL" --class=Doubao "$@"
elif command -v microsoft-edge >/dev/null 2>&1; then
    exec microsoft-edge --app="$URL" --class=Doubao "$@"
fi

# Fallback: open in default browser
exec xdg-open "$URL"
