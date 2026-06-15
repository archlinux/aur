# Maintainer: Méven Car <meven@kde.org>
 
pkgname=keychron-k10-he-udev
pkgver=1.0.2
pkgrel=1
pkgdesc='udev rule for the Keychron K10 HE wireless keyboard'
arch=('any')
depends=('keychron-link-udev')
license=('0BSD')
source=('70-keychron-k10-he.rules')
sha256sums=('fe710afd9bc6047867f34991d81b659f4dd3799a4c9842fd5943b3608ab561b3')

package() {
	install -Dm644 70-keychron-k10-he.rules "$pkgdir/usr/lib/udev/rules.d/70-keychron-k10-he.rules"
}
