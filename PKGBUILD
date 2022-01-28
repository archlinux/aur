# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=obs-cli-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="OBS-cli is a command-line remote control for OBS"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('620f4caff331286906654dfee61735901d9d8a8699a5d39bf8f4ba12e7da5185')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
