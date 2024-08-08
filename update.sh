#! /bin/bash

decodeURL() {
    printf "%b\n" "$(sed 's/+/ /g; s/%\([0-9a-f][0-9a-f]\)/\\x\1/gi;')"
}

set -eu

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
cd $SCRIPT_DIR

# File to store the last version and run information
VERSION_FILE="$SCRIPT_DIR/version.txt"

# Get the latest version from the URL
newver=$(decodeURL <<< $(curl -sI 'https://www.zotero.org/download/client/dl?platform=linux-x86_64&channel=beta' | grep "^location" | sed -E "s/.*beta\/(.*)\/.*/\1/g"))

# Check if the version is already up to date
if [ -f "$VERSION_FILE" ] && grep -q "$newver" "$VERSION_FILE"; then
    echo "Already up to date: $newver"
    exit 0
fi

# Save the new version and timestamp to the file
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
echo "Version: $newver" > "$VERSION_FILE"
echo "Last updated: $timestamp" >> "$VERSION_FILE"

echo "Updating to new version: $newver"

# Replace the old pkg version with the new version in PKGBUILD
sed "s/^_pkgver.*/_pkgver=$newver/" -i PKGBUILD

# Update checksums and .SRCINFO
updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Clean up any .tar files
rm -f Zotero*.tar.bz2

# Commit and push the changes
git add -A
git commit -m "Auto-update to $newver"
git push

