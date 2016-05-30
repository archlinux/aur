# Maintainer: Mikael Tillenius <mti at tillenius dot com>
# Thanks to aAXEe <axel at brasshack dot de> for earlier work.
pkgname=libpicoipp
pkgver=1.1.2_4r56
pkgrel=1
pkgdesc="library for picotech oscilloscope software"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='f5085f03d138b489517c09ec20191c35'
else
  _arch="amd64"
  _md5sum='1819c165c82e626628b60c07d335bfe7'
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
