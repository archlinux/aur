# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer:  SierraKiloBravo <aur at hillebrand dot io>

pkgname=vieb-bin
pkgver=2.4.0
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
sha256sums=('afb6140f5485887521740604873a28fb6f6a5049ff3fd93cf5b9b38311445e2f')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}
