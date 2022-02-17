# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=deckmaster-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="An application to control your Elgato Stream Deck"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
depends=('ttf-roboto')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('3ab354768be303dee5f86d36ab0e649c6596a5cce0203c21352361597ac53ee4')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
