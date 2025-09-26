#!/usr/bin/env bash
# Author: Chmouel Boudjnah <chmouel@chmouel.com>
set -eufo pipefail
GITHUB_TOKEN="${GITHUB_TOKEN:-$(pass show github/chmouel-token)}"
PROJECT="${PROJECT:-google-gemini/gemini-cli}"

latest=$(curl -H "Authorization: ${GITHUB_TOKEN}" -s https://api.github.com/repos/${PROJECT}/releases | jq -r '[.[] | select(.prerelease == false and (.tag_name | contains("nightly") | not) and (.tag_name | contains("preview") | not))][0].tag_name')
latest=${latest#v}
pkgversion=$(grep '^pkgver=' PKGBUILD)
pkgversion=${pkgversion#pkgver=}

previous=$(curl -H "Authorization: ${GITHUB_TOKEN}" -s https://api.github.com/repos/${PROJECT}/releases | jq -r '[.[] | select(.prerelease == false and (.tag_name | contains("nightly") | not) and (.tag_name | contains("preview") | not))][1].tag_name')
printf "\e]66;s=2;Showing changelog between %s and %s\a\n" ${previous} ${latest}
echo
printf "\e]66;s=2;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\a\n"
echo
curl -H "Authorization: ${GITHUB_TOKEN}" -s "https://api.github.com/repos/${PROJECT}/compare/${previous}...v${pkgversion}" |
  jq -r '.commits[] | 
  . as $commit |
  (.commit.message | match("#([0-9]+)"; "g") // empty) as $pr |
  if $pr then 
    "- \(.commit.message | split("\n")[0]) (by \u001b[36m\(.commit.author.name)\u001b[0m) \u001b]8;;https://github.com/${PROJECT}/pull/\($pr.captures[0].string)\u001b\\\u001b[32m#\($pr.captures[0].string)\u001b[0m\u001b]8;;\u001b\\ \u001b]8;;\(.html_url)\u001b\\\u001b[33m[\(.sha[0:7])]\u001b[0m\u001b]8;;\u001b\\"
  else 
    "- \(.commit.message | split("\n")[0]) (by \u001b[36m\(.commit.author.name)\u001b[0m) \u001b]8;;\(.html_url)\u001b\\\u001b[33m[\(.sha[0:7])]\u001b[0m\u001b]8;;\u001b\\"
  end' | sort -k2,2 -t'(' --key=2 | sort -s -k1,1r -t'-' --key=1

if [[ ${pkgversion} != "${latest}" ]]; then
  echo "Updating PKGBUILD from ${pkgversion} to ${latest}"
  sed -i "s/pkgver=${pkgversion}/pkgver=${latest}/" PKGBUILD
else
  echo
  printf "\033[3;31mPKGBUILD is already up to date with version %s\033[0m\n" "${pkgversion}"
  exit 0
fi

updpkgsums && makepkg --printsrcinfo >.SRCINFO
makepkg -srif
git commit -m "Bump to ${latest}" PKGBUILD .SRCINFO
git clean -f .
