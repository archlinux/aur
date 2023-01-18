# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7b packages were based on
pkgname=ps7b_libps6000
pkgver=2.1.105_6r3345
pkgrel=1
pkgdesc="Library for PicoScope 6000 series in PicoScope 7 Beta"
arch=('x86_64')
url="https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps6000/"
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
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps6000/libps6000_${pkgver//_/-}_amd64.deb")
md5sums=('58168a3314f4550de1b9b71e79798b24')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
