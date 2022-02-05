# Maintainer: Schorsch <wsixcde+aur@gmail.com>
# Thanks to mti@tillenius.com whose packages the ps7b packages were based on
pkgname=ps7b_libps2000
pkgver=3.0.80_3r3041
pkgrel=1
pkgdesc="library for picotech oscilloscope 2000 series"
arch=('x86_64')
url="https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps2000/"
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
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps2000/libps2000_${pkgver//_/-}_amd64.deb")
md5sums=('30FDFAE030B2063A708009713088187C')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
