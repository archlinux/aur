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
#"${get_release[@]}" -v >release_info.json
release_tag="$("${get_release[@]}" | jq -r .tag_name)"

echo 'Updating files'
sed -i "s#^pkgver=.*#pkgver=${release_tag#v}#" PKGBUILD
updpkgsums
makepkg --printsrcinfo >.SRCINFO

echo 'Files updated. Now, run:'
echo '  makepkg -sf'
echo '  git add .'
echo '  git commit'

