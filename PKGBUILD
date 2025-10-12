# Maintainer: Michał Gawron <mgawron@metacode.pl>
 
pkgname=keychron-q3-max-udev
pkgver=1.0.0
pkgrel=1
pkgdesc='udev rule for the Keychron Q3 Max wireless keyboard'
arch=('any')
depends=('qmk')
license=('0BSD')
source=('70-keychron-q3-max.rules')
sha256sums=('c37ffe5397840cb3e39181c1262ca262afefe4065918870f41bc623549fdee7d')

package() {
	install -Dm644 70-keychron-q3-max.rules "$pkgdir/usr/lib/udev/rules.d/70-keychron-q3-max.rules"
}
