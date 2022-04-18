#!/bin/sh

REPO="tuProlog/2p-kt"

function get_latest_release() {
  curl --silent "https://api.github.com/repos/$REPO/releases/latest" | 
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

function escape4sed() {
    printf '%s\n' "$1" | sed -e 's/[\/&]/\\&/g'
}

LATEST_VERSION=`get_latest_release`
URL="https://github.com/$REPO"
VERSION=${1:-$LATEST_VERSION}

REPL_DIGEST=$(wget -q $URL/releases/download/$VERSION/2p-repl-$VERSION-redist.jar | sha256sum)
IDE_DIGEST=$(wget -q $URL/releases/download/$VERSION/2p-ide-$VERSION-redist.jar | sha256sum)

cat .PKGBUILD.template  | 
    sed -e "s/__VERSION__/$VERSION/g" |
    sed -e "s/__URL__/$(escape4sed $URL)/g" |
    sed -e "s/__REPL_DIGEST__/$(escape4sed $REPL_DIGEST)/g" |
    sed -e "s/__IDE_DIGEST__/$(escape4sed $IDE_DIGEST)/g"
