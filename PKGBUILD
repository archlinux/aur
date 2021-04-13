# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps3000
pkgver=4.0.54_3r2438
pkgrel=1
pkgdesc="library for picotech oscilloscope 3000 series"
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps3000/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('1799d33209f33223df27374e3a1342ee')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
