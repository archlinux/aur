# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps5000
pkgver=2.1.54_3r2438
pkgrel=1
pkgdesc="library for picotech oscilloscope 5000 series (5203, 5204)"
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps5000/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('18c95a8bb1dec0753481974c84889b9b')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
