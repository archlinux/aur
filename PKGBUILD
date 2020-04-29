# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps6000
pkgver=2.1.34_6r2002
pkgrel=1
pkgdesc="library for picotech oscilloscope 6000 series"
arch=('x86_64')
url="http://www.picotech.com/linux.html"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://labs.picotech.com/debian/pool/main/libp/${pkgname}/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('45230d0b9bea775a6e3241202a7ac2cb')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
