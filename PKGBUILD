# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=duf-bin
pkgver=0.6.2
pkgrel=2
pkgdesc="Disk Usage/Free Utility"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/muesli/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")

sha256sums_x86_64=('3f2a4d4daed58d8e7dbc281b24187f606479d8f0bb851bedd2c2d910f959b661')
sha256sums_i686=('f1824a582228b659f757bedc23ce81ee4efa2a2041e6a7e762caa5ea88b7d7f9')
sha256sums_armv6h=('074f5dc4ece834f01f95b4ba80369a6c32178bf56a8b37ba48bea598244c3967')
sha256sums_armv7h=('79c0ae96b35d4a5456a89f516924edb69d56339241f7e624631f6bd2b1ecccc4')
sha256sums_aarch64=('34842c3d94926acd8651cb9b1e85fa7ae76942947506d341bb9860f3461f11e5')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
