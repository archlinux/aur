# Maintainer: Martin Czygan <martin.czygan@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=zek-bin
pkgver=0.1.19
pkgrel=1
pkgdesc="Generate a Go struct from XML"
arch=('x86_64')
url='https://github.com/miku/zek'
license=('GPL3')
provides=('zek')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miku/zek/releases/download/${pkgver}/zek_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('ef4958ba7cb74f972cc4bccab61fd25531e96d77d7aa9262d75861466fca9ce9')

package() {
  cd "${srcdir}"
  tar xvf ${pkgname}-${pkgver}.tar.gz -C "${pkgdir}/bin"
  chmod 755 bin/zek
}
