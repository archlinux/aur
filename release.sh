#!/bin/env bash

set -e

# Read current version
current_version=$(grep 'pkgver=' PKGBUILD | cut -d'=' -f2)
current_revision=$(grep 'pkgrel=' PKGBUILD | cut -d'=' -f2)

# Read the version
echo "Enter the new version (current: $current_version, default: $current_version):"
read -r version

if [[ -z "$version" ]]; then
  version=$current_version
fi

# Increase the revision if the version is not changed
if [[ "$version" == "$current_version" ]]; then
  revision=$((current_revision + 1))
else
  revision=1
fi

echo "New version: $version-$revision, continue? [y/N]"
read -r response

if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Aborted"
  exit 0
fi

# Update the PKGBUILD
sed -i "s/pkgver=.*/pkgver=$version/" PKGBUILD
sed -i "s/pkgrel=.*/pkgrel=$revision/" PKGBUILD

# Update the checksums
sed -i '/sha256sums/d' PKGBUILD
makepkg -g >> PKGBUILD

# Generate the .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Commit the changes
echo "Updating to version $version-$revision, commit the changes? [y/N]"

read -r response

if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Aborted"
  exit 0
fi

git add PKGBUILD .SRCINFO
git commit -m "Release $version-$revision"

echo "Changes committed, push to the repository? [y/N]"
read -r response

if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  echo "Aborted"
  exit 0
fi

git push origin master
