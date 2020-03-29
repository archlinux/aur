#!/usr/bin/env bash

scripts=(sc tc j)
widths=(compressed condensed extended normal wide)

git commit --allow-empty "update package"
for script in "${scripts[@]}"
do
    for width in "${widths[@]}"
    do
        pkgname="glow-sans-${script}-${width}"
        echo "updating $pkgname"
        sed -i -e "s/PH_SCRIPT/${script}/g" PKGBUILD
        sed -i -e "s/PH_WIDTH/${width}/g" PKGBUILD
        updpkgsums
        makepkg --printsrcinfo > .SRCINFO
        git add .
        git commit -m "updates $pkgname"
        git remote set-url aur "ssh://aur@aur.archlinux.org/$pkgname"
        git push aur master
        git reset --hard HEAD~1
    done
done
