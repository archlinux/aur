#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: Author: Marko Haro - Found theme via MARKITOS66

pkgname=xcursor-mayaserie-orange
pkgver=2016.11.10
pkgrel=1
pkgdesc="Maya Serie Orange cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/Maya-Serie/Maya-Orange.tar.gz")
md5sums=('642110d97fc08256cf976e4e15a2c746')
url="https://store.kde.org/p/999900"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Maya-Orange "$pkgdir"/usr/share/icons/Maya-Orange
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


