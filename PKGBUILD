# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps3000a
pkgver=2.1.54_6r2438
pkgrel=1
pkgdesc="library for picotech oscilloscope 3000a series"
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
md5sums=('16abf553eba9ecb014357c27160448a7')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}

