# Maintainer: Michał Gawron <mgawron@metacode.pl>
 
pkgname=keychron-link-udev
pkgver=1.0.0
pkgrel=1
pkgdesc='udev rule for the Keychron Link wireless receiver'
arch=('any')
license=('0BSD')
source=('70-keychron-link.rules')
sha256sums=('05d7abb7ad9a10930fcdb7eb434b6c5f5b1e15c287ac4a4150b80c3847b78be7')

package() {
	install -Dm644 70-keychron-link.rules "$pkgdir/usr/lib/udev/rules.d/70-keychron-link.rules"
}
