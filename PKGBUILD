# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=ovpngen
pkgver=1.22
pkgrel=1
pkgdesc="Generate an OpenVPN client rofile in the unified format."
arch=('any')
url="http://github.com/graysky2/ovpngen"
license=('MIT')
source=(https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('fc542f4cb2f6bd735e0f116858ac0a00bd92df20b278874fd0c9fc6ba2b21b10')

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
