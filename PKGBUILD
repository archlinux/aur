# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=gitty-bin
pkgver=0.7.0
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

sha256sums_x86_64=('93e1b53eda3181985119df04087584f40ed6f4deea9cec6fe79cd7aaad8dfa1e')
sha256sums_i686=('ce55cbfe1675a44572e1c8cff51e804397f5bd17af669a39ce8ccc611943541a')
sha256sums_aarch64=('10e8c0179e8ae2563877faa2ba299b4cec712b6bc3037450a8b8428a0ec5d527')
sha256sums_armv6h=('52168fa6b920110873265a54b4c644a4d961973023a77655a70e2edb4840a272')
sha256sums_armv7h=('406889b3e2dc57c3ae82d2bbea660e416607180ad9ec78c16802aa992a1de2ed')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
