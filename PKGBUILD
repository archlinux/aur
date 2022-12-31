# Maintainer: Giorgi Kobakhidze <gk@koba.pvt.ge>

pkgname=libsignal-protocol-javascript
pkgver=1.2.0
pkgrel=2
license=(GPL3)
arch=(any)
url="https://github.com/signalapp/${pkgname}"
makedepends=(emscripten npm grunt-cli)
source=("$pkgname-$pkgver-$pkgrel.tar.gz"::'https://github.com/signalapp/libsignal-protocol-javascript/archive/refs/tags/v1.2.0.tar.gz')
sha256sums=(3e819e5c9c4438089b58c63dabef2f1998e49ff05de40eb53bf5f274c929bc46)

package() {
	tar xf "$pkgname-$pkgver-$pkgrel.tar.gz" "$pkgname-$pkgver"/dist
	install -dm755 "$pkgdir"/usr/share/webapps/"$pkgname"
	cp -R "$pkgname-$pkgver"/dist "$pkgdir"/usr/share/webapps/"$pkgname"/
}
