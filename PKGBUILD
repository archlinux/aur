# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak256
pkgver=2.1.0.0
pkgrel=1
pkgdesc="Highest resolution graphics set for Simutrans Extended"
arch=('any')
url="https://www.simutrans.com/"
license=('CC-BY-NC-SA 4.0')
depends=('simutrans-extended')
source=(https://github.com/Phystam/pak256-release/archive/$pkgver.zip)
sha256sums=('e04226e7cfb8551e5ddfc82a2d07403e1438be6da3b6511629d460b9f84d3b50')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
  cp -r pak256-release-$pkgver/* "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
}
