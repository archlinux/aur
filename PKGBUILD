# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps4000a
pkgver=1.0.6_2r16
pkgrel=1
pkgdesc="library for picotech oscilloscope 4000a series (4824)"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='1c5c22bf920eb85666522343a83de863'
else
  _arch="amd64"
  _md5sum='973eef601711774e1cc67b261032bf2c'
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps4000a/${pkgname}_${pkgver//_/-}_${_arch}.deb")
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
