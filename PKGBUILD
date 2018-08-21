# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=jaxx
pkgver=1.3.18
pkgrel=1
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('unknown')
options=(!strip)
source=("https://github.com/Jaxx-io/Jaxx/releases/download/v${pkgver}/jaxx-${pkgver}-x86_64.AppImage")
sha256sums=('a42ccb92c5dcd0a1d7667998783e162d9c48e1bf62e2b43f9d25345fed50756d')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 jaxx-${pkgver}-x86_64.AppImage "$pkgdir/opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/jaxx-${pkgver}-x86_64.AppImage "$pkgdir/usr/bin/$pkgname"
}
