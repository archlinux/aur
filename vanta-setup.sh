#!/bin/bash

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
   echo "Error: This script must be run with sudo."
   exit 1
fi

echo "--- Vanta Agent Setup ---"

# Prompt for user info
read -p "Enter Vanta Owner Email: " email
read -p "Enter Vanta Agent Key: " key
read -p "Enter Region (default: US, or EU): " region
region=${region:-US}

# Generate the activation nonce (milliseconds since epoch)
nonce=$(date +%s%3N)

# Construct the JSON config
# Based on the postinst logic: needs_owner=true
config="{\"ACTIVATION_REQUESTED_NONCE\":$nonce,\"AGENT_KEY\":\"$key\",\"OWNER_EMAIL\":\"$email\",\"REGION\":\"$region\",\"NEEDS_OWNER\":true}"

# Write the config file
echo "$config" > /etc/vanta.conf

# Set strict permissions (as seen in the original deb postinst)
chmod 600 /etc/vanta.conf
chown root:root /etc/vanta.conf

echo "---"
echo "Success: /etc/vanta.conf generated."
echo "You can now start the agent with: sudo systemctl enable --now vanta-agent"
