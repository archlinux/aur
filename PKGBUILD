# Maintainer: Schorsch <wsixcde+aur@gmail.com>
# Thanks to mti@tillenius.com whose packages the ps7b packages were based on
pkgname=ps7b_libps5000a
pkgver=2.1.80_5r3041
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
md5sums=('DC04B5CE2539F0B2CD24083362FD4CCC')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
