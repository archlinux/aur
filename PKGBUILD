# Maintainer: Axel Navarro <navarroaxel at gmail dot com>

_pkgname=vysor
pkgname=${_pkgname}-bin
pkgver=4.1.14
pkgrel=1
pkgdesc="Mirror and control your Android device"
arch=('x86_64')
url="https://vysor.io"
license=('custom')
provides=('vysor')
conflicts=('vysor')
source=("https://github.com/koush/vysor.io/releases/download/v$pkgver/Vysor-linux-$pkgver.deb")
sha256sums=('221d505c7ecf01a31c9e7f317ea32f0b0624f9feba6ff2c5486b9975c94800e7')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
