# Maintainer: crian <crian84 at gmail dot com>

pkgname=mchose-a7-v2-pro-udev
pkgver=1.0.0
pkgrel=1
pkgdesc='udev rule for the Mchose A7 V2 Pro Gaming Mouse'
arch=('any')
license=('GPL')
source=('70-mchose-a7-v2-pro.rules')
sha256sums=('SKIP')

package() {
	cd "$srcdir"
	install -Dm644 70-mchose-a7-v2-pro.rules "$pkgdir"/usr/lib/udev/rules.d/70-mchose-a7-v2-pro.rules
}
