# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rebaslight
pkgver=3.6.1
pkgrel=1
pkgdesc="An easy to use special effects editor"
arch=('x86_64')
url='https://www.rebaslight.com'
license=('AGPL3')
depends=('libxss'
         'gtk3'
         'nss')
source=("${pkgname}-${pkgver}.deb::https://github.com/rebaslight/rebaslight/releases/download/v${pkgver}/rebaslight_${pkgver}_amd64.deb")
sha256sums=('52de9578e1922f912cdb86f13c9a2ecc4e1f1f42181b008543796509cc9c4548')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}