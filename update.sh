#!/usr/bin/env bash

set -eo pipefail

printf "Finding latest version... " 
NEWVER="$(pip index versions neostab --only-final latest | cat | head -n 1 | cut -d' ' -f2 | cut -d'(' -f2 | cut -d')' -f1)" || {
    printf "failed\n"
    exit 1
}
printf "%s\n" "$NEWVER"

echo "Generating integrity..."
INTEG="$(makepkg --geninteg)"

echo Replacing version: "$NEWVER"
sed -i "s/^pkgver=.*/pkgver=$NEWVER/" PKGBUILD
echo Replacing integrity
sed -i "s/^sha256sums=.*/$INTEG/" PKGBUILD
echo Updating .SRCINFO...
makepkg --printsrcinfo > .SRCINFO

if [[ "$1" == "and_upload" ]]; then
    git add .
    git commit -m 'automatic update'
    git push
fi