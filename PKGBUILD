# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.6.0
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
optdepends=('openssl: https support' 'zlib: compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('f9bf615c08a20773d4ce5431a42ef19a3276821909f293f5b211b95f92c2220aab39c08af8ac7a2e0dc7a656519565cc4b54024c8d0791a5971921f010362cc8')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 'httplib.h' "$pkgdir/usr/include/httplib.h"
}
