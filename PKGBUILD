# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rich Lees <git0 at bitservices dot io>
# Contributor: theguy147 <yakamoz147 (at) protonmail (dot) com>
# Contributor: tee < teeaur at duck dot com >

pkgname=libobjectbox
pkgver=5.3.2
pkgrel=1
pkgdesc='C/C++ database for objects and structs'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/objectbox/objectbox-c"
license=('Apache-2.0 AND custom')
depends=('gcc-libs')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-aarch64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7hf.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-armv7hf.tar.gz")
sha256sums_x86_64=('6dbb5450c36dd11ee9074f16ecc61e79b45ff43c2082934601f3166b39c8a613')
sha256sums_aarch64=('bdfbfbf4971057e11018ca6645697d8a40ebc7df56ccde63397cbb0e0609c0e8')
sha256sums_armv7h=('9e7e4ed9df601cad54950a829f57dd77f297dffb0d0e3b9758bbe2fb01fd0064')

package() {
    install -Dm644 "$srcdir/lib/$pkgname.so" -t "$pkgdir/usr/lib/"
    install -Dm644 "$srcdir/include/objectbox.h" -t "$pkgdir/usr/include/"
    install -Dm644 "$srcdir/include/objectbox.hpp" -t "$pkgdir/usr/include/"
    install -Dm644 "$srcdir/include/objectbox-sync.h" -t "$pkgdir/usr/include/"
    install -Dm644 "$srcdir/include/objectbox-sync.hpp" -t "$pkgdir/usr/include/"
}
