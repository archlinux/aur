# Maintainer: Sergey Khobta <hxss@ya.ru>

pkgname=mpris-proxy-service
pkgver=1.0.0
pkgrel=1
pkgdesc="mpris-proxy systemd service"
arch=(any)
url="http://www.bluez.org/"
depends=("bluez-utils")
install='INSTALL'

package() {
	install -Dm644 ../mpris-proxy.service \
		-t "$pkgdir/usr/lib/systemd/user"
}
