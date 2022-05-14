# Maintainer: Schorsch <wsixcde+aur at gmail dot com>
# Thanks to <mti at tillenius dot com> whose packages the ps7b packages were based on
pkgname=ps7b_libpicocv
pkgver=1.1.33_beta2r167
pkgrel=1
pkgdesc="Library for Pico Technology PicoScope 7 Beta Oscilloscope Software"
arch=('x86_64')
url="https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libpicocv/"
license=('custom')
groups=()
depends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("https://labs.picotech.com/rc/picoscope7/debian/pool/main/libp/libpicocv/libpicocv_${pkgver//_/-}_amd64.deb")
md5sums=('d536da0ffee20d35b05e14f5ce821b0c')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
