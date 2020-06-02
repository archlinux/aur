# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak256
pkgver=2.0.2.2
pkgrel=1
pkgdesc="Highest resolution graphics set for Simutrans Extended"
arch=('any')
url="https://www.simutrans.com/"
license=('CC-BY-NC-SA 4.0')
depends=('simutrans-extended')
source=(https://github.com/Phystam/pak256-release/archive/2.0.2.2.zip)
sha256sums=('e1cc46d356cede377956e93a66ec070a1e9b45b701db6bf188ad4ffeeb47d9d3')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
  cp -r pak256-release-$pkgver/* "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
}
