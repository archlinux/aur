# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=breaktimer-bin
pkgver=0.7.5
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
sha256sums=('bf53c5f67393507a4bf522ffe3a9545be33e778703bf7e9c9d745dc9a382cb1b')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et: