#!/usr/bin/env bash
# Check upstream for a newer worklink build and prepare an AUR release commit.
# Does NOT push — review and `git push aur main:master` manually.
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")"

API='https://www.cm-worklink.com/lappst/hostplatform/downloadKey?build=0&versionChannel=07&downloadKey=GTLc&url=https://www.cm-worklink.com/'

resp=$(curl -fsSL --max-time 30 "$API")
new_ver=$(jq -er '.data.version.versionNo' <<<"$resp")
new_build=$(jq -er '.data.version.build' <<<"$resp")
url=$(jq -er '.data.version.resourceUrl' <<<"$resp")
new_commit=$(sed -nE 's|.*worklink_[0-9.]+-[0-9]+-([0-9a-f]+)_.*|\1|p' <<<"$url")
[[ -n "$new_commit" ]] || { echo "failed to parse commit from $url" >&2; exit 2; }

read_var() { sed -nE "s/^$1=([^ ]+).*/\1/p" PKGBUILD; }
cur_ver=$(read_var pkgver)
cur_build=$(read_var _build)
cur_commit=$(read_var _commit)

if [[ "$cur_ver" == "$new_ver" && "$cur_build" == "$new_build" && "$cur_commit" == "$new_commit" ]]; then
    echo "up-to-date: ${cur_ver}-${cur_build}-${cur_commit}"
    exit 0
fi

echo "upgrade: ${cur_ver}-${cur_build}-${cur_commit} -> ${new_ver}-${new_build}-${new_commit}"

sed -i -E "s/^pkgver=.*/pkgver=${new_ver}/" PKGBUILD
sed -i -E "s/^_build=.*/_build=${new_build}/" PKGBUILD
sed -i -E "s/^_commit=.*/_commit=${new_commit}/" PKGBUILD
sed -i -E "s/^pkgrel=.*/pkgrel=1/" PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

git add PKGBUILD .SRCINFO
git commit -m "chore: bump to ${new_ver}-${new_build}-${new_commit}"

if command -v notify-send >/dev/null; then
    notify-send -u normal "worklink AUR" "prepared bump ${new_ver}-${new_build}-${new_commit}\nreview & 'git push aur main:master'"
fi
echo "done. review with 'git show', then 'git push aur main:master'"
