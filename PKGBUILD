# Maintainer: Axel Navarro <navarroaxel at gmail dot com>

_pkgname=vysor
pkgname=${_pkgname}-bin
pkgver=4.1.34
pkgrel=1
pkgdesc="Mirror and control your Android device"
arch=('x86_64')
url="https://vysor.io"
license=('custom')
provides=('vysor')
conflicts=('vysor')
source=("https://github.com/koush/vysor.io/releases/download/v$pkgver/Vysor-linux-$pkgver.deb")
sha256sums=('b2e8c9d8abc83986611a2ae77ab92aa431976c48db1e5c522695b6297ff3aa20')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
