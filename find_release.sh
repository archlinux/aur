#!/usr/bin/env bash

curl -s https://snapcraft.io/taskade > taskade.html

version=$(sed -n '/<script type="application\/ld+json">/,/<\/script>/p' taskade.html | \
sed 's/<script type="application\/ld+json">//g' | \
sed 's/<\/script>//g' | \
jq -r '. as $json | if $json["@type"] == "SoftwareApplication" then $json.softwareVersion else empty end')

echo "found version $version"

# replace with the actual new version
sed -i "s/^pkgver=.*/pkgver=${version}/" PKGBUILD
