#!/usr/bin/env bash
# Update the PKGBUILD to the latest GitHub release of swayprofile and commit it.
# Does not push: check the commit, then `git push aur master`.
set -euo pipefail
cd "$(dirname "$0")"

repo=Syphdias/swayprofile

tag=$(curl -fsSL "https://api.github.com/repos/$repo/releases/latest" \
    | python -c 'import json, sys; print(json.load(sys.stdin)["tag_name"])')
version=${tag#v}
current=$(sed -n 's/^pkgver=//p' PKGBUILD)

if [[ $version == "$current" ]]; then
    echo "PKGBUILD is already at the latest release ($version)"
    exit 0
fi
if [[ -n $(git status --porcelain) ]]; then
    echo "uncommitted changes, commit or stash them first:" >&2
    git status --short >&2
    exit 1
fi

echo "updating $current -> $version"
sed -i -e "s/^pkgver=.*/pkgver=$version/" -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums
makepkg --printsrcinfo > .SRCINFO
git add -A
git commit -m "upgpkg: swayprofile $version-1"
git show --stat --oneline HEAD
