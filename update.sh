#!/bin/bash -e

source PKGBUILD
PKGNAME=$_name
RELEASES=$(curl -sL https://pypi.org/pypi/$PKGNAME/json | jq .releases)
LICENSE_URL="https://raw.githubusercontent.com/pola-rs/polars/master/LICENSE"

LICENSE_SHA512=$(curl -sL $LICENSE_URL | sha512sum - | cut -d' ' -f1)

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

DOWNLOAD_URL=$(jq -r <<<$RELEASES --arg last $LAST '
    .[$last][]
        | select(.packagetype == "bdist_wheel")
        | select(.filename | contains("linux"))
        | select(.filename | contains("x86_64"))
        .url
')

SHA512=$(curl -sL $DOWNLOAD_URL | sha512sum - | cut -d' ' -f1)
FILENAME=$(basename $DOWNLOAD_URL)

sed -i 's,source=.*$,source=("'${DOWNLOAD_URL}'" "'$LICENSE_URL'"),' PKGBUILD
sed -i 's/noextract=.*$/noextract=("'$FILENAME'")/' PKGBUILD
sed -i 's/sha512sums=.*$/sha512sums=("'$SHA512'" "'$LICENSE_SHA512'")/' PKGBUILD
sed -i 's/pkgver=.*/pkgver='$LAST'/' PKGBUILD
sed -i 's/pkgrel=.*/pkgrel=1/' PKGBUILD

# Make sure it builds fine
makepkg -f

git add PKGBUILD
git commit -m "Update to $LAST"
git push
