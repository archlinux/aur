# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=breaktimer-bin
pkgver=0.8.1
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
sha256sums=('7516fd6e0e71a82a8f8f47d5f3229476f8dfdcd59c7f6f801ebf40bca4368987')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
