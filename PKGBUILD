# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps2000a
pkgver=1.1.5_5r24
pkgrel=1
pkgdesc="library for picotech oscilloscope 2000 series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='65121707586cdd28b39e070fb3b41294'
else
  _arch="amd64"
  _md5sum='db38234a36b775761ee6f57182db7d19'
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
  dpkg --extract ${pkgname}_${pkgver//_/-}_${_arch}.deb $pkgdir
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
