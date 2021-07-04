# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak256
pkgver=2.4.0.1
pkgrel=1
pkgdesc="Highest resolution graphics set for Simutrans Extended"
arch=('any')
url="https://www.simutrans.com/"
license=('CC-BY-NC-SA 4.0')
depends=('simutrans-extended-git')
source=(https://github.com/Phystam/pak256-release/archive/$pkgver.zip)
sha256sums=('66b8b86b8d77804ebb9bbff12a0937a1f3a5eb3cba80119f1f473fce84e3a644')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
  cp -r pak256-release-$pkgver/* "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
}
