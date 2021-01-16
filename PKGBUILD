# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Co-Maintainer:  SierraKiloBravo <aur at hillebrand dot io>

pkgname=vieb-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=('x86_64')
url='https://vieb.dev'
license=('GPL3')
provides=('vieb')
depends=('gtk3'
         'nss')
source=("${pkgname}-${pkgver}.deb::https://github.com/Jelmerro/Vieb/releases/download/${pkgver}/vieb_${pkgver}_amd64.deb")
sha256sums=('998b076b066bc85f8a4603c4224ce1299798f4a0b7a8c31a5c3bd175dcb175f5')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}
