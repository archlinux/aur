#!/bin/bash

prev_version=$1
new_version=$2

# Replace version
sed -i "s/$prev_version/$new_version/g" ./PKGBUILD

# Print SRCINFO
makepkg --printsrcinfo > .SRCINFO

git add -A && git commit -m "deploy $new_version version"
git push origin master
