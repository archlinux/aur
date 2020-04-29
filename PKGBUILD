# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps2000
pkgver=3.0.34_3r2002
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps2000/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('88c61f633e30b979bc8a175e0bdc978b')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
