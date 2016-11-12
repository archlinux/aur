#Maintainer: Jeremy Marlow <i3_arch[at]archlinux.info>
#Contributor: KUDUK - Original Theme By TYCUS

pkgname=xcursor-neo-alien
pkgver=2016.11.11
pkgrel=1
pkgdesc="Neo Alien cursor theme"
arch=('any')
license=('LGPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/xcursor-neo-alien/NeoAlien.tar.gz")
md5sums=('accce3f87112c30ecc328f7ccef6b70c')
url="https://store.kde.org/p/999841/"

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership NeoAlien "$pkgdir"/usr/share/icons/NeoAlien
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}


