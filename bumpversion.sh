#!/usr/bin/env bash
PKGNAME="seadrive-gui"
GHREPO="haiwen/seadrive-gui"

log() {
    printf "\e[1m\e[32m==>\e[37m %s\e[0m\n" "$@"
}

log "Fetching latest ${PKGNAME} tags from Github API..."
latestversion=$(curl -sq https://api.github.com/repos/${GHREPO}/tags | jq -r '.[0].name')
printf "\e[1m  \e[34m->\e[37m Found version %s\e[0m\n" "${latestversion}"

log "Updating PKGBUILD version to ${latestversion/v/}-1"
sed -i "s|^pkgver=.*$|pkgver=${latestversion/v/}|; s|^pkgrel=.*$|pkgrel=1|" PKGBUILD

log "Generating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
