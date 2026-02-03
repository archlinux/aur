# Contributor: Rich Lees <git0 at bitservices dot io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: theguy147 <yakamoz147 (at) protonmail (dot) com>
# Contributor: tee < teeaur at duck dot com >

pkgname=libobjectbox
pkgver=5.1.0
pkgrel=1
pkgdesc='C/C++ database for objects and structs'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/objectbox/objectbox-c"
license=('Apache-2.0 AND custom')
depends=('gcc-libs')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-aarch64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7hf.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-armv7hf.tar.gz")
sha256sums_x86_64=('961937f1672b5c3859115820c483af9bf41882fa6f9057b0e81b3db45e027921')
sha256sums_aarch64=('d34317ea8bf90f51cece1543607d902ebd17037847c0db72d4b7135fc14530ec')
sha256sums_armv7h=('c8b39f4939f2e3a1ee70685d41b0ce5f8341f65bc4ebc8376026ad9776254371')

package() {
    install -Dm644 "$srcdir/lib/$pkgname.so" -t "$pkgdir/usr/lib/"
    install -Dm644 "$srcdir/include/objectbox.h" -t "$pkgdir/usr/include/"
    install -Dm644 "$srcdir/include/objectbox.hpp" -t "$pkgdir/usr/include/"
    install -Dm644 "$srcdir/include/objectbox-sync.h" -t "$pkgdir/usr/include/"
    install -Dm644 "$srcdir/include/objectbox-sync.hpp" -t "$pkgdir/usr/include/"
}
