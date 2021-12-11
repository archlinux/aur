# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=obs-cli-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="OBS-cli is a command-line remote control for OBS"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('9b354cbfc1ebd4af8beb8649c99a81cecdb8f8c9c2bf7d2735a40a19c77aef40')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
