#!/bin/bash
set -e

echo "[*] Checking for latest HAMRS version..."

# Get latest version from redirect header
latest_url=$(curl -sI https://hamrs.app/download/linux | grep -i '^location:' | tr -d '\r' | awk '{print $2}')
latest_version=$(echo "$latest_url" | grep -oP 'hamrs-pro-\K[0-9]+\.[0-9]+\.[0-9]+(?=-linux-x86_64\.AppImage)')

if [[ -z "$latest_version" ]]; then
    echo "❌ Failed to extract latest version"
    exit 1
fi

echo "[✔] Latest version: $latest_version"

# Update PKGBUILD
sed -i "s/^pkgver=.*/pkgver=$latest_version/" PKGBUILD
sed -i "s|source=(\"https://hamrs-dist.s3.amazonaws.com/hamrs-pro-.*-linux-x86_64.AppImage\"|source=(\"https://hamrs-dist.s3.amazonaws.com/hamrs-pro-${latest_version}-linux-x86_64.AppImage\"|" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

echo "[✔] Updated to version $latest_version"
