# Maintainer: Artemiy <kolobov-artem@bk.ru>
# Contributor: Lee
pkgname='betafpv-configurator'
pkgver='2.0'
pkgrel=0
epoch=1
pkgdesc="BETAFPV Configurator — software for configuring BETAFPV drones"
arch=('x86_64')
url="https://github.com/BETAFPV/BETAFPV_Configurator"
license=('GPL3')
groups=()
depends=()
makedepends=()
provides=('betafpv-configurator')
options=(!debug)
conflicts=()
source=("https://github.com/BETAFPV/BETAFPV_Configurator/releases/download/V${pkgver}.${pkgrel}/BETAFPV_Configurator_${pkgver}_linux_x64.deb")
sha256sums=('488893cb2473c68c819e6a5a187f1eb66ef7ded505af141afee7534b62f06c94')

package() {
  cd "$srcdir"
  ar x BETAFPV_Configurator_2.0_linux_x64.deb
  tar -xf data.tar.xz --no-same-owner -C "$pkgdir"
}
