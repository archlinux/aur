#!/usr/bin/env zsh

function get_version(){
    local link=https://monkeysaudio.com/versionhistory.html
    local version=$(curl -s $link | awk '/Version [0-9]+\.[0-9]+/{print $3; exit}')
    echo $version
}

function update_to(){
    local version=$1
    sed -i "s/pkgver=.*/pkgver=$version/" PKGBUILD
    updpkgsums
    makepkg
    makepkg --printsrcinfo > .SRCINFO
}

function main(){
    version=$(get_version)
    if grep -q "pkgver=$version" PKGBUILD; then
        printf "Up-to-date: version %s\n" $version
    else
        update_to $version
    fi
}

main $@
