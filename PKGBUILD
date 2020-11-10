# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=deckmaster-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="An application to control your Elgato Stream Deck"
arch=('x86_64')
url="https://github.com/muesli/deckmaster"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/deckmaster_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('b8f39f90f3342fd55d92603eb397d1f13c776ae6e74ba38e156ec1b2aece6862')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
