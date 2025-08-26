# Maintainer: Martin Czygan <martin.czygan@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=zek-bin
pkgver=0.1.28
pkgrel=1
pkgdesc="Generate a Go struct from XML"
arch=('x86_64')
url='https://github.com/miku/zek'
license=('GPL3')
provides=('zek')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miku/zek/releases/download/${pkgver}/zek_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('44e0cdd902fedba9f99a6480ef4b244b91c8d78a7e0d6a95d96ad644e3fceedc')

package() {
  cd "${srcdir}"
  tar xvf ${pkgname}-${pkgver}.tar.gz -C "${pkgdir}/bin"
  chmod 755 bin/zek
}
