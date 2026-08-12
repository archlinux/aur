# Maintainer: Caitlyn Williams <caitlyn dot williams at proton dot me>
 
pkgname=keychron-r6-udev
pkgver=1.0.0
pkgrel=1
pkgdesc='udev rule for the Keychron R6 Keyboard (USB and DFU modes)'
arch=('any')
license=('Unlicense')
source=('70-keychron-r6.rules')

package() {
	install -Dm644 70-keychron-r6.rules "$pkgdir/usr/lib/udev/rules.d/70-keychron-r6.rules"
}

sha256sums=('972e2bd96a2495510f89e022791852d51a5fdd829a00d033140eb184d576ef73')
