#! /bin/bash

# package build automation

location=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

is_root() {
    [[ $(id -u) == 0 ]]
}

has_makepkg() {
    which makepkg >/dev/null 2>&1
}

update() {

    echo  "// update"
    
    cd $location
    
    git pull
    
}

build() {

    echo "// build"
    
}

pkgver() {
    cd "$location"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


version() {
    if has_makepkg; then
        version_proper
    else
        version_simple
    fi
}

version_simple() {
    echo "// version_simple"
    
    echo "pkgver $(pkgver)"
}

version_proper() {
    echo "// version_proper"
    
    cd $location
 
    local suno=""
    if is_root ; then
        chown -R nobody $location
        suno="sudo -u nobody"
    fi
  
    $suno makepkg --log --cleanbuild --noarchive --force

    $suno makepkg --log --printsrcinfo > .SRCINFO
                        
}

commit() {

    cd $location

    echo "// commit $(pwd)"
            
    git add --all  :/

    git status 

    local message=$(git status --short)
    
    git commit --message "$message"
                                                
    git add PKGBUILD .SRCINFO

    git push
    
}


#update

#build

#commit

version
