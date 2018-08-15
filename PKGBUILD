# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps3000
pkgver=4.0.0_3r570
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
md5sums=('e138dcd24ea96ff32ca2daa4eb7621aa')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
