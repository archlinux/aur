# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.5.12
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
optdepends=('openssl: https support' 'zlib: compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('62dc378e87981dd8ed8aef6cde12da190d714d1234379b073a4df189ff589604800c9add619f6adc98a3bc7856c01b390cd336723007a78e29d2df681680fceb')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'httplib.h' "$pkgdir/usr/include/httplib.h"
}
