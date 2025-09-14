#!/bin/bash

CI_MODE=false
if [[ "$*" == *"--ci"* ]]; then
  CI_MODE=true
  echo "Running in CI mode - will skip commit operations"
fi

# Check if a version override is provided
latest_version="latest"

if [ -n "$1" ]; then
    latest_version="$1"
fi

if [ "$latest_version" = "latest" ]; then
    latest_version=$(curl -s "https://api.modlabs.cc/opera-versions" | grep -oP '(?<="latest":")[^"]*')
    echo "Latest Opera Version: v${latest_version}"
else
    latest_version="$1"
    echo "Using version override: v${latest_version}"
fi


# Backup the original PKGBUILD
cp ./PKGBUILD ./PKGBUILD.bak

# Update the PKGBUILD with the latest version
sed -i "s/^pkgver=.*$/pkgver=${latest_version}/" ./PKGBUILD

# Check if the version URL returns 404
url="https://get.geo.opera.com/ftp/pub/opera/desktop/${latest_version}/linux/opera-stable_${latest_version}_amd64.deb"
response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

if [ "$response" -eq 404 ]; then
  echo "The URL for version ${latest_version} (${url}) returned a 404 error. Aborting update."
  # Restore the original PKGBUILD
  mv ./PKGBUILD.bak ./PKGBUILD
  exit 1
fi

# Remove the backup PKGBUILD if the URL is valid
rm ./PKGBUILD.bak

# Check for changes in the PKGBUILD
if ! git diff --quiet HEAD PKGBUILD; then
  # Check if pacman-contrib is installed
  if pacman -Qi pacman-contrib > /dev/null 2>&1; then
    updpkgsums
  else
    echo "Install pacman-contrib with 'pacman -S pacman-contrib'"
    exit 1
  fi

  # Generate .SRCINFO
  makepkg --printsrcinfo > .SRCINFO

  # Install the package
  makepkg -si

  # Commit the changes
  if [ "$CI_MODE" = false ]; then
    # Only commit if not in CI mode
    git add PKGBUILD .SRCINFO
    git commit -m "Updated version to ${latest_version}"
  else
    echo "Skipping commit in CI mode"
  fi

  
  git commit -m "Updated version to ${latest_version}"
else
  echo "No updates found!"
fi
