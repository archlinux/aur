#! /bin/sh

dir="$(dirname "$0")"

find "$dir" -maxdepth 1 \
    -not -name "$dir" -not -name '.git' \
    -not -name 'PKGBUILD' -not -name '.SRCINFO' \
    -not -name 'clean.sh' \
    -exec rm -rf {} \;