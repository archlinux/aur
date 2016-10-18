# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=ovpngen
pkgver=1.24
pkgrel=1
pkgdesc="Generate an OpenVPN client profile in the unified format."
arch=('any')
url="http://github.com/graysky2/ovpngen"
license=('MIT')
source=(https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('b0b8f3397d2d3207bc9e38781817b7b8328ecf7e7b1bf7818ce1ef8dc1ecdad2')

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
