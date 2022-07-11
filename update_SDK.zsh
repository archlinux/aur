#!/usr/bin/env zsh

function get_last_version(){
    local link=https://monkeysaudio.com/versionhistory.html
    local version=$(curl -s $link | awk '/Version [0-9]+\.[0-9]+/{print $3; exit}')
    echo $version
}

function patch_pkgbuild(){
    local version=$1
    sed -i "s/pkgver=.*/pkgver=$version/" PKGBUILD
}

function update_to(){
    local version=$1
    patch_pkgbuild $version
    updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO
}

function sync_git(){
    local version=$1
    git commit PKGBUILD -m "Update SDK to $version"
    git push
}

function main(){
    local ver=$(get_last_version)
    local old_ver=$(awk -F= '/pkgver=/{print $2}' PKGBUILD)
    if [[ $ver == $old_ver ]]; then
        echo "Already up-to-date: version $ver"
    else
        update_to $ver && sync_git $ver || patch_pkgbuild $old_ver
    fi
}

cd $0:A:h && main $@
