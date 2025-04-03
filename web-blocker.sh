#!/bin/bash

# Web Blocker - A tool to block websites using iptables
# Version: 1.0
# Author: Duvet05

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root (use sudo)." >&2
    exit 1
fi

# Configuration paths
CONFIG_FILE="/etc/web-blocker/sites.conf"
IPTABLES_RULES="/etc/iptables/rules.v4"
PYTHON_SCRIPT="/usr/lib/web-blocker/web-blocker.py"

# Default sites to block (overridden by CONFIG_FILE if it exists)
DEFAULT_SITES=("facebook.com" "twitter.com" "instagram.com")

# Load sites from configuration file if it exists
if [ -f "$CONFIG_FILE" ]; then
    mapfile -t SITES < "$CONFIG_FILE"
else
    SITES=("${DEFAULT_SITES[@]}")
fi

# Function to apply iptables rules
block_iptables() {
    echo "Applying iptables rules to block specified sites..."

    # Resolve IPs for the sites
    IPS=$("$PYTHON_SCRIPT" --get-ips "${SITES[@]}")
    if [ -z "$IPS" ]; then
        echo "Error: No IPs resolved for the specified sites." >&2
        exit 1
    fi

    # Clear existing OUTPUT chain rules to avoid duplicates
    iptables -F OUTPUT

    # Add DROP rules for each IP (TCP and UDP)
    for ip in $IPS; do
        iptables -A OUTPUT -d "$ip" -p tcp -j DROP
        iptables -A OUTPUT -d "$ip" -p udp -j DROP
        echo "Blocked traffic to $ip (TCP/UDP)"
    done

    # Save iptables rules for persistence
    iptables-save > "$IPTABLES_RULES"
    echo "iptables rules saved to $IPTABLES_RULES"
}

# Execute blocking
block_iptables

echo "Website blocking completed successfully. Blocked sites: ${SITES[*]}"
exit 0