# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=duf-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Disk Usage/Free Utility"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('3f2a4d4daed58d8e7dbc281b24187f606479d8f0bb851bedd2c2d910f959b661')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
