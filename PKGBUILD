# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=duf-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Disk Usage/Free Utility"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/duf_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('2cf2e6263dcdd4809c1a9ca2ee50ce0c228c5720a1d3ddd1cae084f8fbfe1ae1')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
