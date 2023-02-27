# Maintainer: Sergey Khobta <hxss@ya.ru>
# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=mpris-proxy-service
pkgver=1.0.0
pkgrel=2
pkgdesc="mpris-proxy systemd service"
arch=(any)
url="http://www.bluez.org/"
depends=("bluez-utils")
install='INSTALL'

_service="mpris-proxy.service"
source=("${_service}")
sha256sums=('7e0c5e632cbf1188d7bfe2f12c8b567f239d397292b82c7fa1404a2f4413bc77')

package() {
	install -Dm644 "${srcdir}/${_service}" -t "${pkgdir}/usr/lib/systemd/user"
}
