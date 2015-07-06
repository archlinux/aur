# Maintainer: aAXEe <axel at brasshack dot de>
# thanks for update: Mikael Tillenius <mti at tillenius dot com>
pkgname=libpicoipp
pkgver=1.1.2_4r21
pkgrel=1
pkgdesc="library for picotech oscilloscope software"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='db093a3f7ac59ab3b97f6216fff6c5b2'
else
  _arch="amd64"
  _md5sum='dbe145d37d45c8221b650b2dc52162eb'
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
