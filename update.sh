#!/usr/bin/env bash
set -euo pipefail

# update.sh - auto-bump orca-slicer-appimage-bin PKGBUILD to latest GitHub release
#
# Usage: ./update.sh
#
# Requirements: curl, jq, sha256sum, git, makepkg

REPO_API="https://api.github.com/repos/SoftFever/OrcaSlicer"
PKGFILE="PKGBUILD"
SRCINFO=".SRCINFO"
TMPDIR="$(mktemp -d)"
cleanup() { rm -rf "$TMPDIR"; }
trap cleanup EXIT

# check tools
for cmd in curl jq sha256sum git makepkg; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: required command '$cmd' not found." >&2
    exit 1
  fi
done

# 1) fetch latest release tag (stable)
echo "Fetching latest release from GitHub..."
LATEST_TAG="$(curl -s "$REPO_API/releases/latest" | jq -r '.tag_name')"
if [ -z "$LATEST_TAG" ] || [ "$LATEST_TAG" = "null" ]; then
  echo "Failed to get latest release tag." >&2
  exit 1
fi
# strip leading v if present
LATEST_VER="${LATEST_TAG#v}"
echo "Latest upstream release: $LATEST_TAG -> $LATEST_VER"

# 2) read current pkgver from PKGBUILD
if [ ! -f "$PKGFILE" ]; then
  echo "No $PKGFILE found in current directory." >&2
  exit 1
fi
CURRENT_VER="$(grep -E '^pkgver=' "$PKGFILE" | head -n1 | cut -d'=' -f2 | tr -d '\"')"
if [ -z "$CURRENT_VER" ]; then
  echo "Could not parse current pkgver from $PKGFILE" >&2
  exit 1
fi
echo "Current PKGBUILD pkgver: $CURRENT_VER"

if [ "$LATEST_VER" = "$CURRENT_VER" ]; then
  echo "Already up-to-date ($CURRENT_VER). Exiting."
  exit 0
fi

echo "Updating from $CURRENT_VER -> $LATEST_VER"

# 3) download AppImage and LICENSE and compute hashes
APPIMAGE_NAME="OrcaSlicer_Linux_AppImage_V${LATEST_VER}.AppImage"
APPIMAGE_URL="https://github.com/SoftFever/OrcaSlicer/releases/download/v${LATEST_VER}/${APPIMAGE_NAME}"
LICENSE_URL="https://raw.githubusercontent.com/SoftFever/OrcaSlicer/refs/tags/v${LATEST_VER}/LICENSE.txt"

echo "Downloading AppImage: $APPIMAGE_URL"
curl -L --fail -o "$TMPDIR/${APPIMAGE_NAME}" "$APPIMAGE_URL"
echo "Downloading LICENSE: $LICENSE_URL"
curl -L --fail -o "$TMPDIR/LICENSE.txt" "$LICENSE_URL"

echo "Calculating sha256 sums..."
APP_SHA256="$(sha256sum "$TMPDIR/${APPIMAGE_NAME}" | awk '{print $1}')"
LIC_SHA256="$(sha256sum "$TMPDIR/LICENSE.txt" | awk '{print $1}')"
echo "AppImage sha256: $APP_SHA256"
echo "LICENSE sha256:  $LIC_SHA256"

# 4) Update PKGBUILD: pkgver, pkgrel -> 1, sha256sums_x86_64
# Replace pkgver line
# Use sed to replace beginning of line 'pkgver='
sed -i -E "s/^pkgver=.*/pkgver=${LATEST_VER}/" "$PKGFILE"

# Reset pkgrel to 1
if grep -qE '^pkgrel=' "$PKGFILE"; then
  sed -i -E "s/^pkgrel=.*/pkgrel=1/" "$PKGFILE"
else
  # append pkgrel if missing
  awk -v ver="$LATEST_VER" '{
    print
    if ($0 ~ /^pkgver=/) {
      print "pkgrel=1"
    }
  }' "${PKGFILE}.bak" > "${PKGFILE}.tmp" && mv "${PKGFILE}.tmp" "$PKGFILE"
fi

# Replace sha256sums_x86_64 array using perl multi-line replacement for robustness
# It will create: sha256sums_x86_64=('APP' 'LIC')
perl -0777 -pe "s/sha256sums_x86_64=\([^)]+\)/sha256sums_x86_64\=('${APP_SHA256}' '${LIC_SHA256}')/s" -i "$PKGFILE"

# sanity check: ensure PKGBUILD contains the new pkgver & new hashes
if ! grep -q "pkgver=${LATEST_VER}" "$PKGFILE"; then
  echo "Error: pkgver not updated correctly." >&2
  cp "${PKGFILE}.bak" "$PKGFILE"
  exit 1
fi
if ! grep -q "${APP_SHA256}" "$PKGFILE" || ! grep -q "${LIC_SHA256}" "$PKGFILE"; then
  echo "Error: sha256sums not updated correctly." >&2
  cp "${PKGFILE}.bak" "$PKGFILE"
  exit 1
fi

echo "PKGBUILD updated."

# 5) regenerate .SRCINFO
echo "Regenerating .SRCINFO..."
makepkg --printsrcinfo > "$SRCINFO"

# 6) git add/commit/push
echo "Staging changes..."
git add "$PKGFILE" "$SRCINFO"

COMMIT_MSG="orca-slicer-appimage-bin: update to v${LATEST_VER}"
echo "Committing: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo "Pushing to remote..."
git push

echo "Done. PKGBUILD updated to ${LATEST_VER} and pushed."

