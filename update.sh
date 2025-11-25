cd $(dirname $0)

PKGBUILD_VERSION=$(cat PKGBUILD | grep 'pkgver=' | cut -d'=' -f2)
echo "Current PKGBUILD version:"
echo $PKGBUILD_VERSION

VERSION=$(curl --silent https://plexamp.plex.tv/plexamp.plex.tv/desktop/latest-linux.yml | grep version | cut -d' ' -f2)
echo "Latest Plexamp Linux version:"
echo $VERSION

if [ $PKGBUILD_VERSION != $VERSION ]; then
	echo "Newer version found, starting download"
	curl -O https://plexamp.plex.tv/plexamp.plex.tv/desktop/Plexamp-$VERSION.AppImage

	sed -i "s/^pkgver=.*/pkgver=$VERSION/" PKGBUILD
	makepkg
	CHKSUM="$(sha512sum Plexamp-$VERSION.AppImage | cut -d' ' -f1)"
	sed -i "s/^sha512sums=.*/sha512sums=('$CHKSUM')/;s/^pkgrel=.*/pkgrel=1/" PKGBUILD
	makepkg

	echo "Press enter to continue"
	read
	makepkg --printsrcinfo > .SRCINFO
	git add .SRCINFO PKGBUILD
	git commit -m "Updated to $VERSION"
	git push
fi
