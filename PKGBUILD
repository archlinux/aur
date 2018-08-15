# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps2000a
pkgver=2.1.0_5r570
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
md5sums=('a074d1e3e1b7fd0b087cfb5d9c05e5fb')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
