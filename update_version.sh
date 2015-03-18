#!/bin/bash
set -e -v

API_JSON=$(printf '{"tag_name": "v%s", "target_commitish": "master", "name": "v%s", "body": "v%s", "draft": false, "prerelease": false}' $VERSION $VERSION $VERSION)
RELEASE_URL=https://api.github.com/repos/joneshf/purescript/releases
VERSION=$1

# Grab the original tar.
curl -L "https://github.com/purescript/purescript/releases/download/v$VERSION/linux64.tar.gz"> orig.tar.gz
# Make a release
curl --data "$API_JSON" $RELEASE_URL?access_token=$PURESCRIPT_BIN_TOKEN
# Upload the tar.
ASSET_URL=$(curl "$RELEASE_URL/tags/v$VERSION?access_token=$PURESCRIPT_BIN_TOKEN" | json upload_url | sed "s/{.*//")
curl -X POST -H "Content-Type:application/gzip" "$ASSET_URL?access_token=$PURESCRIPT_BIN_TOKEN&name=linux64.tar.gz" -T orig.tar.gz

# Continue with what we normally do.
git clean -fxd
sed -i "s/^pkgver=.*/pkgver="$VERSION"/" PKGBUILD
updpkgsums
makepkg -s
mkaurball -f
namcap purescript-bin*.pkg.tar.xz
aurploader
git add .
git commit -m "Updated version to $VERSION."
git push
