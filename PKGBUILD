# Maintainer: Schorsch <wsixcde+aur@gmail.com>
# Thanks to mti@tillenius.com whose packages the ps7b packages were based on
pkgname=ps7b_libpicocv
pkgver=1.1.27_1r153
pkgrel=1
pkgdesc="library for picotech oscilloscope software"
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
md5sums=('5304944CD01640E46C46A1A22D58EAF6')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
