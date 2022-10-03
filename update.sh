#!/bin/bash
set -e
set -o pipefail

HASH=b2sum
HASH_NAME=b2sums

source PKGBUILD
PKGNAME=$_name
RELEASES=$(curl -sL https://pypi.org/pypi/$PKGNAME/json | jq .releases)
LAST=$(jq -r <<<$RELEASES '
[ keys[]
    | select(contains("beta") == false)
    | [split(".")[] | tonumber] ]
  | sort[-1]
  | join(".")
')

if [ "$pkgver" == "$LAST" ]; then
    echo "Already up to date" >&2
    exit 0
fi

DOWNLOAD_URL="https://github.com/pola-rs/polars/archive/refs/tags/py-v$LAST.tar.gz"
SUM=$(curl -sL $DOWNLOAD_URL | $HASH - | cut -d' ' -f1)

sed -i 's/.*sums=.*$/'$HASH_NAME'=("'$SUM'")/' PKGBUILD
sed -i 's/pkgver=.*/pkgver='$LAST'/' PKGBUILD
sed -i 's/pkgrel=.*/pkgrel=1/' PKGBUILD

# Make sure it builds fine
makepkg

git add PKGBUILD
git commit -m "Update to $LAST"
git push
