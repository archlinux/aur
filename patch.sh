#!/usr/bin/env bash
#
# Helper script for building a variant instead of the consumer version.
set -euo pipefail

print_usage() {
    echo "Usage: $0 (red|work)"
}

capitalize() {
  printf '%s' "$1" | head -c 1 | tr "[:lower:]" "[:upper:]"
  printf '%s' "$1" | tail -c '+2'
}


# Parse args
if [[ $# -ne 1 ]]; then
    print_usage
    exit 1
fi
target=$1
if [[ $target != "red" && $target != "work" ]]; then
    print_usage
    exit 1
fi
target_cap=$(capitalize "$target")

# Ensure clean state
pkgbuild_modified=$(git status --porcelain=v1 PKGBUILD | wc -l)
if [[ $pkgbuild_modified -ne 0 ]]; then
    echo "Error: PKGBUILD contains uncommitted modifications. Aborting."
    exit 1
fi

echo "Patching for variant $target"
sed -i "s/^pkgname=.*/pkgname=threema-$target-desktop/" PKGBUILD
sed -i "s/^_binname=.*/_binname=threema-$target/" PKGBUILD
sed -i "s/^_variant=.*/_variant=$target/" PKGBUILD
sed -i "s/^_appname=.*/_appname=\"Threema $target_cap\"/" PKGBUILD
sed -i "s/^pkgdesc=.*/pkgdesc=\"Threema $target_cap Desktop (Threema Web in Electron)\"/" PKGBUILD
