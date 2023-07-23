cd $(dirname $0)

NEWVER=$1

if [ "$NEWVER" = "" ]; then
	echo "enter version name"
	exit 1
fi

sed -i "s/^pkgver=.*/pkgver=$NEWVER/" PKGBUILD
makepkg
CHKSUM="$(sha512sum Plexamp-$NEWVER.AppImage | cut -d' ' -f1)"
sed -i "s/^sha512sums=.*/sha512sums=('$CHKSUM')/;s/^pkgrel=.*/pkgrel=1/" PKGBUILD
makepkg

echo "Press enter to continue"
read
makepkg --printsrcinfo > .SRCINFO
git add .SRCINFO PKGBUILD
git commit -m "Updated to $NEWVER"
git push
