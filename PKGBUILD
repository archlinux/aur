# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps6000
pkgver=2.1.0_6r580
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
md5sums=('1d3228a5e28ce392d578e6a725a0735a')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
