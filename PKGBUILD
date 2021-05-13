# Maintainer:  Snehit Sah <snehitsah at protonmail dot com>
# Contributor/ Past Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=breaktimer-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Manage periodic breaks. Avoid eye-strain and RSI'
arch=('x86_64')
url='https://breaktimer.app'
license=('GPL3')
provides=('breaktimer')
depends=('nss'
         'python'
         'gtk3'
         'nodejs')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/tom-james-watson/breaktimer-app/releases/download/v${pkgver}/BreakTimer.deb")
sha256sums=('166d33f7fbca124920bbcfaa05ea351d92706121317f67a7be9ed3710d3b0618')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
