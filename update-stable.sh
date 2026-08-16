#!/usr/bin/env bash
#
# update-stable.sh
#
# Checks the latest GitHub release for csouzape/dsxtool (tagged from main),
# bumps pkgver in PKGBUILD if it changed, rebuilds, regenerates .SRCINFO,
# and pushes to the AUR.
#
# Usage:
#   ./update-stable.sh             bump + push if a new release exists
#   ./update-stable.sh --install   also install the package locally (-si)
#   ./update-stable.sh --check     only report if a new release is available
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PKGNAME="dsxtool"
REPO="csouzape/dsxtool"
CACHE_DIR="$HOME/.cache/yay/${PKGNAME}"

log_info() { printf '[INFO] %s\n' "$*"; }
log_success() { printf '[OK] %s\n' "$*"; }
log_warn() { printf '[WARN] %s\n' "$*"; }
log_error() { printf '[ERROR] %s\n' "$*" >&2; }

MODE="update"
case "${1:-}" in
--install) MODE="install" ;;
--check) MODE="check" ;;
esac

if [[ ! -f PKGBUILD ]]; then
  log_error "PKGBUILD not found in $SCRIPT_DIR"
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  log_error "$SCRIPT_DIR is not a git repository"
  exit 1
fi

log_info "Fetching latest release from GitHub (${REPO})"
RELEASE_JSON=$(curl -fsSL "https://api.github.com/repos/${REPO}/releases/latest") || {
  log_error "Failed to reach GitHub API"
  exit 1
}

LATEST_TAG=$(printf '%s' "$RELEASE_JSON" | grep -m1 '"tag_name"' | sed -E 's/.*"tag_name": *"([^"]+)".*/\1/')
LATEST_VER="${LATEST_TAG#v}"

if [[ -z "$LATEST_VER" ]]; then
  log_error "Could not parse latest tag from GitHub API response"
  exit 1
fi

CURRENT_VER=$(grep -m1 '^pkgver=' PKGBUILD | cut -d= -f2)

log_info "Current pkgver: ${CURRENT_VER} | Latest GitHub release: ${LATEST_VER}"

if [[ "$CURRENT_VER" == "$LATEST_VER" ]]; then
  log_success "Already up to date (${CURRENT_VER})"
  exit 0
fi

if [[ "$MODE" == "check" ]]; then
  log_warn "New release available: ${CURRENT_VER} -> ${LATEST_VER}"
  exit 0
fi

log_info "Bumping pkgver: ${CURRENT_VER} -> ${LATEST_VER}"
sed -i "s/^pkgver=.*/pkgver=${LATEST_VER}/" PKGBUILD
sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

log_info "Cleaning previous build artifacts and AUR helper cache"
rm -rf src pkg ./*.pkg.tar.zst
rm -rf "$CACHE_DIR" || true

log_info "Updating checksums"
updpkgsums

log_info "Building package"
if [[ "$MODE" == "install" ]]; then
  makepkg -si --noconfirm
else
  makepkg -f --noconfirm
fi

log_info "Regenerating .SRCINFO"
makepkg --printsrcinfo >.SRCINFO

git add PKGBUILD .SRCINFO
git commit -m "chore: bump version to ${LATEST_VER}"
git push

log_success "Pushed ${PKGNAME} ${LATEST_VER} to AUR"
