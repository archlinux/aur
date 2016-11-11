#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: Author: Marko Haro - Found theme via MARKITOS66

pkgname=xcursor-mayaserie-red
pkgver=2016.11.10
pkgrel=1
pkgdesc="Maya Serie Red cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/Maya-Serie/Maya-Red.tar.gz")
md5sums=('5aa2d7d69914f7b43e956e6c579d2b58')
url="https://store.kde.org/p/999900"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Maya-Red24 "$pkgdir"/usr/share/icons/Maya-Red24
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


