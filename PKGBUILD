# Maintainer: Axel Navarro <navarroaxel at gmail dot com>

_pkgname=vysor
pkgname=${_pkgname}-bin
pkgver=4.1.62
pkgrel=1
pkgdesc="Mirror and control your Android device"
arch=('x86_64')
url="https://vysor.io"
license=('custom')
provides=('vysor')
conflicts=('vysor')
source=("https://github.com/koush/vysor.io/releases/download/v$pkgver/Vysor-linux-$pkgver.deb")
sha256sums=('88564a3a0ebff4dea9f40ee7ab24a0aabbff5ac7a291c343d7908fe6d9fcb754')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
