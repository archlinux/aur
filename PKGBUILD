# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.6.1
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
optdepends=('openssl: https support' 'zlib: compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('1eb1e2d0431d93747c0af36bce379b4885a9d996c99b1ecc8da7e42adf1d9ac022cf4be3b42d6ed26c1788edae4c4c537827bbc1f63b43d43b3129ad28d56b2d')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 'httplib.h' "$pkgdir/usr/include/httplib.h"
}
