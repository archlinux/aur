# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
_pkgname=${pkgname%-bin}
pkgver=0.8.6
pkgrel=1
pkgdesc="A realtime emulator of development boards with integrated MPLABX/avr-gdb debugger"
arch=('x86_64')
url='https://github.com/lcgamboa/picsimlab'
license=('GPL2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('wxgtk3'
         'picsim'
         'openal')
makedepends=('tar')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Ubuntu_20.10_amd64.deb")
sha256sums=('f5013d38d79a79ab9f3ee77db7d09bb9a52c2abc9706bbb0fcccfa26d167c20b')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
