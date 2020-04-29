# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps2000a
pkgver=2.1.34_5r2002
pkgrel=1
pkgdesc="library for picotech oscilloscope 2000 series"
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps2000a/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('13008c5e040b324fcc952fcceb095e10')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
