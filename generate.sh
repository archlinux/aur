#!/bin/sh
set -e

function escape4sed() {
    printf '%s\n' "$1" | sed -e 's/[\/&]/\\&/g'
}

VERSION=$1

if [[ -z $VERSION ]]; then
  echo "e: no version provided"
  exit 1
fi

SOURCE=dummy-project-4-testing-gha-release-on-aur.sh

echo "echo dummy-project-4-testing-gha-release-on-aur v$VERSION" > $SOURCE

DIGEST=$(cat $SOURCE | sha256sum - | cut -d' ' -f 1)

cat .PKGBUILD.template  | 
    sed -e "s/__VERSION__/$VERSION/g" |
    sed -e "s/__DIGEST__/$(escape4sed $DIGEST)/g" > PKGBUILD
