#!/bin/bash
# Release mxarch-repo: build, tag, push to GitHub and AUR, and publish a GitHub
# release with the package attached under a version-less asset name.
#
# Runs on Arch (needs makepkg), from a clean checkout of main.
set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; BLUE='\033[0;34m'; NC='\033[0m'

GITHUB_REPO="MX-Linux/mxarch-repo"
MAIN_BRANCH="main"
AUR_REMOTE="aur"
# No version in the asset name: /releases/latest/download/ has to stay a
# permanent URL, since it is published in the wiki and the forum. pacman reads
# the real name and version from .PKGINFO, not from the filename.
ASSET_NAME="mxarch-repo.pkg.tar.zst"
KEY_FILE="mxarch.gpg"
EXPIRY_WARN_DAYS=120

DRY_RUN=0
NEW_PKGVER=""
NEW_PKGREL=""

print_header()  { echo -e "${BLUE}========================================${NC}"
                  echo -e "${BLUE}  mxarch-repo Release Script${NC}"
                  echo -e "${BLUE}========================================${NC}"; echo; }
print_step()    { echo -e "${GREEN}> $1${NC}"; }
print_warning() { echo -e "${YELLOW}WARNING: $1${NC}"; }
print_error()   { echo -e "${RED}ERROR: $1${NC}" >&2; }
print_success() { echo -e "${GREEN}OK: $1${NC}"; }
die()           { print_error "$1"; exit 1; }

run() { if (( DRY_RUN )); then echo -e "  ${YELLOW}[dry-run]${NC} $*"; else "$@"; fi; }

usage() {
    cat <<EOF
Usage: ./release.sh [options]

Builds mxarch-repo, tags it, pushes to GitHub and AUR, and publishes a GitHub
release with the package attached as $ASSET_NAME.

Options:
  --pkgver YYYYMMDD   Set pkgver in PKGBUILD first (default: leave as is)
  --pkgrel N          Set pkgrel in PKGBUILD first (default: leave as is)
  -n, --dry-run       Print what would run; change nothing
  -h, --help          Show this help
EOF
    exit 0
}

while (( $# )); do
    case $1 in
        --pkgver) NEW_PKGVER=${2:?--pkgver needs a value}; shift 2 ;;
        --pkgrel) NEW_PKGREL=${2:?--pkgrel needs a value}; shift 2 ;;
        -n|--dry-run) DRY_RUN=1; shift ;;
        -h|--help) usage ;;
        *) die "Unknown option: $1  (try --help)" ;;
    esac
done

cd "$(dirname "$(readlink -f "$0")")"
print_header

#-----------------------------------------------------------------------------
# Preflight. Everything that can be checked before anything is changed.
#-----------------------------------------------------------------------------
print_step "Checking preconditions"

(( EUID != 0 )) || die "Do not run as root; makepkg refuses to."
for prog in makepkg git gh gpg bsdtar; do
    command -v "$prog" >/dev/null || die "Missing required program: $prog"
done

branch=$(git rev-parse --abbrev-ref HEAD)
[[ $branch == "$MAIN_BRANCH" ]] || die "On branch '$branch', expected '$MAIN_BRANCH'."
[[ -z $(git status --porcelain) ]] || die "Working tree is dirty; commit or stash first."
git remote get-url "$AUR_REMOTE" >/dev/null 2>&1 \
    || die "No '$AUR_REMOTE' remote. Add it:
    git remote add $AUR_REMOTE ssh://aur@aur.archlinux.org/mxarch-repo.git"
gh auth status >/dev/null 2>&1 || die "gh is not authenticated; run: gh auth login"
print_success "preconditions met"

#-----------------------------------------------------------------------------
# Version. The PKGBUILD is the source of truth; --pkgver/--pkgrel edit it.
#-----------------------------------------------------------------------------
if [[ -n $NEW_PKGVER ]]; then
    [[ $NEW_PKGVER =~ ^[0-9]{8}$ ]] || die "pkgver must be YYYYMMDD, got: $NEW_PKGVER"
    print_step "Setting pkgver=$NEW_PKGVER"
    run sed -i "s/^pkgver=.*/pkgver=$NEW_PKGVER/" PKGBUILD
fi
if [[ -n $NEW_PKGREL ]]; then
    [[ $NEW_PKGREL =~ ^[0-9]+$ ]] || die "pkgrel must be a number, got: $NEW_PKGREL"
    print_step "Setting pkgrel=$NEW_PKGREL"
    run sed -i "s/^pkgrel=.*/pkgrel=$NEW_PKGREL/" PKGBUILD
fi

# shellcheck disable=SC1091
pkgver=$(. ./PKGBUILD; echo "$pkgver")
# shellcheck disable=SC1091
pkgrel=$(. ./PKGBUILD; echo "$pkgrel")
tag="$pkgver-$pkgrel"
print_success "releasing $tag"

if git rev-parse -q --verify "refs/tags/$tag" >/dev/null; then
    die "Tag $tag already exists. Bump --pkgrel (or --pkgver) first."
fi

