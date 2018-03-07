# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=jaxx
pkgver=1.3.12
pkgrel=1
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('unknown')
options=(!strip)
source=("https://github.com/Jaxx-io/Jaxx/releases/download/v${pkgver}/jaxx-${pkgver}-x86_64.AppImage")
sha256sums=('d689ebb68c95b2374958ce899f9a119b02da0bba15eefd967841968f1cad18ad')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 jaxx-${pkgver}-x86_64.AppImage "$pkgdir/opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage "$pkgdir/usr/bin/$pkgname"
}
