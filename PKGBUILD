# Maintainer: crian <crian84@gmail.com>

pkgname=wooting-udev
pkgver=1.0.1
pkgrel=1
pkgdesc='udev rule for wooting keyboards'
arch=('any')
license=('GPL')
source=('70-wooting.rules')
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	install -Dm644 70-wooting.rules "$pkgdir"/usr/lib/udev/rules.d/70-wooting.rules
}
