# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vieb-bin
pkgver=2.2.3
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
sha256sums=('6bc4280929d9e9c2775d21b7a826760c4d8c782200e9ee5307ea34bd3185f106')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}