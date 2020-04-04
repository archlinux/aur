# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=air-bin
pkgver=1.12.0
pkgrel=2
pkgdesc="Cloud Live reload for Go apps"
arch=('x86_64')
url='https://github.com/cosmtrek/air'
license=('GPL-3.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cosmtrek/air/archive/v${pkgver}.tar.gz")
md5sums=('5752fc5ffadaae4c5b56e10847d933fd')

package() {
	install -Dm755 "${srcdir}/air-${pkgver}/bin/linux/air" "${pkgdir}/usr/bin/air"
	install -Dm644 "${srcdir}/air-${pkgver}/air_example.conf" "$pkgdir/etc/conf.d/air.conf"
	install -Dm644 "${srcdir}/air-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/air/LICENSE"
}