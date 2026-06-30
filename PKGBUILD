# Maintainer: Alula <silasfunnis@gmail.com>

pkgname=usbw8
pkgver=1.0.0
pkgrel=1
pkgdesc="USB image writer with interactive disk selection"
arch=('x86_64')
url="https://codeberg.org/kelseythedreamer/headspace-repo"
license=('GPL2')
depends=('bash' 'coreutils' 'util-linux' 'opendoas')
source=("usbw8::https://codeberg.org/kelseythedreamer/headspace-repo/raw/branch/main/app-misc/usbw8/files/usbw8")
sha256sums=('1d4afb550ecf2d5b62ace7274cb430df13a02a745ef93f1503ebc88e254a7511')

package() {
  install -Dm755 usbw8 "${pkgdir}/usr/bin/usbw8"
}
