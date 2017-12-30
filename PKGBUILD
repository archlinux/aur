# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=ovpngen
pkgver=1.27
pkgrel=1
pkgdesc="Generate an OpenVPN client profile in the unified format."
arch=('any')
url="http://github.com/graysky2/ovpngen"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('d24ce6960e31fe67f1db1a1c3af004e0b734a256d3477341ecccd3395ace9f02')

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
