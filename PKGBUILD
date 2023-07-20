# Maintainer: Maciej Dziuban <dziuban.maciej@gmail.com>
pkgname=check_mate-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Utility program to monitor output of certain commands"
arch=('x86_64')
url="https://github.com/DziubanMaciej/CheckMate"
license=('MIT')
source=("https://github.com/DziubanMaciej/CheckMate/releases/download/v${pkgver}/check_mate_linux_${pkgver}.zip")
sha256sums=('2e41307a5dd8bfe094b15ac11458f914e468ea823caf5b0a72d1c7956c7ac5d0')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_client" "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_server" "$pkgdir/usr/bin"
}
