# Maintainer: Mikael Tillenius <mti at tillenius dot com>
# Thanks to aAXEe <axel at brasshack dot de> for earlier work.
pkgname=libpicoipp
pkgver=1.1.2_4r52
pkgrel=1
pkgdesc="library for picotech oscilloscope software"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='c27b545b7565eee56b9fc293b60f6459'
else
  _arch="amd64"
  _md5sum='50dd5e2438e139ed3fd63554b663e281'
fi
url="http://www.picotech.com/linux.html"
license=('custom')
groups=()
depends=(gcc-libs)
makedepends=(dpkg)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://labs.picotech.com/debian/pool/main/libp/libpicoipp/${pkgname}_${pkgver//_/-}_${_arch}.deb")
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
