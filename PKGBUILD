# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps4000a
pkgver=2.1.34_2r2014
pkgrel=1
pkgdesc="library for picotech oscilloscope 4000a series (4824)"
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps4000a/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('faf0a722a0ab3bb4f8cf40cb090152fc')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
