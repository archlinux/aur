# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vieb-bin
pkgver=2.2.1
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
sha256sums=('15cb922dd0096a34c2e7206e6ee8026d0211c1780d12ba2f8536ee5f5fc1afc8')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}