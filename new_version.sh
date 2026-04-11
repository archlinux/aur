#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Version not specified"
    exit 1
fi

FILE="$1.tar.gz"

if curl --fail "https://git.sr.ht/~aeldit/lbn/archive/$FILE" -o "$FILE"; then
    echo "Success"
    CHECKSUM=$(sha256sum "$FILE" | cut -d' ' -f1)
    # Update PKGBUILD's contents
    sed -i "4s/.*/pkgver=$1/" PKGBUILD
    sed -i "16s/.*/sha256sums=(\"$CHECKSUM\")/" PKGBUILD
    makepkg --printsrcinfo >.SRCINFO
    rm "$FILE"
else
    echo "Failure"
fi
