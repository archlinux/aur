#!/usr/bin/env zsh

function get_last_version(){
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

function sync_git(){
    local version=$1
    git commit PKGBUILD -m "Update SDK to $version"
    git push
}

function main(){
    local version=$(get_last_version)
    if grep -q "pkgver=$version" PKGBUILD; then
        printf "Already up-to-date: version %s\n" $version
    else
        update_to $version
        sync_git $version
    fi
}

cd $0:A:h && main $@