#-----------------------------------------------------------------------------
# The signing key is the whole point of this package, so check it is not about
# to expire. A stale mxarch-repo is what would strand users on a dead key.
#-----------------------------------------------------------------------------
print_step "Checking the bundled signing key"
expiry=$(gpg --show-keys --with-colons "$KEY_FILE" | awk -F: '/^pub/{print $7; exit}')
if [[ -n $expiry && $expiry != 0 ]]; then
    days=$(( (expiry - $(date +%s)) / 86400 ))
    if (( days < 0 )); then
        die "$KEY_FILE expired $(( -days )) days ago. Refresh it from
    https://arch.mxrepo.com/os/x86_64/mxarch.key  before releasing."
    elif (( days < EXPIRY_WARN_DAYS )); then
        print_warning "$KEY_FILE expires in $days days - refresh it soon:
    curl -fsSL https://arch.mxrepo.com/os/x86_64/mxarch.key | gpg --dearmor > $KEY_FILE"
    else
        print_success "key valid for $days more days"
    fi
else
    print_warning "could not read an expiry date from $KEY_FILE"
fi

#-----------------------------------------------------------------------------
# Build. makepkg verifies the checksums for us, so a stale sha256sums shows up
# here rather than on a user's machine.
#-----------------------------------------------------------------------------
print_step "Regenerating .SRCINFO"
run bash -c 'makepkg --printsrcinfo > .SRCINFO'

print_step "Building"
run makepkg -f --cleanbuild

pkgfile="mxarch-repo-$pkgver-$pkgrel-any.pkg.tar.zst"
if (( DRY_RUN )); then
    print_step "Would verify $pkgfile"
else
    [[ -f $pkgfile ]] || die "Expected $pkgfile, which makepkg did not produce."
    print_step "Verifying package contents"
    for path in usr/share/pacman/keyrings/mxarch.gpg \
                usr/share/pacman/keyrings/mxarch-trusted \
                etc/pacman.d/mxarch-mirrorlist \
                usr/bin/mxarch-enable; do
        bsdtar tf "$pkgfile" | grep -qx "$path" || die "$pkgfile is missing $path"
    done
    bsdtar xOf "$pkgfile" .INSTALL | grep -q 'pacman-key --populate mxarch' \
        || die "$pkgfile has no populate step in its install script"
    print_success "$pkgfile looks right"
fi

#-----------------------------------------------------------------------------
# Publish. Commit any .SRCINFO churn, tag, push both remotes, then the release.
#-----------------------------------------------------------------------------
if [[ -n $(git status --porcelain PKGBUILD .SRCINFO) ]]; then
    print_step "Committing PKGBUILD/.SRCINFO"
    run git add PKGBUILD .SRCINFO
    run git commit -m "Release $tag"
fi

print_step "Tagging $tag"
run git tag -a "$tag" -m "mxarch-repo $tag"

print_step "Pushing to GitHub"
run git push origin "$MAIN_BRANCH"
run git push origin "$tag"

# AUR takes master only, and keeps no tags. Note AUR's hooks deny
# non-fast-forward pushes outright, so --force is not a way out of a diverged
# history there; joining the histories is.
print_step "Pushing to AUR"
if (( DRY_RUN )); then
    echo -e "  ${YELLOW}[dry-run]${NC} git push $AUR_REMOTE $MAIN_BRANCH:master"
elif ! git push "$AUR_REMOTE" "$MAIN_BRANCH":master; then
    die "AUR push rejected. AUR refuses non-fast-forward pushes, so if the two
histories have diverged, make this branch a descendant of theirs instead:
    git fetch $AUR_REMOTE
    git merge --allow-unrelated-histories $AUR_REMOTE/master"
fi

print_step "Publishing the GitHub release"
staged=$(mktemp -d)/$ASSET_NAME
if (( DRY_RUN )); then
    echo -e "  ${YELLOW}[dry-run]${NC} cp $pkgfile <tmp>/$ASSET_NAME"
    echo -e "  ${YELLOW}[dry-run]${NC} gh release create $tag --repo $GITHUB_REPO <tmp>/$ASSET_NAME"
else
    cp "$pkgfile" "$staged"
    gh release create "$tag" --repo "$GITHUB_REPO" \
        --title "mxarch-repo $tag" \
        --notes "Bootstrap package for the MX Linux Arch repository.

Install without an AUR helper:

    sudo pacman -U https://github.com/$GITHUB_REPO/releases/latest/download/$ASSET_NAME
    sudo mxarch-enable
    sudo pacman -Syu

Or, with one: \`paru -S mxarch-repo\`" \
        "$staged"
    rm -rf "$(dirname "$staged")"
fi

echo
print_success "Released $tag"
echo "  AUR:     https://aur.archlinux.org/packages/mxarch-repo"
echo "  GitHub:  https://github.com/$GITHUB_REPO/releases/tag/$tag"
echo "  Asset:   https://github.com/$GITHUB_REPO/releases/latest/download/$ASSET_NAME"
echo
print_warning "OBS rebuilds from git on its own; check it picked this up:
    osc results home:mx-packaging mxarch-repo --repo Arch"
