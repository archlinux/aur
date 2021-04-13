# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps5000a
pkgver=2.1.54_5r2438
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
md5sums=('acfac013f6d41150aa72d91aa4d83fe2')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
