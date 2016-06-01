# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps4000
pkgver=1.2.6_2r07
pkgrel=1
pkgdesc="library for picotech oscilloscope 4000 series (4223, 4224, 4226, 4227, 4262, 4423, 4424)"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='460bc9d64bcd40ed87c52e335de9cd9d'
else
  _arch="amd64"
  _md5sum='8e09ddc75a14c03f89223e54d98ab2af'
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps4000/${pkgname}_${pkgver//_/-}_${_arch}.deb")
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
