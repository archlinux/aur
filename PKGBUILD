# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=jaxx
pkgver=2.2.2
pkgrel=1
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('proprietary')
options=(!strip)
source=("https://download-liberty.jaxx.io/com.liberty.jaxx-${pkgver}-x86_64.AppImage")
sha256sums=('2f567df3c89d796d75d3c10712d765bf9002ee3931f1a48e58aa40f700f55245')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 com.liberty.jaxx-${pkgver}-x86_64.AppImage "$pkgdir/opt/$pkgname/com.liberty.jaxx-${pkgver}-x86_64.AppImage"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/com.liberty.jaxx-${pkgver}-x86_64.AppImage "$pkgdir/usr/bin/$pkgname"
}
