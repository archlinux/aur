#!/usr/bin/env bash

URL=$(grep -E '^\s*_download_url=' ./PKGBUILD | sed -E 's/_download_url=["'\'' ]*([^"'\'' ]*).*/\1/')
URL_DATA=$(curl -sL "$URL")

VERSION_APP=$(nvchecker -c ./.nvchecker.toml --logger json | jq -r 'select(.event == "updated") | .version')

CURRENT_SUBVERSION_REMOTE_APP=$(grep -E '^\s*_version_celestia_app=' ./PKGBUILD | sed -E 's/_version_celestia_app=["'\'' ]*([^"'\'' ]*).*/\1/')
CURRENT_SUBVERSION_REMOTE_DATA=$(grep -E '^\s*_version_celestia_data=' ./PKGBUILD | sed -E 's/_version_celestia_data=["'\'' ]*([^"'\'' ]*).*/\1/')

CURRENT_VERSION_CSPICE=$(grep -E '^\s*_version_cspice=' ./PKGBUILD | sed -E 's/_version_cspice=["'\'' ]*([^"'\'' ]*).*/\1/')

NEW_SUBVERSION_REMOTE_APP=$(grep -o ">celestia-${VERSION_APP}~.*-x86_64\.pkg\.tar\.zst<" <<< "${URL_DATA}" | head -n 1 | sed -E "s/>celestia-${VERSION_APP}~(.*)-x86_64\.pkg\.tar\.zst</\1/")
NEW_SUBVERSION_REMOTE_DATA=$(grep -o ">celestia-data-${VERSION_APP}~.*-any\.pkg\.tar\.zst<" <<< "${URL_DATA}" | head -n 1 | sed -E "s/>celestia-data-${VERSION_APP}~(.*)-any\.pkg\.tar\.zst</\1/")

NEW_VERSION_CSPICE=$(grep -o ">cspice-.*-x86_64\.pkg\.tar\.zst<" <<< "${URL_DATA}" | head -n 1 | sed -E 's/>cspice-(.*)-x86_64\.pkg\.tar\.zst</\1/')

CURRENT_PKGVER=$(grep -E '^\s*pkgver=' ./PKGBUILD | sed -E 's/pkgver=["'\'' ]*([^"'\'' ]*).*/\1/')
CURRENT_PKGREL=$(grep -E '^\s*pkgrel=' ./PKGBUILD | sed -E 's/pkgrel=["'\'' ]*([^"'\'' ]*).*/\1/')

if [ "${CURRENT_SUBVERSION_REMOTE_APP}" != "${NEW_SUBVERSION_REMOTE_APP}" ] || [ "${CURRENT_SUBVERSION_REMOTE_DATA}" != "${NEW_SUBVERSION_REMOTE_DATA}" ] || [ "${CURRENT_VERSION_CSPICE}" != "${NEW_VERSION_CSPICE}" ]; then
    NEW_PKGVER=${CURRENT_PKGVER}
    NEW_PKGREL=$((CURRENT_PKGREL + 1))

    if [ "${CURRENT_PKGVER}" == "${VERSION_APP}" ]; then
        sed -i "s/^[[:space:]]*_version_celestia_app=.*/_version_celestia_app=\"${NEW_SUBVERSION_REMOTE_APP}\"/" ./PKGBUILD
        sed -i "s/^[[:space:]]*_version_celestia_data=.*/_version_celestia_data=\"${NEW_SUBVERSION_REMOTE_DATA}\"/" ./PKGBUILD

        sed -i "s/^[[:space:]]*_version_cspice=.*/_version_cspice=\"${NEW_VERSION_CSPICE}\"/" ./PKGBUILD

        sed -i "s/^[[:space:]]*pkgver=.*/pkgver=${NEW_PKGVER}/" ./PKGBUILD
        sed -i "s/^[[:space:]]*pkgrel=.*/pkgrel=${NEW_PKGREL}/" ./PKGBUILD

        updpkgsums && makepkg -o && makepkg --printsrcinfo > .SRCINFO

        echo "New version: ${NEW_PKGVER}-${NEW_PKGREL} !"
    else
        echo "Unable to update!"
    fi
else
    if [ "${CURRENT_PKGVER}" == "${VERSION_APP}" ]; then
        echo "Already updated!"
    else
        echo "Unable to update!"
    fi
fi
