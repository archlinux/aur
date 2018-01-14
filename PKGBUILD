# Maintainer: Patrick Wicki <patrick.wicki@member.fsf.org>

pkgname=pacload
pkgver=1
pkgrel=1
pkgdesc="Systemd service and timer to automatically download updated packages daily"
arch=(any)
license=('GPL')
source=(pacload.service
	pacload.timer)
sha256sums=('958a57afc60adde9cb742c665164af56a8d4ee93254627f06df4c461bd33e49d'
            '2ea045a644d6d66a562d3415e866304985405b18a74361950d25e36f437472a7')


package() {
	cd "$srcdir"
	install -Dm 644 pacload.service "$pkgdir/usr/lib/systemd/system/pacload.service"
	install -Dm 644 pacload.timer "$pkgdir/usr/lib/systemd/system/pacload.timer"
}
