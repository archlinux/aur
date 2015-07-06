# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps2000
pkgver=2.1.4_3r26
pkgrel=1
pkgdesc="library for picotech oscilloscope 2000 series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='4c5bc4091b2c73cd9cada069ee3fe6c5'
else
  _arch="amd64"
  _md5sum='e09eee95639eb802cbad7eb371b01b77'
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
  dpkg --extract ${pkgname}_${pkgver//_/-}_${_arch}.deb $startdir/pkg/$pkgname
  chmod -R go-w $startdir/pkg/$pkgname
  chown -R root:root $startdir/pkg/$pkgname
}
