# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak256
pkgver=2.3.0.1
pkgrel=1
pkgdesc="Highest resolution graphics set for Simutrans Extended"
arch=('any')
url="https://www.simutrans.com/"
license=('CC-BY-NC-SA 4.0')
depends=('simutrans-extended')
source=(https://github.com/Phystam/pak256-release/archive/$pkgver.zip)
sha256sums=('3cfd8062f3be80fdeb6d3fd48171a2efe9b1eeaa35bec1aed64cc90e474d93ac')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
  cp -r pak256-release-$pkgver/* "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
}
