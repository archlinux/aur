#! /bin/bash

location=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

build() {

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
    
    cd location

    echo "// commit $(pwd)"
            
    git add --all  :/
    
    git add PKGBUILD .SRCINFO

    git status 

    local message=$(git status --short)
    
    git commit --message "$message"
    
    git push
    
}

build

commit

