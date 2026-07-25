#!/bin/sh
# Update the termius AUR package to the latest snap release.
# Any failing step aborts the script before the git commit.

set -eu

cd "$(dirname "$0")"

# Get new version info
INFO=$(curl -fsS -H 'X-Ubuntu-Series: 16' https://api.snapcraft.io/api/v1/snaps/details/termius-app)
VER=$(printf '%s\n' "$INFO" | jq -er '.version')
REV=$(printf '%s\n' "$INFO" | jq -er '.download_url' | grep -o '_[0-9]\+\.snap$')

case $VER in
    *[!0-9A-Za-z._+-]*|'')
        echo "Unexpected version '$VER'" >&2
        exit 1
        ;;
esac

# Nothing to do if PKGBUILD is already at this version and committed
if [ "$VER" = "$(sed -n 's/^pkgver=//p' PKGBUILD)" ] \
    && [ -z "$(git status --porcelain -- PKGBUILD .SRCINFO)" ]; then
    echo "Already up to date ($VER)"
    exit 0
fi

# Update PKGBUILD
sed -i "s/_[0-9]\+\.snap/$REV/g" PKGBUILD
sed -i "s/^pkgver=.*$/pkgver=$VER/" PKGBUILD

# Calc new hash
updpkgsums

# Build & install pkg
makepkg -sif --noconfirm

# Update .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Git ops
git add .SRCINFO PKGBUILD
git commit -m "Update to $VER"

# Cleanup
rm -rf pkg/ src/ *.snap *.pkg.tar.zst

printf '\nAll done!\nRemember to git push!\n'
