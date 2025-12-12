#!/bin/sh

PKGBUILD_VERSION=$(cat PKGBUILD | grep 'pkgver=' | cut -d'=' -f2)
echo "Current PKGBUILD version:"
echo $PKGBUILD_VERSION

VERSION=$(curl --silent https://api.github.com/repos/motherduckdb/metabase_duckdb_driver/releases/latest | jq -r '.tag_name')
echo "Latest Metabase DuckDB Driver version:"
echo $VERSION

if [ $PKGBUILD_VERSION != $VERSION ]; then
	echo "Newer version found, starting download"
	curl -O https://github.com/motherduckdb/metabase_duckdb_driver/releases/download/$VERSION/duckdb.metabase-driver.jar
	
	sed -i "s/^pkgver=.*/pkgver=$VERSION/" PKGBUILD
	CHKSUM="$(b2sum duckdb.metabase-driver.jar | cut -d' ' -f1)"

	sed -i "s/^b2sums=.*/b2sums=('$CHKSUM')/" PKGBUILD

        makepkg --printsrcinfo > .SRCINFO

	echo "Ready to commit?"
	read
        git add .SRCINFO PKGBUILD
        git commit -m "Updated to $VERSION"
        git push
fi
