#!/bin/bash -xve
export BASEDIR=$(dirname "$0")
cd "$BASEDIR"

pip install lastversion

export REPO_URL="https://github.com/Eugeny/tabby"
export PACKAGE_VER=$(python -m lastversion $REPO_URL)
export FILENAME="tabby-$PACKAGE_VER-linux-x64.pacman"
export RELEASE_URL="$REPO_URL/releases/download/v$PACKAGE_VER/$FILENAME"

curl -Lf "$RELEASE_URL" > $FILENAME

export SHA256=$(sha256sum "$FILENAME" | cut -d " " -f1)

cat PKGBUILD.template | sed "s/<PKGVER>/$PACKAGE_VER/g" | sed "s/<SHA256>/$SHA256/g" | tee PKGBUILD

rm "$FILENAME"
