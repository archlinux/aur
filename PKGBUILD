# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=jaxx
pkgver=2.1.2
pkgrel=1
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('unknown')
options=(!strip)
source=("https://download-liberty.jaxx.io/com.liberty.jaxx-${pkgver}-x86_64.AppImage")
sha256sums=('f4c5cad72ccbc7c2b9b541f0156a35348f143f121680b1b4c38fc4b961d901d1')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 com.liberty.jaxx-${pkgver}-x86_64.AppImage "$pkgdir/opt/$pkgname/com.liberty.jaxx-${pkgver}-x86_64.AppImage"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/com.liberty.jaxx-${pkgver}-x86_64.AppImage "$pkgdir/usr/bin/$pkgname"
}
