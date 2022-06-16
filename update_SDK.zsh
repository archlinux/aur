#!/usr/bin/env zsh

function main(){
    local link=https://monkeysaudio.com/versionhistory.html
    local version=$(curl -s $link | awk '/Version [0-9]+\.[0-9]+/{print $3; exit}')
    sed -i "s/pkgver=.*/pkgver=$version/" PKGBUILD
    updpkgsums
    makepkg
    makepkg --printsrcinfo > .SRCINFO
}

main $@
