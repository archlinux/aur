#!/bin/bash

TOKEN_HASH_VERSION="$(curl -s "https://firebasestorage.googleapis.com/v0/b/twilioquest-prod.appspot.com/o/launchers%2F8%2Ftwilioquest-linux-amd64.zip" | jq .downloadTokens,.updated | tr -d '"' | tr '\n' ' ')"

TOKEN="$(echo $TOKEN_HASH_VERSION | awk '{print $1}')"
VERSION="$(echo $TOKEN_HASH_VERSION | awk '{print $2}')"
VERSION="${VERSION%%T*}"
VERSION="${VERSION//-/.}"

URL="https://firebasestorage.googleapis.com/v0/b/twilioquest-prod.appspot.com/o/launchers%2F8%2Ftwilioquest-linux-amd64.zip?alt=media&token=$TOKEN"

SOURCE_FILE='${pkgname}-${pkgver}.x86_64.zip'

ESCAPED_URL="$(echo $URL | sed -e 's/[]$/&*[\^]/\\&/g')"
sed -i '/source=*/s/.*/source=("'$SOURCE_FILE'::'$ESCAPED_URL'")/' PKGBUILD
# sed -i '/pkgver=*/s/.*/pkgver='$VERSION'/' PKGBUILD

updpkgsums

makepkg --printsrcinfo > .SRCINFO
