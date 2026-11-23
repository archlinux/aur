#!/usr/bin/env bash
set -euo pipefail

blue='' green='' red='' reset=''
if [[ -t 1 && ! ${NO_COLOR+x} && ${TERM:-dumb} != dumb ]]; then
    blue=$'\e[34m' green=$'\e[32m' red=$'\e[31m' reset=$'\e[0m'
fi
log() { printf '%s➡️  %s%s\n' "$blue" "$*" "$reset"; }
done_msg() { printf '%s✅ %s%s\n' "$green" "$*" "$reset"; }
fail() { printf '%s❌ %s%s\n' "$red" "$*" "$reset" >&2; exit 1; }
dry=false
case ${1:-} in
    --dry-run) dry=true ;;
    '') ;;
    *) fail 'Usage: ./update-localbell-bin.sh [--dry-run]' ;;
esac
(( $# <= 1 && EUID != 0 )) || fail 'Run as your regular user: ./update-localbell-bin.sh [--dry-run]'
for tool in git curl jq vercmp makepkg sha256sum flock; do
    command -v "$tool" >/dev/null || fail "Missing tool: $tool"
done
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
[[ $PWD == "$(git rev-parse --show-toplevel)" && $(git branch --show-current) == master ]] || fail 'Run from the AUR checkout on branch master.'
remote=ssh://aur@aur.archlinux.org/localbell-bin.git
[[ $(git config --get remote.origin.url) == "$remote" && $(git remote get-url --push origin) == "$remote" ]] || fail 'Origin must point to the official localbell-bin AUR SSH repository.'
exec 9>"$(git rev-parse --absolute-git-dir)/localbell-update.lock"
flock -n 9 || fail 'Another AUR update is running.'
[[ -z $(git status --porcelain) ]] || fail 'The AUR checkout is not clean.'
work=$(mktemp -d)
trap 'rm -rf -- "$work"' EXIT
repo=fredjunior54/localbell
upstream=https://github.com/$repo
branch=refs/heads/master
log 'Check the published AUR package and Git branch'
aur=$(curl -fsS --max-time 30 'https://aur.archlinux.org/rpc/v5/info?arg[]=localbell-bin') || fail 'Cannot query AUR RPC.'
count=$(jq -er '.resultcount | select(. == 0 or . == 1)' <<< "$aur") || fail 'Unexpected AUR response.'
refs=$(git ls-remote origin "$branch") || fail 'Cannot read the AUR Git branch. Check SSH host verification and your AUR key.'
base=${refs%%$'\t'*}
head=$(git rev-parse HEAD)
pending=false
if [[ -n $base ]]; then
    git fetch --no-tags origin "$branch"
    [[ $(git rev-parse FETCH_HEAD) == "$base" ]] || fail 'The AUR branch changed during the check; rerun.'
    if [[ $head != "$base" ]]; then
        [[ $(git rev-parse HEAD^ 2>/dev/null) == "$base" ]] || fail 'Local and AUR branches differ. Review them before updating.'
        [[ $(git diff --name-only "$base" "$head") == $'.SRCINFO\nPKGBUILD' ]] || fail 'The pending commit contains unexpected changes.'
        pending=true
    fi
    git show "$base:PKGBUILD" > "$work/recipe"
    published=$(sed -nE 's/^pkgver=([0-9]+\.[0-9]+\.[0-9]+)$/\1/p' "$work/recipe")
    [[ -n $published ]] || fail 'Invalid published AUR version.'
else
    (( count == 0 )) || fail 'AUR lists this package but its Git branch could not be read.'
    case $(git rev-list --count HEAD) in
        1) cp PKGBUILD "$work/recipe" ;;
        2)
            [[ $(git diff --name-only HEAD^ HEAD) == $'.SRCINFO\nPKGBUILD' ]] || fail 'Unexpected files in the first pending update.'
            git show HEAD^:PKGBUILD > "$work/recipe"
            pending=true ;;
        *) fail 'Unexpected history for first publication.' ;;
    esac
    published=''
