# Maintainer: aAXEe <axel at brasshack dot de>
# Submitter: Alexandre Bique (abique) <>
pkgname=libps3000
pkgver=3.7.5_3r22
pkgrel=1
pkgdesc="library for picotech oscilloscope 3000 series"
arch=('x86_64')
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
source=(
  "http://labs.picotech.com/debian/pool/main/libp/libps3000/${pkgname}_${pkgver//_/-}_amd64.deb"
  )
md5sums=('d669249eecd476bf478e4e3a5b06e308')
noextract=()

build() {
  echo
}

package() {
  dpkg --extract ${pkgname}_${pkgver//_/-}_amd64.deb $pkgdir
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}

