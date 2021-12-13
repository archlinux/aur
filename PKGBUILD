# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=obs-cli-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="OBS-cli is a command-line remote control for OBS"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('33ff773a75a0ab9c992ea5aca797e15636eb2805f15466c5dff0c9a3e909305e')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
