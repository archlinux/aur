#! /bin/bash

# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

# build package automation

location=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $location/PKGBUILD 
cd $location

is_root() {
    [[ $(id -u) == 0 ]]
}

has_makepkg() {
    which makepkg >/dev/null 2>&1
}


provision() {
    if has_makepkg ; then
        provision_proper
    else
        provision_simple
    fi
}

provision_proper() {
    echo "// provision_proper"
    local suno=""
    if is_root ; then
        chown -R nobody $location
        suno="sudo -u nobody"
    fi
    $suno makepkg --log --cleanbuild --install --force
}

provision_simple() {
    echo "// provision_simple"
    local source="https://github.com/random-archer/mkinitcpio-systemd-tool.git"
    if [ -e "$pkgname" ] ; then
        cd "$pkgname" && git pull
    else
        git clone "$source"
    fi
    cd $location
}

version() {
    echo "pkgver $(pkgver)"
    if has_makepkg; then
        version_proper
    else
        version_simple
    fi
}

version_simple() {
    echo "// version_simple"
    
    local pkgver=$(pkgver)
    local file_list="PKGBUILD .SRCINFO"
    
    local file
    for file in $file_list ; do
        sed -i "s:^\([ ]*pkgver[ ]*=[ ]*\).*:\1$pkgver:" "$file"
        #cat $file | grep "pkgver"
    done
}

version_proper() {
    echo "// version_proper"
    
    local suno=""
    if is_root ; then
        chown -R nobody $location
        suno="sudo -u nobody"
    fi
  
    $suno makepkg --log --cleanbuild --noarchive --force

    $suno makepkg --log --printsrcinfo > .SRCINFO
                        
}

commit() {
    echo "// commit"
    
    git add --all  :/
    git status 

    local message=$(git status --short)
    git commit --message "$message"
                                                
    git push
    
}


provision

version

commit
