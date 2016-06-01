# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps5000
pkgver=1.5.6_3r09
pkgrel=1
pkgdesc="library for picotech oscilloscope 5000 series (5203, 5204)"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='097f8ccfb3ea603aab7378486fa51d35'
else
  _arch="amd64"
  _md5sum='6b0a610125996c51b321a00b8781ee42'
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps5000/${pkgname}_${pkgver//_/-}_${_arch}.deb")
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
