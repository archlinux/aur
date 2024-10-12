#!/bin/bash
url=$(curl -s https://api.github.com/repos/yellow-footed-honeyguide/facad/releases/latest | jq -r '.zipball_url')

if [ -z "$url" ]; then
    echo "Could not get link to latest release"
    exit 1
fi

echo "The latest version will be downloaded from: $url"

if [ -f "PKGBUILD" ]; then
    sed -i "s|source=.*|source=(\"$url\")|" PKGBUILD
    echo "Upload url in PKGBUILD successfully updated"
else
    echo "PKGBUILD file not found"
    exit 2
fi