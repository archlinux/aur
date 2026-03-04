#!/bin/bash
# ADB Wireless Debug Scanner and Connector
# Scans specific device for Android wireless debugging ports and connects

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if required tools are installed
command -v nmap >/dev/null 2>&1 || { echo -e "${RED}Error: nmap is not installed. Install it with: sudo pacman -S nmap${NC}" >&2; exit 1; }
command -v adb >/dev/null 2>&1 || { echo -e "${RED}Error: adb is not installed. Install Android platform tools.${NC}" >&2; exit 1; }

# Prompt for device IP
echo -e "${YELLOW}┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${YELLOW}│           ADB Wireless Debug Scanner                │${NC}"
echo -e "${YELLOW}└─────────────────────────────────────────────────────┘${NC}"
echo -e "${BLUE}  ℹ Both devices must be connected to the same Wi-Fi / LAN${NC}"
echo ""

while true; do
    echo -e "${YELLOW}  Enter your Android device's private LAN IP address${NC}"
    echo -e "${YELLOW}  (e.g. 192.168.1.42  —  find it in Settings > About > Status)${NC}"
    echo -ne "${GREEN}  IP > ${NC}"
    read -r TARGET_IP

    # Basic validation: ensure it's not empty and looks like an IP
    if [[ -z "$TARGET_IP" ]]; then
        echo -e "${RED}  Error: IP address cannot be empty.${NC}"
    elif [[ ! "$TARGET_IP" =~ ^[0-9]{1,3}(\.[0-9]{1,3}){3}$ ]]; then
        echo -e "${RED}  Error: '$TARGET_IP' does not look like a valid IPv4 address.${NC}"
    else
        break
    fi
    echo ""
done

echo ""
echo -e "${GREEN}  Scanning $TARGET_IP ...${NC}"
echo ""

PORT_START=31000
PORT_END=49000

# Scan for open ADB ports
SCAN_OUTPUT=$(nmap -p "$PORT_START-$PORT_END" --open -T4 -Pn "$TARGET_IP" 2>/dev/null)

# Extract open ports
OPEN_PORTS=$(echo "$SCAN_OUTPUT" | grep "^[0-9]" | grep "open" | awk '{print $1}' | cut -d'/' -f1)

if [ -z "$OPEN_PORTS" ]; then
    echo -e "${RED}No open ports found${NC}"
    exit 1
fi

echo -e "${GREEN}Found open port:${NC}"
for PORT in $OPEN_PORTS; do
    echo "  - $TARGET_IP:$PORT"
done
echo ""

# Try to connect to each open port
CONNECTED=false
for PORT in $OPEN_PORTS; do
    # Disconnect first to avoid conflicts
    adb disconnect "$TARGET_IP:$PORT" >/dev/null 2>&1 || true

    # Try to connect with adb
    CONNECT_OUTPUT=$(adb connect "$TARGET_IP:$PORT" 2>&1)

    if echo "$CONNECT_OUTPUT" | grep -q "connected"; then
        echo -e "${GREEN}Successfully connected to port $PORT${NC}"
        CONNECTED=true
    else
        echo -e "${RED}Failed to connect to port $PORT${NC}"
        echo "  Output: $CONNECT_OUTPUT"
    fi
done

if [ "$CONNECTED" = true ]; then
    exit 0
else
    echo -e "${RED}Could not connect to any open port${NC}"
    exit 1
fi
