#!/usr/bin/env nu
def main [] {
    let pkgbuild_dir = (pwd)
    rm --permanent --force *.tar.zst *.tar.gz

    # update
    cd repo
    git pull

    # clone the repo and remove previous build
    cd $pkgbuild_dir
    rm --recursive --force --permanent pkgrepo
    cp --recursive repo pkgrepo
    cd pkgrepo
    rm --recursive --force --permanent build .deps .git

    # tar the clean source dir
    cd $pkgbuild_dir
    ouch --quiet compress pkgrepo/* repo.tar.gz

    # makepkg
    rm --recursive --permanent pkgrepo
    makepkg --syncdeps --install

    # remove source tarball (DO NOT remove the .tar.zst package, or the git repo)
    rm --permanent *.tar.gz
    rm --recursive --permanent pkg src
}
