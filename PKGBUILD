# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ten-hands-bin
_pkgname=ten-hands-app
pkgver=2.10.3
pkgrel=1
pkgdesc="Simplest way to organize and run tasks"
arch=('x86_64')
url='https://tenhands.app'
_githuburl="https://github.com/saisandeepvaddi/ten-hands"
depends=()
license=('MIT')
provides=('saisandeepvaddi')
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('5a1a4d3970a46d1fde2ccb506653f637a8b0edac5a77a64d12a45e723b555daa')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"
}