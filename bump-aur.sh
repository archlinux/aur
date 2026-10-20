#!/bin/bash
# bump-aur.sh — sync one AUR package's version tag with upstream.
#
# This is the manual equivalent of what `aur-auto-deploy-sync` does on a
# timer. It is also the template to copy into a new ~/build/<pkg>/ directory.
#
# Usage:
#   ./bump-aur.sh                 # bump the package in this directory
#   ./bump-aur.sh <pkgname>       # bump a package listed in the shared registry
#   ./bump-aur.sh --check         # report only, change nothing
#
# The shared registry (scripts/aur-packages.sh) is the single source of truth
# for which packages exist, where they live, and how to resolve their upstream
# version. Add new packages there rather than hardcoding them here.

set -euo pipefail

SKILL_DIR="${AUR_SKILL_DIR:-$HOME/.agents/skills/aur-auto-deploy}"
REGISTRY="$SKILL_DIR/scripts/aur-packages.sh"
[[ -r "$REGISTRY" ]] || { echo "registry not found: $REGISTRY" >&2; exit 1; }
# shellcheck source=/dev/null
source "$REGISTRY"

CHECK_ONLY=0
PKGNAME=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --check) CHECK_ONLY=1 ;;
    -h|--help) sed -n '2,18p' "$0"; exit 0 ;;
    *) PKGNAME="$1" ;;
  esac
  shift
done

# Which package? Either named on the command line, or the one in this
# directory.
if [[ -z "$PKGNAME" ]]; then
  PKGDIR="$(pwd)"
  PKGNAME="$(basename "$PKGDIR")"
fi

# Find the registry row for this package.
ROW=""
for row in "${AUR_PACKAGES[@]}"; do
  [[ "${row%%|*}" == "$PKGNAME" ]] && ROW="$row"
done
if [[ -z "$ROW" ]]; then
  echo "$PKGNAME is not in the registry ($REGISTRY)" >&2
  echo "Add it there:" >&2
  echo "  '$PKGNAME|~/build/$PKGNAME|github|<org>/<repo>|<tag-prefix>|<asset>'" >&2
  exit 1
fi

IFS='|' read -r _pkg local_dir kind ref prefix asset <<<"$ROW"
local_dir="${local_dir/#\~/$HOME}"
[[ -d "$local_dir" ]] || local_dir="$PWD"

echo "package : $PKGNAME"
echo "dir     : $local_dir"
echo "upstream: $kind:$ref (tag prefix '$prefix')"

# Resolve the current upstream version.
upstream=$(aur_resolve_version "$kind" "$ref" "$prefix")
if [[ -z "$upstream" ]]; then
  echo "ERROR: could not resolve the upstream version for $PKGNAME" >&2
  exit 1
fi

current=$(aur_pkgbuild_version "$local_dir")
echo "current : $current"
echo "latest  : $upstream"

if [[ "$current" == "$upstream" ]]; then
  echo "Already synced"
  exit 0
fi

if [[ $CHECK_ONLY -eq 1 ]]; then
  echo "would bump to $upstream"
  exit 0
fi

# Bump. Only the static pkgver=/pkgrel= lines are rewritten; pkgver() still
# overrides pkgver at build time, so this only moves the AUR page version.
sed -i -E "s|^(pkgver=)[^[:space:]]*|\1${upstream}|; s|^(pkgrel=)[^[:space:]]*|\11|" \
  "$local_dir/PKGBUILD"

newver=$(aur_pkgbuild_version "$local_dir")
if [[ "$newver" != "$upstream" ]]; then
  echo "ERROR: bump did not take (PKGBUILD now says '$newver')" >&2
  exit 1
fi

(cd "$local_dir" && makepkg --printsrcinfo >.SRCINFO)
(cd "$local_dir" && git add PKGBUILD .SRCINFO && \
  git commit -m "bump: ${upstream} (auto via aur-auto-deploy)")
(cd "$local_dir" && git push aur master)

echo "Pushed $upstream — https://aur.archlinux.org/packages/$PKGNAME"
