#!/bin/sh

V=$(curl --silent "https://api.github.com/repos/jitsi/jitsi-meet/tags" | jq -r '[.[]|select(.name|startswith("stable/jitsi-meet_"))|.name][0][18:]')

echo VERSION=$V
sed -i "s@^_stable_version=.*@_stable_version=$V@" PKGBUILD
updpkgsums
