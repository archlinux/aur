# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=gitty-bin
pkgver=0.3.0
pkgrel=2
pkgdesc="Contextual information about your git projects, right on the command-line"
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")

sha256sums_x86_64=('215b253de55e5fec25bddc93456709345d6cd55cf37e9e77fe0bfe273d39a030')
sha256sums_i686=('e2d041ade1cd596a08ec4dff56ad5a8a3f575fbebfe0f2698525e8b5657c50ba')
sha256sums_aarch64=('30e08154da48f2b2cefc9c09e056dc7f17bf53e893a985bb0e922a606b005c56')
sha256sums_armv6h=('291fae27b043b1492f94c6f57069a1c6f4151576b4f0fc0a770283923fd8fae1')
sha256sums_armv7h=('7f845597544a4eb802ebd9f3fab069db1f95ecce4313d2c4f2545f3db75797de')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
