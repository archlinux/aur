#!/bin/bash

# Set the directory for writable data in the user's home directory
export EDMC_DATA_DIR="$HOME/.local/share/edmarketconnector"

# Create the directory if it doesn't exist
mkdir -p "$EDMC_DATA_DIR"

# Change to the application directory
cd /usr/lib/edmarketconnector

# Execute the application with the environment variable
exec python3 ./EDMarketConnector.py
