#!/bin/bash
cd "$(dirname "${0}")"
hash git mksrcinfo wget

##  PKGBUILD updater for bitwig-studio
## --------------------------------------------------------
## Checks for new releases by incrementing the current version number.
## Automatically commits changes if new version was found.
##
## Depends on: git semver pkgbuild-introspection

try_increment() {
    ## Reset to last known update
    git reset --hard > /dev/null

    ## Get variables from PKGBUILD
    source PKGBUILD

    ## Prepare version strings
    local targetver="$(semver -i ${1} ${pkgver})"
    local shortver="$(shorten_version "${targetver}")"
    local targetrel="1"

    echo "Trying version ${targetver}..."

    ## Update version strings
    sed -i "s/pkgver='[0-9.]*'/pkgver='${targetver}'/" PKGBUILD
    sed -i "s/_pkgver='[0-9.]*'/_pkgver='${shortver}'/" PKGBUILD
    source PKGBUILD

    ## Remove previous downloads
    rm -f *.deb *.pkg.*

    ## Download the package
    wget -q --show-progress "${source[0]}" || return

    ## Update checksum
    local targetsum="$(sha256sum bitwig-studio-${pkgver}.deb | cut -d ' ' -f 1)"
    sed -i "s/sha256sums=('${sha256sums[0]}')/sha256sums=('${targetsum}')/" PKGBUILD
    sed -i "s/pkgrel=.*/pkgrel='${targetrel}'/" PKGBUILD

    ## Build the package
    makepkg -f || exit
    mksrcinfo || exit

    ## Publish the update
    git add -A
    git status
    git commit -m "Update to ${targetver}"

    echo "Done!"
    exit
}

shorten_version() {
    local x="$(echo "${1}" | cut -f1,2 -d.)"
    [[ "${x}.0" == "${1}" ]] && echo "${x}" || echo "${1}"
}

## Reset to last known update
git reset --hard > /dev/null

## Try various versions
try_increment patch
try_increment minor
try_increment major

## Oh how sad...
echo "No new versions today :c"

## Reset to last known update
git reset --hard > /dev/null
