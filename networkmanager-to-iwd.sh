#!/bin/bash

NM_DIR="/etc/NetworkManager/system-connections"
IWD_DIR="/var/lib/iwd"

if [[ $EUID -ne 0 ]]; then
    echo "Run the script via sudo or as root."
    exit 1
fi

if [ ! -d "$NM_DIR" ]; then
    echo "Folder not found $NM_DIR"
    exit 1
fi

echo "Starting the transfer of networks from NetworkManager to iwd..."

for FILE in "$NM_DIR"/*.nmconnection; do
    [ -e "$FILE" ] || continue

    SSID=$(grep '^ssid=' "$FILE" | head -n1 | cut -d'=' -f2 | tr -d '"')
    PSK=$(grep '^psk=' "$FILE" | head -n1 | cut -d'=' -f2)

    if [[ -z "$SSID" ]]; then
        echo "Missing $FILE (no SSID)"
        continue
    fi

    SAFE_SSID=$(echo "$SSID" | sed 's/[^a-zA-Z0-9_-]/_/g')
    PROFILE="$IWD_DIR/${SAFE_SSID}.psk"

    echo "Create a profile for the SSID: $SAFE_SSID"

    {
        if [[ -n "$PSK" ]]; then
            echo "[Security]"
            echo "PreSharedKey=$PSK"
        else
            echo "[Security]"
            echo "KeyManagement=none"
        fi

        echo
        echo "[Settings]"
        echo "AutoConnect=true"
        echo
        echo "[IPv4]"
        echo "Method=auto"
        echo
        echo "[IPv6]"
        echo "Method=auto"
    } > "$PROFILE"

    chmod 600 "$PROFILE"
done

echo "Done! Check profiles in $IWD_DIR."

read -p "Restart iwd now? (y/n) " yn
case $yn in
    [Yy]* ) systemctl restart iwd; echo "iwd restarted.";;
    * ) echo "Okey, I'm not restarting.";;
esac
