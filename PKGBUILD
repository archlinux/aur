# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps2000
pkgver=3.0.0_3r570
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
md5sums=('b1a44e81f0edcb5f53311b8ce7bed976')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
