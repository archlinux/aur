# Maintainer: Méven Car <meven@kde.org>
 
pkgname=keychron-k10-he-udev
pkgver=1.0.3
pkgrel=1
pkgdesc='udev rule for the Keychron K10 HE wireless keyboard'
arch=('any')
depends=('keychron-link-udev')
license=('0BSD')
source=('70-keychron-k10-he.rules')
sha256sums=('5effec4fa947e732f66ab33c397755a5b20626b0fae401df35fefc3031adccd6')

package() {
	install -Dm644 70-keychron-k10-he.rules "$pkgdir/usr/lib/udev/rules.d/70-keychron-k10-he.rules"
}
