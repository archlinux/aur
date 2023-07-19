# Maintainer: Maciej Dziuban <dziuban.maciej@gmail.com>
pkgname=check_mate-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility program to monitor output of certain commands"
arch=('x86_64')
url="https://github.com/DziubanMaciej/CheckMate"
license=('MIT')
source=("https://github.com/DziubanMaciej/CheckMate/releases/download/v${pkgver}/check_mate_linux_${pkgver}.zip")
sha256sums=('76c3425de7df7d716f28e359c6a8449b7a347bc4be8bb0735c7f5d57344bb67c')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_client" "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_server" "$pkgdir/usr/bin"
}
