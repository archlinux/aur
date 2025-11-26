# Maintainer: crian <crian84 at gmail dot com>

pkgname=atk-a9-udev
pkgver=1.0.0
pkgrel=2
pkgdesc='udev rule for the ATK A9 Mouse'
arch=('any')
license=('GPL')
source=('70-atk-a9.rules')
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	install -Dm644 70-atk-a9.rules "$pkgdir"/usr/lib/udev/rules.d/70-atk-a9.rules
}
