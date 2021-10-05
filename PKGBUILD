# Maintainer:  Snehit Sah <snehitsah at protonmail dot com>
# Contributor/ Past Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=breaktimer-bin
pkgver=1.0.0
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
sha256sums=('121a625b4de11408f04ea8b308f275b3c771111865e53d6fbc25ce139338383a')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
