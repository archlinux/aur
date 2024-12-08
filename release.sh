#!/bin/env bash

set -e

# Update the version
makepkg -o

version=$(grep 'pkgver=' PKGBUILD | sed 's/pkgver=//')

# Generate the .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Commit the changes
echo "Updating to version $version, commit the changes? [y/N]"

read -r response

if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Aborted"
  exit 0
fi

git add PKGBUILD .SRCINFO
git commit -m "Release $version"

echo "Changes committed, push to the repository? [y/N]"
read -r response

if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Aborted"
  exit 0
fi

git push origin master
