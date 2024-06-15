#!/usr/bin/env bash

if ! command -v wget>/dev/null; then
	sudo pacman -S wget
fi

for i in PKGBUILD .gitignore .SRCINFO; do
    if [ -f "$i" ]; then
        rm "$i"
    fi
done

wget https://gitlab.com/neofetch-extended/archpkg/-/raw/main/PKGBUILD
wget https://gitlab.com/neofetch-extended/archpkg/-/raw/main/.gitignore

makepkg --printsrcinfo > .SRCINFO
