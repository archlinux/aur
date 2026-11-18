#!/usr/bin/env bash
#
# Publish the solidc-git packaging files to the AUR.
#
# AUR repositories use the `master` branch and accept pushes over SSH only.
# The packaging files live in this directory (tracked by the main solidc repo),
# but they are published from a separate AUR clone kept outside this repository.
# Keeping the clone outside means:
#   * a fresh clone of solidc cannot lose the AUR metadata,
#   * git can never fall through to the GitHub remote and push the whole
#     source history to the AUR.
#
# Usage:
#   ./deploy.sh               # sync, commit, and push to AUR
#   ./deploy.sh --no-push     # sync and commit locally, skip the push
#   SOLIDC_AUR_DIR=/path ./deploy.sh
#
set -euo pipefail

AUR_REPO="ssh://aur@aur.archlinux.org/solidc-git.git"
AUR_FETCH_REPO="https://aur.archlinux.org/solidc-git.git"
AUR_DIR="${SOLIDC_AUR_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/solidc-aur/solidc-git}"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

PUSH=1
for arg in "$@"; do
    case "$arg" in
        --no-push) PUSH=0 ;;
        -h | --help)
            sed -n '2,18p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
            exit 0
            ;;
        *)
            echo "error: unknown argument: $arg" >&2
            exit 2
            ;;
    esac
done

command -v makepkg >/dev/null 2>&1 || {
    echo "error: makepkg not found; install base-devel" >&2
    exit 1
}

cd "$SCRIPT_DIR"

echo "==> Refreshing pkgver from the upstream source"
# No --holdver: a VCS package should publish the pkgver() of today's HEAD.
makepkg --nobuild
makepkg --printsrcinfo >.SRCINFO

pkgver="$(sed -n 's/^[[:space:]]*pkgver = //p' .SRCINFO | head -1)"
if [[ -z "$pkgver" ]]; then
    echo "error: could not read pkgver from .SRCINFO" >&2
    exit 1
fi
echo "==> Version: ${pkgver}"

# Remove makepkg's build artifacts now, using explicit paths so a stray cd can
# never delete this directory. Nothing below needs them.
rm -rf -- "$SCRIPT_DIR/src" "$SCRIPT_DIR/pkg" "$SCRIPT_DIR/solidc"
rm -f -- "$SCRIPT_DIR"/*.tar.gz "$SCRIPT_DIR"/*.tar.xz "$SCRIPT_DIR"/*.tar.zst \
    "$SCRIPT_DIR"/*.pkg.tar.zst

# Refresh (or create) the AUR checkout. Fetches go over anonymous HTTPS; only
# the push uses AUR's SSH endpoint (git checks the push URL first).
if [[ ! -d "$AUR_DIR/.git" ]]; then
    echo "==> Cloning the AUR repository into $AUR_DIR"
    mkdir -p "$(dirname -- "$AUR_DIR")"
    git clone --branch master "$AUR_FETCH_REPO" "$AUR_DIR"
    git -C "$AUR_DIR" remote set-url origin "$AUR_FETCH_REPO"
    git -C "$AUR_DIR" remote set-url --push origin "$AUR_REPO"
else
    echo "==> Updating AUR checkout $AUR_DIR"
    git -C "$AUR_DIR" remote set-url origin "$AUR_FETCH_REPO"
    git -C "$AUR_DIR" remote set-url --push origin "$AUR_REPO"
    git -C "$AUR_DIR" fetch --quiet origin master

    if ! git -C "$AUR_DIR" merge-base --is-ancestor refs/remotes/origin/master refs/heads/master; then
        echo "error: $AUR_DIR has commits that are not on the AUR yet and the remote moved." >&2
        echo "       Resolve the divergence there, then rerun this script." >&2
        exit 1
    fi
    git -C "$AUR_DIR" merge --ff-only --quiet refs/remotes/origin/master
fi

# Stage every published packaging file; the AUR repo already carries
# deploy.sh and .gitignore, so keep them in sync too.
install -m 644 PKGBUILD .SRCINFO .gitignore "$AUR_DIR/"
install -m 755 deploy.sh "$AUR_DIR/"

git -C "$AUR_DIR" add PKGBUILD .SRCINFO .gitignore deploy.sh
if git -C "$AUR_DIR" diff --cached --quiet; then
    echo "==> AUR packaging is already up to date"
else
    git -C "$AUR_DIR" commit -m "Update PKGBUILD and .SRCINFO for version ${pkgver}"
fi

if ((PUSH)); then
    echo "==> Pushing to AUR (master)"
    git -C "$AUR_DIR" push origin master
else
    echo "==> --no-push: skipping push; AUR checkout left at $AUR_DIR"
fi
