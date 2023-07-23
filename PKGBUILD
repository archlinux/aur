# Maintainer: Maciej Dziuban <dziuban.maciej@gmail.com>
pkgname=check_mate-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Utility program to monitor output of certain commands"
arch=('x86_64')
url="https://github.com/DziubanMaciej/CheckMate"
license=('MIT')
source=("https://github.com/DziubanMaciej/CheckMate/releases/download/v${pkgver}/check_mate_linux_${pkgver}.zip")
sha256sums=('43e6b9b2118f65ae563f3f1c0198365668f44e9b96da46b51fa82606f13e8431')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_client" "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_server" "$pkgdir/usr/bin"
}
