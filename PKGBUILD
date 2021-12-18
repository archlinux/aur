# Maintainer: Christian Muehlhaeuser <muesli at gmail dot com>

pkgname=gitty-bin
pkgver=0.4.1
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

sha256sums_x86_64=('e513aeff38b6090a888b6717afb48355f13d83b2073ab0676adb122a4ca6b370')
sha256sums_i686=('2943a1a1e3e4d8c43d006ba7dc102db1344cdeb4db232408e674e06cb0e88e53')
sha256sums_aarch64=('909b39623fce26139934c8379fe8328675e7e447e0f5ffff9c44cfe5821d1741')
sha256sums_armv6h=('912815a37012c8d2058f128d9d198746efe3ce5cade79a4fae60d768014f1568')
sha256sums_armv7h=('6c2150dfe560f71a0676abc7400dd6d7c3237e0849c16cbde4e22d52a6938f90')

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}

# vim:set ts=4 sw=4 et:
