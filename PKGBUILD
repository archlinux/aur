# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=duf-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Disk Usage/Free Utility"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('d2c48e5dc5c77c530677a3e43376539c7bc525c4dbbdf8db7a9adeba9c45137d')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
