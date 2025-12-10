#!/usr/bin/env bash
set -e

REPO_USER="gdplayerokay"
REPO_NAME="Chainz-package"
RAW_URL="https://raw.githubusercontent.com/${REPO_USER}/${REPO_NAME}/main/chainz"
DEST="/usr/bin/chainz"

echo "Downloading chainz from GitHub..."
curl -fsSL "$RAW_URL" -o /tmp/chainz

echo "Setting executable permission..."
chmod +x /tmp/chainz

echo "Installing to $DEST (requires sudo)..."
sudo mv /tmp/chainz "$DEST"

echo "Done. You can now run: chainz"

