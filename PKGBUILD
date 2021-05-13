# Maintainer: DelightedCat <bottledlactose@gmail.com>

# This PKGBUILD is meant for those who have a purchased license for Aseprite.
# In order to use this script, place the downloaded .deb file next to this PKGBUILD file.
#
# Then go ahead and build your package as usual with makepkg!

pkgname=aseprite-deb
pkgver=1.2.27
pkgrel=1
pkgdesc="Create animated sprites and pixel art"
arch=('x86_64')
url="http://www.aseprite.org/"
license=('custom')
depends=()
conflicts=("aseprite" "aseprite-git" "aseprite-gpl")

package() {
	ar x Aseprite_$pkgver-1_amd64.deb
	tar xf data.tar.xz -C $pkgdir
	chmod -R 755 $pkgdir/usr
	chmod +x $pkgdir/usr/bin/aseprite
}
