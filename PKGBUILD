# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=prism-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="An RTMP stream recaster / splitter"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('e0b25dd65bf1bbc80a18e9be3f95fe4ad633d373f75321ba86731d7c15d4018b')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
