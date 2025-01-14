# Maintainer: crian <crian84@gmail.com>

pkgname=wooting-udev
pkgver=1.0.0
pkgrel=2
pkgdesc='udev rule for wooting keyboards'
arch=('any')
license=('GPL')
source=('70-wooting.rules')
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	install -Dm644 70-wooting.rules "$pkgdir"/etc/udev/rules.d/70-wooting.rules
}
