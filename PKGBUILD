#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: TYCUS

pkgname=xcursor-terranove
pkgver=2016.11.14
pkgrel=1
pkgdesc="Terranove cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/xcursor-terranove/Terranove.tar.gz")
md5sums=('f540fc86f0b43696712097dcf33e700c')
url="https://store.kde.org/p/999987/"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Terranove "$pkgdir"/usr/share/icons/Terranove
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}

