#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: KUDUK - Original Theme By TICUS

pkgname=xcursor-red-dot
pkgver=2016.11.11
pkgrel=1
pkgdesc="Red Dot cursor theme"
arch=('any')
license=('GPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/xcursor-red-dot/RedDot.tar.gz")
md5sums=('9dee5b22abfedd495918f47c9c816dde')
url="https://store.kde.org/p/999529/"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Red-Dot "$pkgdir"/usr/share/icons/Red-Dot
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


