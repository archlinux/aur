# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=zek-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Generate a Go struct from XML"
arch=('x86_64')
url='https://github.com/miku/zek'
license=('GPL3')
provides=('zek')
depends=('glibc')
source=("${pkgname}-${pkgver}.deb::https://github.com/miku/zek/releases/download/v${pkgver}/zek_${pkgver}_amd64.deb")
sha256sums=('6f428de40f5a6ce60403c30d31e47df95d3bc52fa17cee40ab6115a2755b25cc')

package() {
  cd "${srcdir}"
  tar xvf data.tar.xz -C "${pkgdir}"
  cd ${pkgdir}/usr
  mv sbin bin
  chmod 755 bin/zek
}
