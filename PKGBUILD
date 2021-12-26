# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=gitty-bin
pkgver=0.5.0
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

sha256sums_x86_64=('315d1b41015d9568ee029d1761c6ae23a851dd75abde749942639d54818e071e')
sha256sums_i686=('4292b28020b857182f162d8cad0ff9255ab6271d0cc24e172ac653a8a3c324dd')
sha256sums_aarch64=('9bc0b08f291766ea5bb25daff5b1849eb6b8fc40c87e0ed68cd97e1b36caf8bd')
sha256sums_armv6h=('356f63f10007e05f02d19734899ce01693b720af56424866337305b9f2b96b04')
sha256sums_armv7h=('493fe86ea63d7da540264f0e0151f105e5f44585ed2113330616b0a37a207b73')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
