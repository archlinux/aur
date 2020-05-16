# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.6.2
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
optdepends=('openssl: https support' 'zlib: compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('cbf7fcec0b906a545ffe6c5057292ff8276b5fa25d3a7a5b7b24e7d3f4dcd319aeae5a6e75ef55e7dece86163cc9f16e4cee2f4bca511fd2be241a553b7f6e9f')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 'httplib.h' "$pkgdir/usr/include/httplib.h"
}
