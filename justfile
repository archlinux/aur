PKG_NAME := "::jpg.proj.name::"
AUR_GIT_URL := 'ssh://aur@aur.archlinux.org/' + PKG_NAME + '.git'

use_jj := env("use_jj", `type jj 2> /dev/null || echo ""`)

# initialize project
initialize:
    git branch -m master # AUR only accept 'master' branch
    if [ -n '{{use_jj}}' ]; then jj git init --colocate; fi

# update package metadata
update:
    makepkg --printsrcinfo > .SRCINFO # .SRCINFO must exists in all the commits
    updpkgsums

# build package
build: update
    makepkg -sf

# install package
install: update
    makepkg -si


    
