# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=zek-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="Generate a Go struct from XML"
arch=('x86_64')
url='https://github.com/miku/zek'
license=('GPL3')
provides=('zek')
source=("${pkgname}-${pkgver}.deb::https://github.com/miku/zek/releases/download/v${pkgver}/zek_${pkgver}_amd64.deb")
sha256sums=('dd3e786ad5d741509ab3fca99de263ef15a4698323ee64d4c482e4546b004d7d')

package() {
  cd "${srcdir}"
  tar xvf data.tar.xz -C "${pkgdir}"
  cd ${pkgdir}/usr
  mv sbin bin
  chmod 755 bin/zek
}