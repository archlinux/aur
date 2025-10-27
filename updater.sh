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
_latest_json=$(get_file "https://api.github.com/repos/${_repo}/tags?per_page=1")

_upstream_version=$(jq -r '.[0].name' <<<"${_latest_json}")
_upstream_version=${_upstream_version##*/}

_upver=${_upstream_version#v}
pkgver=${_upver%-*}
pkgrel=${_upver#*-}
if [ ! "$pkgrel" ] || [ "$pkgrel" = "$_upver" ]; then
  pkgrel=1
fi

# Replace variables in PKGBUILD
sed -i "s/^pkgver=.*/pkgver=${pkgver}/;s/^pkgrel=.*/pkgrel=${pkgrel}/" PKGBUILD

# Update source and hash sums
# Since the source only contains 1 file, we can directly get its hash
new_source_file=$(jq -r '.[0].tarball_url' <<<"${_latest_json}")
new_source="\${pkgname}.tar.gz::${new_source_file}"
new_hash=$(get_file "${new_source_file}" | sha256sum | cut -f1 -d' ')
sed -i "s|^source=.*|source=(\"${new_source}\")|" PKGBUILD
sed -i "s/^sha256sums=.*/sha256sums=('${new_hash}')/" PKGBUILD

# Test the updated PKGBUILD
if ! makepkg -f; then
  echo "Error: makepkg failed with the updated PKGBUILD."
  exit 1
fi

### Update repo

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
