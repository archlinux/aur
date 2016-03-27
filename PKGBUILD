# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps6000
pkgver=1.4.5_6r37
pkgrel=1
pkgdesc="library for picotech oscilloscope 6000 series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='e352392388108223f38b69eb50fd8f04t'
else
  _arch="amd64"
  _md5sum='9ebd702b70815b0a4e2ddc2ab2168197'
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
source=("http://labs.picotech.com/debian/pool/main/libp/${pkgname}/${pkgname}_${pkgver//_/-}_${_arch}.deb")
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

