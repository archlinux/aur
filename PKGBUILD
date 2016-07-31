# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=ovpngen
pkgver=1.21
pkgrel=1
pkgdesc="Generate an OpenVPN Connect private tunnel profile in the unified format."
arch=('any')
url="http://github.com/graysky2/ovpngen"
license=('MIT')
source=(https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('e936f333ec86dbd474daf917b044f6447ccb252824e13424d965050d70ee0224')

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
