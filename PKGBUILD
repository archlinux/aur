# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps4000a
pkgver=2.1.0_2r570
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
md5sums=('ee80cdb2ed7301cb465a91967b1bc662')

package() {
  tar -xf data.tar.gz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
