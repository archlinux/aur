# Maintainer: Schorsch <wsixcde+aur@gmail.com>
# Thanks to mti@tillenius.com whose packages the ps7b packages were based on
pkgname=ps7b_libpicoipp
pkgver=1.3.0_4r130
pkgrel=1
pkgdesc="library for picotech oscilloscope software"
arch=('x86_64')
url="https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libpicoipp/"
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
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libpicoipp/libpicoipp_${pkgver//_/-}_amd64.deb")
md5sums=('4EF93E7675DED6C4A7D031D6296C685E')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
