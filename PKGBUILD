#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: Author: Marko Haro - Found theme via MARKITOS66

pkgname=xcursor-mayaserie-blue
pkgver=2016.11.10
pkgrel=1
pkgdesc="Maya Serie Blue cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/Maya-Serie/Maya-Blue.tar.gz")
md5sums=('b931ebdeda48eaaa9d5068ca4fd57a52')
url="https://store.kde.org/p/999900"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Maya-Blue24 "$pkgdir"/usr/share/icons/Maya-Blue24
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


