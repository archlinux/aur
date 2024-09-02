#!/usr/bin/env bash
PKGNAME="ledfx-cc"
GHREPO="YeonV/LedFx-Builds"

log() {
    printf "\e[1m\e[32m==>\e[37m %s\e[0m\n" "$@"
}

log "Fetching latest ${PKGNAME} release from Github API..."
latestversion=$(curl -sq https://api.github.com/repos/${GHREPO}/releases/latest | jq -r '.tag_name')
printf "\e[1m  \e[34m->\e[37m Found version %s\e[0m\n" "${latestversion}"

version=${latestversion/v/}
log "Updating PKGBUILD version to ${version/-/_}-1"
sed -i "s|^pkgver=.*$|pkgver=${version/-/_}|; s|^pkgrel=.*$|pkgrel=1|" PKGBUILD
updpkgsums

log "Generating .SRCINFO"
makepkg --printsrcinfo > .SRCINFO
