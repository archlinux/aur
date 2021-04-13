# Maintainer: Mikael Tillenius <mti at tillenius dot com>
# Thanks to aAXEe <axel at brasshack dot de> for earlier work.
pkgname=libpicoipp
pkgver=1.3.0_4r78
pkgrel=2
pkgdesc="library for picotech oscilloscope software"
arch=('x86_64')
url="http://www.picotech.com/linux.html"
license=('custom')
groups=()
depends=(gcc-libs)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://labs.picotech.com/debian/pool/main/libp/libpicoipp/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('c0416c147651f269ca340791241a1a61')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
