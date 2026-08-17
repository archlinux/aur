#!/usr/bin/env bash
# Automatically prepends release notes from GitHub to changelog.md
#
# Fetches release notes for the version specified in PKGBUILD (_pkgver)
# from the GloriousEggroll/proton-ge-custom repository and prepends them
# to the changelog.md file with proper formatting.
#
# Prerequisites:
#   - curl
#   - jq
#   - PKGBUILD file in current directory with target _pkgver version
#   - changelog.md file in current directory
#
# Usage:
#   ./add-to-changelog.sh

set -euo pipefail

# Check prerequisites
if ! command -v curl &> /dev/null; then
  echo "Error: curl is required but not installed" >&2
  echo "Install with: pacman -S curl" >&2
  exit 1
fi

if ! command -v jq &> /dev/null; then
  echo "Error: jq is required but not installed" >&2
  echo "Install with: pacman -S jq" >&2
  exit 1
fi

if [[ ! -f PKGBUILD ]]; then
  echo "Error: PKGBUILD not found in current directory" >&2
  exit 1
fi

if [[ ! -f changelog.md ]]; then
  echo "Error: changelog.md not found in current directory" >&2
  exit 1
fi

# PKGBUILDs normally get CARCH from makepkg.
# Define it here so the PKGBUILD can also be sourced directly.
export CARCH="${CARCH:-$(uname -m)}"

# Source the PKGBUILD to evaluate variables
# shellcheck disable=SC1091
source PKGBUILD

# Get the resolved upstream version
version="${_pkgver}"

if [[ -z "$version" ]]; then
  echo "Error: Could not determine version from PKGBUILD" >&2
  exit 1
fi

echo "Fetching release notes for $version..."

# Fetch release data from GitHub API
api_url="https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/tags/$version"
release_body=$(curl -fsSL "$api_url" | jq -r '.body // empty')

if [[ -z "$release_body" ]]; then
  echo "Error: Could not fetch release notes for version $version" >&2
  echo "Check that the release exists: https://github.com/GloriousEggroll/proton-ge-custom/releases/tag/$version" >&2
  exit 1
fi

# Avoid adding the same release twice
if grep -Fxq "## $version" changelog.md; then
  echo "Error: $version already exists in changelog.md" >&2
  exit 1
fi

{
  echo "## $version"
  echo
  printf '%s\n' "$release_body" | tr -d '\r'
  echo
  cat changelog.md
} > changelog.md.tmp

mv changelog.md.tmp changelog.md

echo "✓ Added $version release notes to changelog.md"