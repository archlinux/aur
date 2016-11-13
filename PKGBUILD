#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: Marcus Haro 

pkgname=xcursor-mayaserie-white
pkgver=2016.11.13
pkgrel=1
pkgdesc="Maya Serie White cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/Maya-Serie/Maya-White.tar.gz")
md5sums=('83adac56a6898977c399f52d8d6da250')
url="https://store.kde.org/p/999900"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership Maya-White24 "$pkgdir"/usr/share/icons/Maya-White24
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}

