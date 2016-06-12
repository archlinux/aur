#! /bin/bash

# build package automation

readonly location=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
source $location/PKGBUILD

is_root() {
    [[ $(id -u) == 0 ]]
}

has_makepkg() {
    which makepkg >/dev/null 2>&1
}


do_provision() {
    if has_makepkg ; then
        do_provision_proper
    else
        do_provision_simple
    fi
}

do_provision_proper() {
    echo "// do_provision_proper"
    local suno=""
    if is_root ; then
        chown -R nobody $location
        suno="sudo -u nobody"
    fi
    $suno makepkg --force
}

do_provision_simple() {
    echo "// do_provision_simple"
    local source="$url.git"
    if [[ -e $pkgname ]] ; then
        git -C $pkgname pull
    else
        git clone $source
    fi
}

do_version() {
    #echo "version $pkgver -> $(pkgver)"
    if has_makepkg; then
        do_version_proper
    else
        do_version_simple
    fi
}

do_version_simple() {
    echo "// do_version_simple"
    
    local pkgver=$(pkgver)
    local file_list="PKGBUILD .SRCINFO"
    
    local file
    for file in $file_list ; do
        sed -r -i "s%^([ ]*pkgver[ ]*=[ ]*).*%\1$pkgver%" "$file"
        sed -r -i "s%#tag=v[0-9]+%#tag=v$pkgver%"  "$file"
    done
}

do_version_proper() {
    echo "// do_version_proper"
    
    local suno=""
    local user="nobody"
    if is_root ; then
        chown -R $user $location
        suno="sudo -u $user"
    fi
  
    $suno makepkg --printsrcinfo > .SRCINFO
                        
}

do_commit() {
    echo "// do_commit"
    
    git add --all  :/
    git status 

    local message=$(git status --short)
    git commit --message "$message"
                                                
    git push
    
}

do_clean() {
    echo "// clean"
    rm -rf "$location/$pkgname"
    rm -rf "$location/src"
    rm -rf "$location/pkg"
}

###

#set -e

do_provision

do_version

do_commit

do_clean
