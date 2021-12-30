# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=gitty-bin
pkgver=0.6.0
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

sha256sums_x86_64=('a970dedb1398f44e7d358f30e631a15670079c1b0c696137f77a0dfb3c99f8a4')
sha256sums_i686=('ae4ecab4f5a20438d84b69023f3dc712bef77bea3883cf7743999c9b5b63911e')
sha256sums_aarch64=('96dd1917f694078dfa957f04d9826e6858fa018110c866c50143569da7a00226')
sha256sums_armv6h=('787c0f6e6ccf85cf555d5f9671846423bffae5c8f5da4243e9a40a313d1949d1')
sha256sums_armv7h=('3830ba76406a9c4d7468f3733a66c134cae70b7371f8d96361b36692a13bc896')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
