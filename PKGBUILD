# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps3000
pkgver=3.7.7_3r03
pkgrel=1
pkgdesc="library for picotech oscilloscope 3000 series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='9e1ac3d30b7cc75fe9343e5ef9f2b865'
else
  _arch="amd64"
  _md5sum='3990d65c55097ac4059df412d11e14f8'
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
