# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7b packages were based on
pkgname=ps7b_libps3000a
pkgver=2.1.98_6r3284
pkgrel=1
pkgdesc="Library for PicoScope 3000a series in PicoScope 7 Beta"
arch=('x86_64')
url="https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps3000a/"
license=('custom')
groups=()
depends=('libusb')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps3000a/libps3000a_${pkgver//_/-}_amd64.deb")
md5sums=('a60ead4289255e9419d6f46d9b09987c')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}

