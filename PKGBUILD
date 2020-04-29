# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps5000a
pkgver=2.1.34_5r2002
pkgrel=1
pkgdesc="library for picotech oscilloscope 5000a series (5242A/B, 5243A/B, 5244A/B, 5442A/B, 5443A/B, 5444A/B)"
arch=('x86_64')
url="http://www.picotech.com/linux.html"
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
source=("http://labs.picotech.com/debian/pool/main/libp/libps5000a/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('947e300ca1e2468b7c074e5b0eaad268')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
