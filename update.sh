#!/usr/bin/env bash
#
# Bump gascity-latest-bin to a release and refresh checksums + .SRCINFO.
#
# Usage:
#   ./update.sh            # bump to upstream's latest release
#   ./update.sh 1.2.3      # bump to a specific version
#
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

_repo=gastownhall/gascity

# --- resolve target version -------------------------------------------------
if [[ $# -ge 1 ]]; then
    new_ver=${1#v}
else
    echo ">> querying latest release of ${_repo}..."
    new_ver=$(curl -fsSL "https://api.github.com/repos/${_repo}/releases/latest" \
                | grep -Po '"tag_name":\s*"v?\K[^"]+')
fi
[[ -n "${new_ver}" ]] || { echo "!! could not determine version" >&2; exit 1; }

old_ver=$(grep -Po '^pkgver=\K.*' PKGBUILD)

if [[ "${new_ver}" == "${old_ver}" ]]; then
    echo ">> already at ${new_ver}; refreshing sums/.SRCINFO anyway."
else
    echo ">> ${old_ver} -> ${new_ver}"
    sed -i -e "s/^pkgver=.*/pkgver=${new_ver}/" \
           -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
fi

# --- refresh checksums and metadata ----------------------------------------
echo ">> updating checksums..."
updpkgsums

echo ">> regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo ">> done. review changes:"
git --no-pager diff -- PKGBUILD .SRCINFO 2>/dev/null || git status --short 2>/dev/null || true

cat <<EOF

Next steps:
  git add PKGBUILD .SRCINFO
  git commit -m "upgpkg: gascity-latest-bin ${new_ver}-1"
  git push
EOF
