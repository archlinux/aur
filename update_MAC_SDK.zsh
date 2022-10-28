#!/usr/bin/env zsh

function get_last_link(){
    local page_link=https://monkeysaudio.com/developers.html
    local link=$(curl -s $page_link | awk -F '"' '/latest version/{print $2}')
    echo $link
}

function get_current_link(){
    local link=$(awk -F\' '/source=/{print $2}' PKGBUILD)
    echo $link
}

function get_version(){
    local link=$1
    digits=${link:t:r:s/MAC_//:s/_SDK//}
    major=$digits[1].${digits[2,3]}
    minor=${digits[4,-1]}
    [[ -n $minor ]] && echo $major.$minor || echo $major
}

function patch_pkgbuild(){
    local link=$1
    local version=$2
    sed -i "s@source=.*@source=('$link')@" PKGBUILD
    sed -i "s/pkgver=.*/pkgver=$version/" PKGBUILD
}

function update_to(){
    local link=$1
    local version=$2
    patch_pkgbuild $link $version
    updpkgsums && makepkg && makepkg --printsrcinfo > .SRCINFO
}

function sync_git(){
    local version=$1
    git commit PKGBUILD .SRCINFO -m "Update SDK to $version"
    git push
}

function try_update(){
    local link=$1
    local old_link=$(get_current_link)
    local ver=$(get_version $link)
    if [[ $link == $old_link ]]; then
        echo "Already up-to-date: version $ver"
    else
        local old_ver=$(get_version $old_link)
        update_to $link $ver && sync_git $ver || patch_pkgbuild $old_link $old_ver
    fi
}

function main(){
    local link=$(get_last_link)
    [[ -n $link ]] && try_update $link || { echo "Can't retrieve SDK link" && return 1 }
}

cd $0:A:h && main $@
