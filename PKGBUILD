# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.5.13
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
optdepends=('openssl: https support' 'zlib: compression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('beab4c3af01c6ad7ab01e330ffbb3c119dfee9e4a23315ced19637b0105e92503bfd3cbeb5d62b2688660f0321b9d6024b97632441cd4e948dc38a5d499de5bd')
package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'httplib.h' "$pkgdir/usr/include/httplib.h"
}
