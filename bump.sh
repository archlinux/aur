#!/usr/bin/env bash
# Maintainer tool — NOT shipped in the AUR package.
#
# ┌─ the scryer ─────────────────────────────────────────────────────┐
# │  when the vendor remodels the labyrinth, the walls move quietly. │
# │  run this to compare our map to the current stones. if they have │
# │  shifted, fetch the new layout, walk it once under makepkg's     │
# │  watch (prepare + check: gates fall, bird sings, or the descent  │
# │  aborts), then carry the new map back to the AUR.                │
# └──────────────────────────────────────────────────────────────────┘
#
# End-to-end: compare upstream stable to our pinned pkgver, and if it
# moved, fetch the new VSIX, rehash, rewrite PKGBUILD + .SRCINFO, run
# a full makepkg -f (which exercises prepare() + check() and thus
# proves both our gate patches still hit and the server still boots),
# then commit and push to AUR.
#
# Idempotent: if we're already on the latest version it exits 0
# without touching anything. If the build fails (the beast grew a new
# hand), PKGBUILD edits are reverted so the tree stays clean and
# someone with a blade can come take a look.
#
# Usage:
#   ./bump.sh            # auto-detect, build, commit, push
#   ./bump.sh --dry-run  # detect + edit + build, skip commit/push
#   ./bump.sh --no-push  # commit locally but don't push
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

DRY_RUN=0
NO_PUSH=0
for arg in "$@"; do
    case "$arg" in
        --dry-run) DRY_RUN=1 ;;
        --no-push) NO_PUSH=1 ;;
        *) echo "unknown flag: $arg" >&2; exit 2 ;;
    esac
done

current=$(awk -F= '/^pkgver=/ {print $2}' PKGBUILD)
latest=$(./version.sh)
echo "[bump] current=${current}  latest=${latest}"

if [[ "${current}" == "${latest}" ]]; then
    echo "[bump] already on latest — nothing to do"
    exit 0
fi

url="https://ms-python.gallery.vsassets.io/_apis/public/gallery/publisher/ms-python/extension/vscode-pylance/${latest}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage"
tmp=$(mktemp -d)
trap 'rm -rf "${tmp}"' EXIT

echo "[bump] downloading VSIX ${latest}"
curl -fSL -o "${tmp}/pylance.vsix" "${url}"
new_hash=$(sha256sum "${tmp}/pylance.vsix" | awk '{print $1}')
echo "[bump] sha256=${new_hash}"

# Snapshot so we can revert on failure.
cp PKGBUILD "${tmp}/PKGBUILD.orig"
cp .SRCINFO "${tmp}/SRCINFO.orig"

old_hash=$(awk -F"'" '/^sha256sums=/ {print $2}' PKGBUILD)
sed -i "s|^pkgver=.*|pkgver=${latest}|" PKGBUILD
sed -i "s|^pkgrel=.*|pkgrel=1|" PKGBUILD
sed -i "s|${old_hash}|${new_hash}|" PKGBUILD
makepkg --printsrcinfo > .SRCINFO

restore_on_fail() {
    if [[ $? -ne 0 ]]; then
        echo "[bump] BUILD FAILED — reverting PKGBUILD + .SRCINFO"
        cp "${tmp}/PKGBUILD.orig" PKGBUILD
        cp "${tmp}/SRCINFO.orig" .SRCINFO
    fi
}
trap 'restore_on_fail; rm -rf "${tmp}"' EXIT

rm -rf src pkg
rm -f ./*.pkg.tar.zst ./*.pkg.tar.xz
echo "[bump] running makepkg -f (exercises prepare + check)"
makepkg -f
rm -rf src pkg
rm -f ./*.pkg.tar.zst ./*.pkg.tar.xz

if [[ ${DRY_RUN} -eq 1 ]]; then
    echo "[bump] --dry-run: build passed, skipping commit/push"
    trap 'rm -rf "${tmp}"' EXIT  # don't revert on clean exit
    exit 0
fi

git add PKGBUILD .SRCINFO
git commit -m "Bump to ${latest}"
echo "[bump] committed ${current} -> ${latest}"

if [[ ${NO_PUSH} -eq 1 ]]; then
    echo "[bump] --no-push: commit staged locally"
    trap 'rm -rf "${tmp}"' EXIT
    exit 0
fi

git push origin master
echo "[bump] pushed to AUR"
trap 'rm -rf "${tmp}"' EXIT
