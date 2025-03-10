# Maintainer: Maciej Dziuban <dziuban.maciej@gmail.com>
pkgname=check_mate-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Utility program to monitor output of certain commands"
arch=('x86_64')
url="https://github.com/DziubanMaciej/CheckMate"
license=('MIT')
source=("https://github.com/DziubanMaciej/CheckMate/releases/download/v${pkgver}/check_mate_linux_${pkgver}.zip")
sha256sums=('0bc5cc6862b476135248888e6b838dd80168b38e898c1fcac48cab0aba89849b')

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_client" "$pkgdir/usr/bin"
    cp "$srcdir/check_mate_linux_$pkgver/check_mate_server" "$pkgdir/usr/bin"
}
