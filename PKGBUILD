# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vieb-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=('x86_64')
url='https://vieb.dev'
license=('GPL3')
provides=('vieb')
depends=('libxss'
         'gtk3'
         'nss')
source=("${pkgname}-${pkgver}.deb::https://github.com/Jelmerro/Vieb/releases/download/${pkgver}/vieb_${pkgver}_amd64.deb")
sha256sums=('19208f83f79085beccefd8f12ba8268796fd1487c78b36a2f852d56332bd3b38')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}