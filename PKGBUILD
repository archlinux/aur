# Maintainer: graysky <graysky AT archlinux DOT org>

pkgname=ovpngen
pkgver=1.28
pkgrel=1
pkgdesc="Generate an OpenVPN client profile in the unified format."
arch=('any')
url="http://github.com/graysky2/ovpngen"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://github.com/graysky2/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('c81bff272e4187c943808711bc9cea716bf6de7bd4c0254ae6affb5ca7433db4')

package() {
	cd ${pkgname}-${pkgver}
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
