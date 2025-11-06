# Maintainer: Michał Gawron <mgawron@metacode.pl>
 
pkgname=keychron-q3-max-udev
pkgver=1.0.1
pkgrel=1
pkgdesc='udev rule for the Keychron Q3 Max wireless keyboard'
arch=('any')
depends=('keychron-link-udev')
license=('0BSD')
source=('70-keychron-q3-max.rules')
sha256sums=('74be02e98f0ed447299d7d505459917493915ce4e1c1cec3efb956ade72ec89e')

package() {
	install -Dm644 70-keychron-q3-max.rules "$pkgdir/usr/lib/udev/rules.d/70-keychron-q3-max.rules"
}
