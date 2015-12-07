# Maintainer: Silvio Fricke <silvio.fricke@gmail.com>
pkgname=forticlientsslvpn-systemd
pkgver=1
pkgrel=2
pkgdesc="systemd service for fortiClient SSLVPN"
arch=('any')
license=('GPL')
depends=('expect' 'forticlientsslvpn')
backup=('etc/forti.conf')
install='forti.install'
source=("forti.conf"
	"forti.expect"
	"forti.service")

prepare() {
	:
}

build() {
	:
}

check() {
	:
}

package() {
	install -d ${pkgdir}/etc \
		   ${pkgdir}/usr/lib/forti \
		   ${pkgdir}/usr/lib/systemd/system
	install -m 0600 ${srcdir}/forti.conf ${pkgdir}/etc/
	install -m 0755 ${srcdir}/forti.expect ${pkgdir}/usr/lib/forti/forti.expect
	install -m 0644 ${srcdir}/forti.service ${pkgdir}/usr/lib/systemd/system/forti.service
}

md5sums=('e233ab6c985244d9ec7e0f06ee0edb89'
         'b615bce30f3363e7294a3ab178176166'
         'c2039ad66bcf27286ff402dc661371fc')
