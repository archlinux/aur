# Maintainer: Maciej Dziuban <dziuban.maciej@gmail.com>
pkgname=check_mate-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Utility program to monitor output of certain commands"
arch=('x86_64')
url="https://github.com/DziubanMaciej/CheckMate"
license=('MIT')
source=("https://github.com/DziubanMaciej/CheckMate/releases/download/v${pkgver}/check_mate_linux_${pkgver}.zip")
sha256sums=('cb5d095afbd75023fac51c2a3a98866b0f18948d041cd8ab639c126cc65e9d45')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_client" "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_server" "$pkgdir/usr/bin"
}
