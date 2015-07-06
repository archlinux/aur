# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps2000a
pkgver=1.1.4_5r35
pkgrel=1
pkgdesc="library for picotech oscilloscope 2000 series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='7b394ecc9d700bafa9d764c846850598'
else
  _arch="amd64"
  _md5sum='53d8c4b45b16330a7cc9ee0b5a699a14'
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps2000a/${pkgname}_${pkgver//_/-}_${_arch}.deb")
md5sums=($_md5sum)
noextract=()

build() {
  echo
}

package() {
  dpkg --extract ${pkgname}_${pkgver//_/-}_${_arch}.deb $startdir/pkg/$pkgname
  chmod -R go-w $startdir/pkg/$pkgname
  chown -R root:root $startdir/pkg/$pkgname
}