fi
log 'Find the latest stable LocalBell tag'
tags=$(git ls-remote --tags --refs "$upstream.git" 'refs/tags/v*') || fail 'Cannot read LocalBell tags.'
tag=''
while IFS=$'\t' read -r _ ref; do
    candidate=${ref#refs/tags/}
    [[ $candidate =~ ^v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$ ]] || continue
    if [[ -z $tag || $(vercmp "${candidate#v}" "${tag#v}") == 1 ]]; then tag=$candidate; fi
done <<< "$tags"
[[ -n $tag ]] || fail 'No stable LocalBell tags found.'
version=${tag#v}
if [[ -n $published ]]; then
    case $(vercmp "$version" "$published") in
        0) "$pending" && fail 'A pending local commit needs review.'; done_msg "AUR already has $version."; exit 0 ;;
        -1) fail "AUR is newer ($published); refusing to downgrade." ;;
    esac
fi
log "Check public release $tag"
name=localbell-$version-linux-amd64.tar.gz
code=$(curl -sS --max-time 30 -o "$work/release.json" -w '%{http_code}' "https://api.github.com/repos/$repo/releases/tags/$tag") || fail 'Cannot reach GitHub Releases.'
if [[ $code == 404 ]]; then done_msg "$tag is not public yet; nothing changed."; exit 0; fi
[[ $code == 200 ]] || fail "GitHub returned HTTP $code."
release=$(<"$work/release.json")
if ! jq -e --arg tag "$tag" '.tag_name == $tag and .draft == false and .prerelease == false' <<< "$release" >/dev/null; then
    done_msg "$tag is not a public stable release; nothing changed."; exit 0
fi
url=$upstream/releases/download/$tag/$name
digest=$(jq -r --arg name "$name" --arg url "$url" '.assets[] | select(.name == $name and .browser_download_url == $url and .state == "uploaded") | .digest // empty' <<< "$release")
if [[ ! $digest =~ ^sha256:[0-9a-f]{64}$ ]]; then done_msg 'The archive or its public SHA-256 digest is not ready; nothing changed.'; exit 0; fi
log 'Download and verify the archive and packaging sources'
curl -fsSL --max-time 120 "$url" -o "$work/$name"
printf '%s  %s\n' "${digest#sha256:}" "$work/$name" | sha256sum --check --status || fail 'Release archive SHA-256 mismatch.'
checksums=("${digest#sha256:}")
for source in packaging/localbell.desktop server/assets/localbell-icon.png LICENSE server/assets/{NERD-FONTS.txt,CaskaydiaCove-LICENSE.txt,Symbols-Nerd-LICENSE.txt}; do
    path=$work/${source##*/}
    curl -fsSL --max-time 30 "https://raw.githubusercontent.com/$repo/$tag/$source" -o "$path"
    hash=$(sha256sum "$path")
    checksums+=("${hash%% *}")
done
printf "    '%s'\n" "${checksums[@]}" > "$work/checksums"
awk -v version="$version" -v checksums="$work/checksums" '
    /^pkgver=/ { print "pkgver=" version; next }
    /^pkgrel=/ { print "pkgrel=1"; next }
    /^sha256sums=\($/ { print; while (getline line < checksums) print line; skipping=1; next }
    skipping && /^\)$/ { skipping=0 }
    !skipping { print }
' "$work/recipe" > "$work/PKGBUILD"
log 'Generate .SRCINFO and verify the Arch package'
(cd "$work" && makepkg --printsrcinfo > .SRCINFO && makepkg --verifysource && makepkg --cleanbuild)
if "$pending"; then
    if ! cmp -s PKGBUILD "$work/PKGBUILD" || ! cmp -s .SRCINFO "$work/.SRCINFO"; then fail 'The pending commit does not match the verified upstream release.'; fi
fi
if "$dry"; then done_msg "Verified $version. Dry run: no commit or push."; exit 0; fi
if ! "$pending" && { ! cmp -s PKGBUILD "$work/PKGBUILD" || ! cmp -s .SRCINFO "$work/.SRCINFO"; }; then
    cp -- "$work/PKGBUILD" "$work/.SRCINFO" .
    git add -- PKGBUILD .SRCINFO
    git commit -m "chore: Update LocalBell to $version"
fi
log 'Push the verified package to AUR'
git push origin HEAD:"$branch" || fail 'Push failed. Resolve SSH or remote changes and rerun to verify and retry the pending commit.'
done_msg "AUR updated to $version."
