#! /bin/bash

location=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

updaet() {

    echo  "update"
    
    cd $location
    
    git pull
    
}

build() {

    echo "build"
    
    cd $location

    [ which makepkg ] || return 1
    
    chown -R nobody $location
 
    local suno="sudo -u nobody"
  
    #    --skipinteg \
    #    --install \
    
    $suno makepkg \
      --printsrcinfo > .SRCINFO
      
    #return 0

    $suno makepkg \
    --cleanbuild \
    --syncdeps \
    --noconfirm \
    --needed \
    --force \
    
}

commit() {

    echo "commit"
    
    cd $location

    echo "// commit $(pwd)"
            
    git add --all  :/
    
    git add PKGBUILD .SRCINFO

    git status 

    local message=$(git status --short)
    
    git commit --message "$message"
    
    git push
    
}

update

build

commit
