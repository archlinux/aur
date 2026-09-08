cd $(dirname $0)

PKGBUILD_VERSION=$(cat PKGBUILD | grep 'pkgver=' | cut -d'=' -f2)
echo "Current PKGBUILD version:"
echo $PKGBUILD_VERSION

echo "Downloading latest update json"
curl -O --silent https://plexamp.plex.tv/desktop/tauri-update.json

VERSION=$(jq -r '.version' tauri-update.json)
echo "Latest Plexamp Beta Linux version:"
echo $VERSION

if [ $PKGBUILD_VERSION != $VERSION ]; then
	echo "Newer version found, starting download"
	LATEST_PACKAGE_X86_64=$(jq -r '.platforms."linux-x86_64".url' tauri-update.json)
	LATEST_PACKAGE_AARCH64=$(jq -r '.platforms."linux-aarch64".url' tauri-update.json)
	curl -O "$LATEST_PACKAGE_X86_64"
	curl -O "$LATEST_PACKAGE_AARCH64"

	sed -i "s/^pkgver=.*/pkgver=$VERSION/" PKGBUILD
	makepkg
	CHKSUM_X86_64="$(sha256sum Plexamp-$VERSION-x86_64.AppImage | cut -d' ' -f1)"
        sed -i "s/^sha256sums_x86_64=.*/sha256sums_x86_64=('$CHKSUM_X86_64')/;s/^pkgrel=.*/pkgrel=1/" PKGBUILD
	CHKSUM_AARCH64="$(sha256sum Plexamp-$VERSION-aarch64.AppImage | cut -d' ' -f1)"
        sed -i "s/^sha256sums_aarch64=.*/sha256sums_aarch64=('$CHKSUM_AARCH_64')/;s/^pkgrel=.*/pkgrel=1/" PKGBUILD
        makepkg

	echo "Press enter to continue"
        read
        makepkg --printsrcinfo > .SRCINFO
        git add .SRCINFO PKGBUILD
        git commit -m "Updated to $VERSION"
        git push
fi
