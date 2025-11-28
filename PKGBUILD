# Maintainer: crian <crian84 at gmail dot com>

pkgname=mchose-ace68-udev
pkgver=1.0.0
pkgrel=1
pkgdesc='udev rule for the Mchose Ace68 keyboard'
arch=('any')
license=('GPL')
source=('70-mchose-ace68.rules')
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	install -Dm644 70-mchose-ace68.rules "$pkgdir"/usr/lib/udev/rules.d/70-mchose-ace68.rules
}
