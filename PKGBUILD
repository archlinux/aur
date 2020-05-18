# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.6.3
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
optdepends=('openssl: https support' 'zlib: compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('ae2bf37d72d26ba2f80c1d93592e40e931becc68ec3f257b6b811771f097f09ae5da2bf930c5067b06bd3e2886a33a8a004bfff7bf53240eca687bfcaa1d0c7f')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 'httplib.h' "$pkgdir/usr/include/httplib.h"
}
