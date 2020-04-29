# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps3000a
pkgver=2.1.34_6r2002
pkgrel=1
pkgdesc="library for picotech oscilloscope 3000a series"
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
md5sums=('94912035bb0d758b6bcb8121d8c34ea6')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}

