# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=docker-backup-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A tool to create & restore complete, self-contained backups of Docker containers"
arch=('x86_64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('7b4b1f336834a8855cb676c7442b844cfc13582b9429168023cfe893154e7d00')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
