# Maintainer: tequa
pkgname=libps3000a
pkgver=1.4.5_6r40
pkgrel=1
pkgdesc="library for picotech oscilloscope 3000a series"
arch=('i686' 'x86_64')
if [ "$CARCH" == "i686" ]; then
  _arch="i386"
  _md5sum='00798cf733d4fe368ed7f7b0122918dc'
else
  _arch="amd64"
  _md5sum='02f1dabb99b2c745de6a3b4afb90be4d'
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

