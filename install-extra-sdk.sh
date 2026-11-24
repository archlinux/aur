#!/bin/bash
# Install an additional HarmonyOS SDK (e.g. 6.1.1 Release) from a Huawei
# command-line-tools zip into /opt/devecostudio/sdk/, alongside the bundled
# SDK. hvigor then picks the SDK by the project's compileSdkVersion — see
# the README "Release SDK" section.
# Usage: install-extra-sdk.sh /path/to/commandline-tools-linux-x64-<ver>.zip
set -euo pipefail

IDEDIR=/opt/devecostudio
# Interpreter shipped inside the package; python3 is only a makedepends.
PY="$IDEDIR/plugins/app-analyzer/lib/python/bin/python3.12"
[[ -x "$PY" ]] || PY="$(command -v python3)"

ZIP="${1:-}"
if [[ -z "$ZIP" || ! -f "$ZIP" ]]; then
  echo "Usage: $(basename "$0") <commandline-tools-*.zip>" >&2
  exit 1
fi

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

echo "Extracting SDK components from $ZIP ..."
# Use bsdtar/unzip, not 7z: 7z refuses the SDK's symlink chains
# (libunwind.so -> libunwind.so.1, clang -> bisheng-clang, clang-cl ->
# clang, node's bin/npm -> ../lib/...) as "Dangerous link via another
# link was ignored" and silently drops them, breaking native toolchains.
if command -v bsdtar >/dev/null 2>&1; then
  bsdtar -xf "$ZIP" -C "$TMP" \
    "command-line-tools/sdk/default/openharmony" \
    "command-line-tools/sdk/default/hms" \
    "command-line-tools/sdk/default/sdk-pkg.json"
elif command -v unzip >/dev/null 2>&1; then
  unzip -q -o "$ZIP" \
    "command-line-tools/sdk/default/openharmony/*" \
    "command-line-tools/sdk/default/hms/*" \
    "command-line-tools/sdk/default/sdk-pkg.json" -d "$TMP"
else
  echo "Neither bsdtar (libarchive) nor unzip is available — install one of them." >&2
  exit 1
fi
SRC="$TMP/command-line-tools/sdk/default"
[[ -d "$SRC/openharmony" ]] || { echo "No SDK found in $ZIP" >&2; exit 1; }

PKG=$("$PY" -c "import json,sys;print(json.load(open(sys.argv[1]))['data']['path'])" "$SRC/sdk-pkg.json")
[[ -n "$PKG" ]] || { echo "Cannot read sdk-pkg.json" >&2; exit 1; }
# No bundled SDK any more: the IDE is pointed at the pristine deveco-sdk
# package via ide.harmonyos.sdk.location / DEVECO_SDK_HOME. Writing there is
# possible but lands in a pacman-owned tree (pacman -Qkk will report it);
# export DEVECO_SDK_HOME to a private copy to keep the package clean.
SDK_ROOT=${DEVECO_SDK_HOME:-/opt/deveco-sdk}
if [[ "$SDK_ROOT" == /opt/* ]]; then
  echo "Warning: $SDK_ROOT is pacman-owned (deveco-sdk); this install will be visible to pacman -Qkk." >&2
  echo "         Point DEVECO_SDK_HOME at a private copy to avoid touching it." >&2
fi
DST="$SDK_ROOT/$PKG"

if [[ -e "$DST" ]]; then
  # Not an error: re-running this script after a package upgrade is exactly
  # how the hvigor/IDE patches get re-applied (the upgrade restores the
  # pristine files), so skip the copy and fall through to patching.
  echo "SDK already installed at $DST — skipping extraction, re-applying patches."
else
  echo "Installing to $DST (needs root) ..."
  sudo mkdir -p "$DST"
  sudo cp -a "$SRC/openharmony" "$SRC/hms" "$DST/"
  sudo cp "$SRC/sdk-pkg.json" "$DST/"
  _ver=$(grep -oE '"version"[[:space:]]*:[[:space:]]*"[^"]*"' "$DST/sdk-pkg.json" | tail -1)
  echo "OK: $PKG ($_ver)"
fi

# Needs root; the patcher re-execs itself under sudo when run as a user.
"$IDEDIR/bin/patch-extra-sdk.sh"

echo "Use it: set compileSdkVersion (and targetSdkVersion) in build-profile.json5,"
echo "e.g. '6.1.1(24)' for the 6.1.1 Release SDK."
