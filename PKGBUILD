# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7b packages were based on
pkgname=ps7b_libps5000a
pkgver=2.1.90_5r3176
pkgrel=1
pkgdesc="Library for PicoScope 5000a series in PicoScope 7 Beta"
arch=('x86_64')
url="https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps5000a/"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps5000a/libps5000a_${pkgver//_/-}_amd64.deb")
md5sums=('9e0d3805fb12e1c9a11e72791c794c7e')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
