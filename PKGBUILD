# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps2000
pkgver=3.0.54_3r2438
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
md5sums=('f9cb41175beddc84a958827859baa48e')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
