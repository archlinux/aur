# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rebaslight
pkgver=3.6.2
pkgrel=1
pkgdesc="An easy to use special effects editor"
arch=('x86_64')
url='https://www.rebaslight.com'
license=('AGPL3')
depends=('gtk3'
         'nss')
source=("${pkgname}-${pkgver}.deb::https://github.com/rebaslight/rebaslight/releases/download/v${pkgver}/rebaslight_${pkgver}_amd64.deb")
sha256sums=('dfa2f94ac9048ec80d392e77002ddff9c5aac83505b74f5d97ce22e5e68bfc13')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
}
