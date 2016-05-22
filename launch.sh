#! /bin/bash

# build package automation

location=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd $location

is_root() {
    [[ $(id -u) == 0 ]]
}

has_makepkg() {
    which makepkg >/dev/null 2>&1
}


provision() {
    echo "// provision"

    has_makepkg || return 0    
    
    local suno=""
    if is_root ; then
        chown -R nobody $location
        suno="sudo -u nobody"
    fi
  
    $suno makepkg --log --cleanbuild --install --force

}

pkgver() {
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
