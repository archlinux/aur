# Maintainer: Axel Navarro <navarroaxel at gmail dot com>

_pkgname=vysor
pkgname=${_pkgname}-bin
pkgver=4.1.25
pkgrel=1
pkgdesc="Mirror and control your Android device"
arch=('x86_64')
url="https://vysor.io"
license=('custom')
provides=('vysor')
conflicts=('vysor')
source=("https://github.com/koush/vysor.io/releases/download/v$pkgver/Vysor-linux-$pkgver.deb")
sha256sums=('61a1bdf4fee4708a44797cff7f3416a2df576ef2256970167f5703a5e7383a2d')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
