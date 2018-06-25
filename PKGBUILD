# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=jaxx
pkgver=1.3.17
pkgrel=1
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('unknown')
options=(!strip)
source=("https://github.com/Jaxx-io/Jaxx/releases/download/v${pkgver}/jaxx-${pkgver}-x86_64.AppImage")
sha256sums=('5b7c4ca531d1d5e74e66d08b1efdbd80fc62fa30efa702efbd91aba83c279e09')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 jaxx-${pkgver}-x86_64.AppImage "$pkgdir/opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage "$pkgdir/usr/bin/$pkgname"
}
