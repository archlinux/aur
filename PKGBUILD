# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Co-Maintainer:  SierraKiloBravo <aur at hillebrand dot io>

pkgname=vieb-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=('x86_64')
url='https://vieb.dev'
license=('GPL3')
provides=('vieb')
depends=('gtk3'
         'nss')
source=("${pkgname}-${pkgver}.deb::https://github.com/Jelmerro/Vieb/releases/download/${pkgver}/vieb_${pkgver}_amd64.deb")
sha256sums=('cc5142a90ba059ed08668de32ec836f658ae439029ab510929489f30b92ca7bb')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}
