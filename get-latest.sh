#!/bin/bash

_get_latest() {
    local url location slug _pkgver _pkgstr

    url="https://download.dremio.com/community-server/dremio-community-LATEST.tar.gz"
    location=$(curl -sI "$url" | grep location | cut -f2 -d' ')
    slug=$(echo $location | cut -d'/' -f3)

    _pkgver=${slug%%-*}
    _pkgstr=${slug#*-}
    echo "pkgver=$_pkgver"
    echo "_pkgstr=$_pkgstr"
}

_get_latest
