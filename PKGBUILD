# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=gitty-bin
pkgver=0.4.0
pkgrel=1
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

sha256sums_x86_64=('ea2ddbd54246e01fa75b43fe15fe24ddea51493aa324028bdf12b0cf28f55e1a')
sha256sums_i686=('617664d07018b2e4c2bf16044403f4dc6541965c1720f2a22aa1ce644b554d79')
sha256sums_aarch64=('8e8e82125aa954ada043eacfde6d9c1bfadc496212eb9ede958a6a9b8b217989')
sha256sums_armv6h=('fd39e05bd6e411c5ffd6a08053da240143fe996fac91d1ba22c028dcfd15e4e1')
sha256sums_armv7h=('1f1aeb04da91219a2c8bf347d3616608d92d0aa0609c4cbc06dea57d4ca30973')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
