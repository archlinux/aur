# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=jaxx
pkgver=1.3.15
pkgrel=1
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('unknown')
options=(!strip)
source=("https://github.com/Jaxx-io/Jaxx/releases/download/v${pkgver}/jaxx-${pkgver}-x86_64.AppImage")
sha256sums=('04030ebf80049c20fe4dea58597e89ccb92da0c0b33d9c3958f1758efe8e2e8e')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 jaxx-${pkgver}-x86_64.AppImage "$pkgdir/opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage "$pkgdir/usr/bin/$pkgname"
}
