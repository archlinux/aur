# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=breaktimer-bin
pkgver=0.7.3
pkgrel=1
pkgdesc='Manage periodic breaks. Avoid eye-strain and RSI'
arch=('x86_64')
url='https://breaktimer.app'
license=('GPL3')
provides=('breaktimer')
depends=('nss'
         'python'
         'gtk3'
         'libxss'
         'nodejs')
makedepends=('tar')
source=("${pkgname%-bin}-${pkgver}.deb::https://github.com/tom-james-watson/breaktimer-app/releases/download/v${pkgver}/BreakTimer.deb")
sha256sums=('fecdf9f784cb76cbc2ce80ff73a753e15625a982dc5a243c9cc9f407abf5359c')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et: