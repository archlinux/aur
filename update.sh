#!/usr/bin/bash
set -euo pipefail

DIR="$(dirname "$(readlink -f "$0")")"

if ! command -v git > /dev/null; then
    echo "git command is not in PATH"
    exit 1
fi

LINENUM="$(grep -n 'clean chroot' -m1 "$DIR/PKGBUILD" | cut -d: -f1)"

. "$DIR/PKGBUILD"

sed -i "$(( $LINENUM + 1 )),$(( $LINENUM + 3 ))c\\
    _git_branch=\"${_git_branch}\"\\
    _staging_ver=\"${_staging_ver}\"\\
    _base_ver=\"${_base_ver}\"" "$DIR/PKGBUILD"

cd "$DIR"
makepkg --printsrcinfo > .SRCINFO
