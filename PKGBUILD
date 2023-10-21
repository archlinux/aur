# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak256
pkgver=2.4.0.1
pkgrel=1
pkgdesc="Highest resolution graphics set for Simutrans Extended"
arch=('any')
url="https://www.simutrans.com/"
license=('CC-BY-NC-SA 4.0')
depends=('simutrans-extended')
source=(https://github.com/Phystam/pak256-release/archive/$pkgver.zip)
sha256sums=('a1c970a77489a197a6e0f315a83b99d2cd3ac6e2d9d806c5ee8066ed4f60a21e')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
  cp -r pak256-release-$pkgver/* "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
}
