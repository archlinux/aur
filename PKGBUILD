# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps5000
pkgver=2.1.34_3r2002
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
md5sums=('c627f70cc5d897159dc6df15dda67ff6')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
