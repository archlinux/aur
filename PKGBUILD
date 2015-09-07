# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps2000
pkgver=2.1.5_3r06
pkgrel=1
pkgdesc="library for picotech oscilloscope 2000 series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='26a56f79063b646b961dc5d6bcfb6883'
else
  _arch="amd64"
  _md5sum='02cdd8ac1dfc709705226493ea5634df'
fi
url="http://www.picotech.com/linux.html"
license=('custom')
groups=()
depends=(libusb)
makedepends=(dpkg)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://labs.picotech.com/debian/pool/main/libp/libps2000/${pkgname}_${pkgver//_/-}_${_arch}.deb")
md5sums=($_md5sum)
noextract=()

build() {
  echo
}

package() {
  dpkg --extract ${pkgname}_${pkgver//_/-}_${_arch}.deb $pkgdir
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
