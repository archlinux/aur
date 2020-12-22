# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=prism-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="An RTMP stream recaster / splitter"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('58f846473ddeef0f0c0c8ecc31ca5a8b3c2d45a417bd93ef6356f7bc1b7e94d8')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
