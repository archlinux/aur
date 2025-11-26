# Maintainer: crian <crian84 at gmail dot com>

pkgname=lamzu-maya-x-udev
pkgver=1.0.1
pkgrel=1
pkgdesc='udev rule for the Lamzu Maya X Gaming Mouse'
arch=('any')
license=('GPL')
source=('70-lamzu-maya-x.rules')
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	install -Dm644 70-lamzu-maya-x.rules "$pkgdir"/usr/lib/udev/rules.d/70-lamzu-maya-x.rules
}
