#!/bin/bash

set -euo pipefail

token_arg=()
if [[ -n "${GITHUB_TOKEN:-}" ]]; then
    token_arg=(-H "Authorization: Bearer $GITHUB_TOKEN")
fi

echo 'Getting latest release tag'
get_release=(
  curl -s
    "${token_arg[@]}"
    -H "Accept: application/vnd.github+json"
    -H "X-GitHub-Api-Version: 2026-03-10"
    https://api.github.com/repos/d10n/mullvad-tui/releases/latest
)
release_tag="$("${get_release[@]}" | jq -r .tag_name)"

echo 'Getting associated submodule pin'
get_submodule_hash=(
  curl -s
    "${token_arg[@]}"
    -H "Accept: application/vnd.github+json"
    -H "X-GitHub-Api-Version: 2026-03-10"
    "https://api.github.com/repos/d10n/mullvad-tui/git/trees/$release_tag" #?recursive=1
)
submodule_hash="$("${get_submodule_hash[@]}" | jq -r '.tree[] | select(.path == "mullvadvpn-app").sha')"

echo 'Updating files'
sed -i "s/^pkgver=.*/pkgver=${release_tag#v}/" PKGBUILD
sed -i "s/^_upstream_ref=.*/_upstream_ref=$submodule_hash/" PKGBUILD
updpkgsums
makepkg --printsrcinfo >.SRCINFO

echo 'Files updated. Now, run:'
echo '  makepkg -sf'
echo '  git add .'
echo '  git commit'

