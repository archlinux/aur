#!/bin/bash
_remote=$(curl -sL https://product-details.mozilla.org/1.0/firefox_versions.json | jq -r '.FIREFOX_NIGHTLY')
_current=$(grep _version= PKGBUILD | cut -f2 -d'=')
echo "PKGBUILD: ${_current}, REMOTE: ${_remote}"
if [ "${_remote}" != "${_current}" ]; then
    sed -i "s/_version=.*/_version=${_remote}/" PKGBUILD
    echo "Updated"
    exit 0
fi
echo "Nothing to do"
exit 1
