# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=deckmaster-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="An application to control your Elgato Stream Deck"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
depends=('ttf-roboto')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('57c95dff655cd03364d719c652208fd7f0b891e667c7b0dce8639621ced037a9')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
