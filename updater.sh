#!/bin/bash

set -e

### Update PKGBUILD

source PKGBUILD

# Get redirected URL
get_redirected() {
  if command -v curl >/dev/null; then
    curl -Ls -w '%{url_effective}' -o /dev/null "$1"
  elif command -v wget >/dev/null; then
    wget -O /dev/null "$1" 2>&1 | grep "Location: " | head -1 | cut -f2
  else
    echo "Could not find curl or wget"
    return 1
  fi
}

# Get file from URL with redirects
get_file() {
  if command -v curl >/dev/null; then
    curl -Ls "$1"
  elif command -v wget >/dev/null; then
    wget -q -O - "$1"
  else
    echo "Could not find curl or wget"
    return 1
  fi
}

# Get latest upstream version
url=https://github.com/tiann/$_pkg

_upstream_version=$(get_redirected "$url/releases/latest")
_upstream_version=${_upstream_version##*/}

echo $_upstream_version

_upver=${_upstream_version#v}
pkgver=${_upver%-*}
pkgrel=${_upver#*-}
if [ ! "$pkgrel" ] || [ "$pkgrel" = "$_upver" ]; then
  pkgrel=1
fi

# Replace variables in PKGBUILD
sed -i "s/^pkgver=.*/pkgver=${pkgver}/;s/^pkgrel=.*/pkgrel=${pkgrel}/;s/^_ver=.*/_ver=${_upver}/;s/^_upstream_ver=.*/_upstream_ver=${_upstream_version}/" PKGBUILD

# Test the updated PKGBUILD
if ! makepkg -f; then
  echo "Error: makepkg failed with the updated PKGBUILD."
  exit 1
fi

## Update repo

# Generate new .SRCINFO
makepkg --printsrcinfo >.SRCINFO

# Generate commit
git add PKGBUILD .SRCINFO

# Check git signing option
if git config --get commit.gpgSign | grep -q 'true'; then
  commit_flags=('-S')
fi

git commit "${commit_flags[@]}" -m "Bumped version to ${pkgver}-${pkgrel}"

# Push commit
git push origin master
