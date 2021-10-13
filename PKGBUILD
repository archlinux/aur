# Maintainer: Remty <remty516@gmail.com>
pkgname=numworks-udev
pkgver=1.0
pkgrel=1
pkgdesc='udev rules to connect the Numworks calculator to your linux box'
arch=('any')
url='https://www.numworks.com/'
license=('Unlicense')
source=('70-numworks.rules')
sha256sums=('d3416bd3e388374b43fb02025f165907f77aec81ea39ecbc5c6a58c7b7ec3776')

package() {
	install -Dm644 70-numworks.rules "$pkgdir/usr/lib/udev/rules.d/70-numworks.rules"
}
