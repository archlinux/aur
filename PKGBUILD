# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps4000
pkgver=2.1.0_2r570
pkgrel=1
pkgdesc="library for picotech oscilloscope 4000 series (4223, 4224, 4226, 4227, 4262, 4423, 4424)"
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps4000/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('1f8b4930f9fdbebe844b7ad9405efe73')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
