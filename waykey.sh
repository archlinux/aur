#!/bin/bash
# Waykey CLI / Dashboard Launcher

# 1. Root Check
if [ "$EUID" -eq 0 ]; then
  echo "❌ Error: Waykey should NOT be run as root or with sudo."
  echo "Running as root breaks D-Bus connections and browser sandboxing."
  echo "Please run: ./waykey.sh"
  exit 1
fi

# 2. Environment Check
if [ -z "$XDG_RUNTIME_DIR" ] || [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  echo "⚠️ Warning: XDG_RUNTIME_DIR or DBUS_SESSION_BUS_ADDRESS not set."
  echo "This may cause issues with systemd-user or D-Bus communication."
fi

echo "🚀 Starting Waykey background service..."
if ! systemctl --user start waykey.service 2>/dev/null; then
    echo "❌ Failed to start waykey.service via systemctl --user."
    echo "Make sure you have a valid user session and systemd is running."
    exit 1
fi

# 3. Wait for Dashboard to be ready (max 5 seconds)
echo "⏳ Waiting for WayKey Dashboard (http://localhost:8080)..."
MAX_RETRIES=10
RETRY_COUNT=0
while ! node -e "require('http').get('http://localhost:8080/ping', res => res.statusCode === 200 ? process.exit(0) : process.exit(1)).on('error', () => process.exit(1))" 2>/dev/null; do
    sleep 0.5
    ((RETRY_COUNT++))
    if [ $RETRY_COUNT -ge $MAX_RETRIES ]; then
        echo "⚠️ Dashboard taking too long to respond. Attempting to open anyway..."
        break
    fi
done

echo "🌐 Opening Waykey Dashboard..."
xdg-open http://localhost:8080