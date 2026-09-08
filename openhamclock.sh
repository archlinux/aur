#!/bin/bash
# OpenHamClock CLI & Desktop Launcher

APP_DIR="/usr/lib/openhamclock"

# Load environment configuration if present and readable
if [ -r "$HOME/.config/openhamclock/openhamclock.env" ]; then
    set -a
    # shellcheck source=/dev/null
    source "$HOME/.config/openhamclock/openhamclock.env"
    set +a
elif [ -r "/etc/openhamclock/openhamclock.env" ]; then
    set -a
    # shellcheck source=/dev/null
    source "/etc/openhamclock/openhamclock.env"
    set +a
fi

export NODE_ENV="${NODE_ENV:-production}"
export PORT="${PORT:-3000}"
export HOST="${HOST:-0.0.0.0}"

OPEN_BROWSER=false

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -b|--browser)
            OPEN_BROWSER=true
            shift
            ;;
        -p|--port)
            if [ -n "$2" ]; then
                export PORT="$2"
                shift 2
            else
                echo "Error: --port requires a port number" >&2
                exit 1
            fi
            ;;
        -h|--help)
            echo "OpenHamClock — Modern Web-Based Amateur Radio Dashboard"
            echo ""
            echo "Usage: openhamclock [options]"
            echo ""
            echo "Options:"
            echo "  -b, --browser        Open default web browser automatically once started"
            echo "  -p, --port <port>    Set HTTP server port (default: 3000, or from PORT env)"
            echo "  -h, --help           Show this help message"
            echo ""
            echo "Configuration files loaded (in order of priority):"
            echo "  1. ~/.config/openhamclock/openhamclock.env"
            echo "  2. /etc/openhamclock/openhamclock.env"
            echo ""
            echo "Systemd service commands:"
            echo "  System service: sudo systemctl enable --now openhamclock"
            echo "  User service:   systemctl --user enable --now openhamclock"
            exit 0
            ;;
        *)
            break
            ;;
    esac
done

if [ "$OPEN_BROWSER" = true ]; then
    (
        for _ in {1..30}; do
            if curl -s "http://localhost:${PORT}/api/health" >/dev/null 2>&1 || nc -z 127.0.0.1 "${PORT}" 2>/dev/null; then
                break
            fi
            sleep 0.2
        done
        if command -v xdg-open >/dev/null 2>&1; then
            xdg-open "http://localhost:${PORT}"
        fi
    ) &
fi

cd "$APP_DIR" || exit 1
exec /usr/bin/node server.js "$@"
