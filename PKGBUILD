#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: Author: Marko Haro - Found theme via MARKITOS66

pkgname=xcursor-mayaserie-black
pkgver=2016.11.13
pkgrel=1
pkgdesc="Maya Serie Black cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/Maya-Serie/Maya-Black.tar.gz")
md5sums=('96e24ae694ad1a66d0ee764a926acf46')
url="https://store.kde.org/p/999900"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Maya-Black "$pkgdir"/usr/share/icons/Maya-Black
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


