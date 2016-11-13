#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: KUDUK - Original Theme By TYCUS

pkgname=xcursor-neo-alien-dark
pkgver=2016.11.12
pkgrel=1
pkgdesc="Neo Alien Dark cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/xcursor-neo-alien-dark/NeoAlien-Dark.tar.gz")
md5sums=('a14a152702af0c0a31528700b186ab35')
url="https://store.kde.org/p/999816/"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership NeoAlien-dark "$pkgdir"/usr/share/icons/NeoAlien-dark
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


