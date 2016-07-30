# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=ovpngen
pkgver=1.20
pkgrel=1
pkgdesc="Generate an OpenVPN Connect private tunnel profile in the unified format."
arch=('any')
url="http://github.com/graysky2/ovpn-writer"
license=('MIT')
source=(https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('d4f2f7399542f74aec1787b72a29394d4313edf1177cfa08b649e5ac37c15f90')

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
