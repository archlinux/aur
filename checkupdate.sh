#!/bin/bash

TMP_PATH=/tmp/guildedupdate
cwd=$(pwd)

curversion=$(awk -F'=' '/pkgver=/ { print $2 }' PKGBUILD)
curhash=$(awk -F'=' '/sha256sums = / { print $2 }' .SRCINFO | cut -c 2-)

rm -rf $TMP_PATH
mkdir -p $TMP_PATH
cd $TMP_PATH || exit

wget https://www.guilded.gg/downloads/Guilded-Linux.deb
hash=$(sha256sum Guilded-Linux.deb | awk '{ print $1 }')

ar x Guilded-Linux.deb
tar xzf control.tar.gz

version=$(awk '/^Version:/ { print $2 }' control | cut -d '-' -f1 | sed s/~release//)

echo "--------------------"
echo "sha256sum: $hash"
echo "version: $version"
if [ "$version" != "$curversion" ]; then
  echo "Package is outdated! Updating with new values..."
  sed -i "s/$curversion/$version/g" $cwd/.SRCINFO
  sed -i "s/$curversion/$version/g" $cwd/PKGBUILD

  sed -i "s/$curhash/$hash/g" $cwd/.SRCINFO
  sed -i "s/$curhash/$hash/g" $cwd/PKGBUILD
  echo "Package versions updated"
else
  echo "Package is up to date!"
fi
echo "--------------------"


rm -rf $TMP_PATH
