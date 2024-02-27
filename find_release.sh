#!/usr/bin/env bash

curl -s https://snapcraft.io/taskade > taskade.html

current_version=$(grep -Po "^pkgver=\K.*" PKGBUILD)
version=$(sed -n '/<script type="application\/ld+json">/,/<\/script>/p' taskade.html | \
sed 's/<script type="application\/ld+json">//g' | \
sed 's/<\/script>//g' | \
jq -r '. as $json | if $json["@type"] == "SoftwareApplication" then $json.softwareVersion else empty end')

echo "current version is $current_version"
echo "found version $version"
rm taskade.html

# check if version is different
if [ "$current_version" != "$version" ]; then
    echo "Build the thing"
    echo "Build it" > build.env
    # replace with the actual new version
    sed -i "s/^pkgver=.*/pkgver=${version}/" PKGBUILD
else 
    echo "No new version"
fi

