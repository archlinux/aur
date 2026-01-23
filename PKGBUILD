# Maintainer: Artemiy <kolobov-artem@bk.ru>
# Contributor: Lee
pkgname='betafpv-configurator-bin'
pkgver='2.0'
pkgrel=1
epoch=1
pkgdesc="BETAFPV Configurator — software for configuring BETAFPV drones"
arch=('x86_64')
daterel=('20250804')
coderel=('0e5d03c')
url="https://github.com/BETAFPV/BETAFPV_Configurator"
license=('GPL3')
groups=()
depends=()
makedepends=()
provides=('betafpv-configurator')
options=(!debug)
conflicts=()
source=("https://github.com/BETAFPV/BETAFPV_Configurator/releases/download/V${pkgver}.${pkgrel}/BETAFPV_Configurator_Linux_x64_v${pkgver}.${pkgrel}_${daterel}_${coderel}.deb")
sha256sums=('f695ede6992280f2024f47a09fcad5796607068ad7c44993c878fbcad930475d')

package() {
  cd "$srcdir"
  ar x BETAFPV_Configurator_Linux_x64_v${pkgver}.${pkgrel}_${daterel}_${coderel}.deb
  tar -xf data.tar.xz --no-same-owner -C "$pkgdir"
}
