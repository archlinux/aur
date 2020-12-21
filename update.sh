#!/usr/bin/env bash
set -euo pipefail

set -x

scripts=(sc tc j)
widths=(compressed condensed extended normal wide)

if [ $# -ne 1 ]; then
    echo "usage: update.sh v0.91"
    exit 1
fi

new_version=$1

for script in "${scripts[@]}"
do
    for width in "${widths[@]}"
    do
        pkgname="glow-sans-${script}-${width}"
        echo "updating ${pkgname} to ${new_version}."

        # switching branch and remote
        git remote set-url aur "ssh://aur@aur.archlinux.org/$pkgname"
        git fetch aur master
        git checkout -B ${pkgname} aur/master

        # update version
        sed -i "s/pkgver=.*$/pkgver=${new_version}/" PKGBUILD
        updpkgsums
        makepkg --printsrcinfo > .SRCINFO
        git add .
        git commit -m "updates ${pkgname} to ${new_version}"
        git push aur ${pkgname}:master
        echo "updated ${pkgname} to ${new_version}."
    done
done
