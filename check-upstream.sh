#!/usr/bin/env bash
# Check the official WorkBuddy international update feed and compare it with
# the version pinned in PKGBUILD. Exit 0 = up to date, exit 1 = update found.
#
# The feed publishes version, download URL and the DMG sha256 — everything
# PKGBUILD needs except the Electron runtime version, which must be confirmed
# by extracting the new DMG once (see note at the bottom).
set -euo pipefail

API="https://www.workbuddy.ai/v2/update?platform=workbuddy-darwin-x64"
PKGBUILD="$(dirname "$0")/PKGBUILD"

feed="$(curl -fsSL --max-time 30 "$API")"
new_ver="$(printf '%s' "$feed" | sed -n 's/.*"version":"\([^"]*\)".*/\1/p')"
new_sha="$(printf '%s' "$feed" | sed -n 's/.*"sha256hash":"\([^"]*\)".*/\1/p')"
new_url="$(printf '%s' "$feed" | sed -n 's/.*"url":"\([^"]*\)".*/\1/p')"
# The feed's url points at the .zip; the .dmg shares the same base name.
new_build="$(basename "$new_url" | sed 's/\.[^.]*$//' | grep -oE '[0-9a-f]{8}$' || true)"

cur_ver="$(sed -n 's/^_pkgver=\(.*\)$/\1/p' "$PKGBUILD")"
cur_build="$(sed -n 's/^_build=\(.*\)$/\1/p' "$PKGBUILD")"

echo "current: ${_pkgver:-$cur_ver} (${cur_build})"
echo "upstream: ${new_ver} (${new_build})"

if [[ "$cur_ver" == "$new_ver" && "$cur_build" == "$new_build" ]]; then
    echo "UP TO DATE"
    exit 0
fi

cat <<EOF

UPDATE AVAILABLE — apply to PKGBUILD:
  _pkgver=${new_ver}
  _build=${new_build}
  sha256sums[0]=${new_sha}

NOTE: confirm the bundled Electron version in the new DMG
(Contents/Frameworks/Electron Framework.framework/.../Info.plist ->
CFBundleVersion) and update _electronver + the electron zip sha256 if it
changed. Then regenerate .SRCINFO (makepkg --printsrcinfo > .SRCINFO).
EOF
exit 1
