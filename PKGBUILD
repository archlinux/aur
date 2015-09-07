# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps3000
pkgver=3.7.6_3r05
pkgrel=1
pkgdesc="library for picotech oscilloscope 3000 series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='d4a435d265ff7e1748de967be823fa4e'
else
  _arch="amd64"
  _md5sum='3c1de8ff334015f48d7772fe66f89406'
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps3000/${pkgname}_${pkgver//_/-}_${_arch}.deb")
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

