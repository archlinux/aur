# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=gitty-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Contextual information about your git projects, right on the command-line"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('215b253de55e5fec25bddc93456709345d6cd55cf37e9e77fe0bfe273d39a030')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
