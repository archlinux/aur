# Maintainer: edio edio@archlinux.us
pkgname=systemd-nvclock-unit
pkgver=1.0
pkgrel=1
pkgdesc="Apply nvclock fanspeed, GPU and memory clock settings with systemd"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL')
depends=('nvclock' 'systemd')
install=$pkgname.install
source=('nvclock.service'
		'nvclock'
		'systemd-nvclock-unit.install')

md5sums=('b275050a8d6bed8f60ce9a9558abaef5'
         '4f74d99af0b51abae018ffa6153d3ae1'
         'fbb9b2c438e21527aea857dc9744b214')

package() {
	install -Dm644 "${srcdir}/nvclock.service" "${pkgdir}/usr/lib/systemd/system/nvclock.service"
	install -Dm644 "${srcdir}/nvclock" "${pkgdir}/etc/conf.d/nvclock"
}
