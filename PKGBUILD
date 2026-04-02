# Contributor: Rich Lees <git0 at bitservices dot io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: theguy147 <yakamoz147 (at) protonmail (dot) com>
# Contributor: tee < teeaur at duck dot com >

pkgname=libobjectbox
pkgver=5.3.1
pkgrel=1
pkgdesc='C/C++ database for objects and structs'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/objectbox/objectbox-c"
license=('Apache-2.0 AND custom')
depends=('gcc-libs')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-aarch64.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7hf.tar.gz::${url}/releases/download/v${pkgver}/objectbox-linux-armv7hf.tar.gz")
sha256sums_x86_64=('d1a22f5a43e8aa438c987524c2ef97f5d179acb991b0f63ab03a30c33b882368')
sha256sums_aarch64=('948fe456904b8b0ae6b22a26a9f460734dc3c2ec58750df3a329ccae1ebe035d')
sha256sums_armv7h=('13eb38c3f25f907ade0381baf439b70ddeae30ffe4864b7f2e6077bdee597e83')

package() {
    install -Dm644 "$srcdir/lib/$pkgname.so" -t "$pkgdir/usr/lib/"
    install -Dm644 "$srcdir/include/objectbox.h" -t "$pkgdir/usr/include/"
    install -Dm644 "$srcdir/include/objectbox.hpp" -t "$pkgdir/usr/include/"
    install -Dm644 "$srcdir/include/objectbox-sync.h" -t "$pkgdir/usr/include/"
    install -Dm644 "$srcdir/include/objectbox-sync.hpp" -t "$pkgdir/usr/include/"
}
