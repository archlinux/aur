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
command -v adb >/dev/null 2>&1 || { echo -e "${RED}Error: adb is not installed. Install Android platform tools.${NC}" >&2; exit 1; }

HAVE_NMAP=true
command -v nmap >/dev/null 2>&1 || HAVE_NMAP=false

# Prompt for device IP
echo -e "${YELLOW}┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${YELLOW}│           ADB Wireless Debug Scanner                │${NC}"
echo -e "${YELLOW}└─────────────────────────────────────────────────────┘${NC}"
echo -e "${BLUE}  ℹ Both devices must be connected to the same Wi-Fi / LAN${NC}"
echo ""

PAIR_MODE=false
if [[ "${1:-}" == "--pair" || "${1:-}" == "-p" ]]; then
    PAIR_MODE=true
    shift
fi

TARGET_IP="${1:-}"

if [[ -n "$TARGET_IP" ]]; then
    if [[ ! "$TARGET_IP" =~ ^[0-9]{1,3}(\.[0-9]{1,3}){3}$ ]]; then
        echo -e "${RED}Error: '$TARGET_IP' does not look like a valid IPv4 address.${NC}"
        exit 1
    fi
else
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
fi

if [[ "$PAIR_MODE" == true ]]; then
    echo ""
    echo -e "${BLUE}  ℹ On the device: Settings > Developer options > Wireless debugging > Pair device with pairing code${NC}"
    echo ""

    while true; do
        echo -ne "${GREEN}  Pairing port > ${NC}"
        read -r PAIR_PORT

        if [[ ! "$PAIR_PORT" =~ ^[0-9]{1,5}$ ]] || (( PAIR_PORT < 1 || PAIR_PORT > 65535 )); then
            echo -e "${RED}  Error: '$PAIR_PORT' is not a valid port number.${NC}"
        else
            break
        fi
    done

    while true; do
        echo -ne "${GREEN}  Pairing code > ${NC}"
        read -r PAIR_CODE

        if [[ ! "$PAIR_CODE" =~ ^[0-9]{6}$ ]]; then
            echo -e "${RED}  Error: pairing code must be 6 digits.${NC}"
        else
            break
        fi
    done

    echo ""
    echo -e "${GREEN}  Pairing with $TARGET_IP:$PAIR_PORT ...${NC}"

    PAIR_OUTPUT=$(adb pair "$TARGET_IP:$PAIR_PORT" "$PAIR_CODE" 2>&1)

    if echo "$PAIR_OUTPUT" | grep -q "Successfully paired"; then
        echo -e "${GREEN}  Paired successfully.${NC}"
    else
        echo -e "${RED}  Pairing failed.${NC}"
        echo "  Output: $PAIR_OUTPUT"
        exit 1
    fi
fi

echo ""
echo -e "${GREEN}  Looking up $TARGET_IP via adb mDNS discovery ...${NC}"
echo ""

# Ask adb's own mDNS discovery for the wireless debugging connect service.
# This is what the device already advertises, so it's faster and more
# reliable than a blind nmap port scan, and needs no extra dependency.
MDNS_OUTPUT=$(adb mdns services 2>/dev/null || true)
OPEN_PORTS=$(echo "$MDNS_OUTPUT" | grep "_adb-tls-connect\._tcp\." | awk -v ip="$TARGET_IP" '{n=split($NF, a, ":"); if (n == 2 && a[1] == ip) print a[2]}')

if [ -n "$OPEN_PORTS" ]; then
    echo -e "${GREEN}Found via mDNS:${NC}"
elif [ "$HAVE_NMAP" = true ]; then
    echo -e "${YELLOW}  No mDNS service found, falling back to nmap port scan ...${NC}"
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
else
    echo -e "${RED}No mDNS service found for $TARGET_IP, and nmap is not installed for a fallback scan.${NC}"
    echo -e "${RED}Install nmap (sudo pacman -S nmap) or make sure wireless debugging is enabled on the device.${NC}"
    exit 1
fi
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
