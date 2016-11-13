#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: Author: Marko Haro - Found theme via MARKITOS66

pkgname=xcursor-mayaserie-green
pkgver=2016.11.13
pkgrel=1
pkgdesc="Maya Serie Green cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/Maya-Serie/Maya-Green.tar.gz")
md5sums=('1f87e7aeca07691b1055199914e0a64c')
url="https://store.kde.org/p/999900"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Maya-Green "$pkgdir"/usr/share/icons/Maya-Green
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


