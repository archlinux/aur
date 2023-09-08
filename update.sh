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

LICENSE_URL="https://raw.githubusercontent.com/pola-rs/polars/py-$LAST/LICENSE"
LICENSE_SUM=$(curl -sL $LICENSE_URL | $HASH - | cut -d' ' -f1)

DOWNLOAD_URL=$(jq -r <<<$RELEASES --arg last $LAST '
    .[$last][]
        | select(.packagetype == "bdist_wheel")
        | select(.filename | contains("linux"))
        | select(.filename | contains("x86_64"))
        .url
')

SUM=$(curl -sL $DOWNLOAD_URL | $HASH - | cut -d' ' -f1)
FILENAME=$(basename $DOWNLOAD_URL)

sed -i 's,source=.*$,source=("'${DOWNLOAD_URL}'" "'$LICENSE_URL'"),' PKGBUILD
sed -i 's/noextract=.*$/noextract=("'$FILENAME'")/' PKGBUILD
sed -i 's/.*sums=.*$/'$HASH_NAME'=("'$SUM'" "'$LICENSE_SUM'")/' PKGBUILD
sed -i 's/pkgver=.*/pkgver='$LAST'/' PKGBUILD
sed -i 's/pkgrel=.*/pkgrel=1/' PKGBUILD

# Make sure it builds fine
makepkg -f

git add PKGBUILD
git commit -m "Update to $LAST"
git push
