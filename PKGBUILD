# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7b packages were based on
pkgname=ps7b_libps2000a
pkgver=2.1.119_5r3573
pkgrel=2
pkgdesc="Library for PicoScope 2000a series in PicoScope 7 Beta"
arch=('x86_64')
url="https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps2000a/"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=$pkgname.install
changelog=
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libps2000a/libps2000a_${pkgver//_/-}_amd64.deb")
md5sums=('98ce1666e624e1bf8ea67b0b573b0626')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir

  mkdir "${pkgdir}/control"
  tar -xf control.tar.xz -C "${pkgdir}/control"
}
