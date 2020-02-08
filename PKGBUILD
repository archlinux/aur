# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak256
pkgver=2.0.1
pkgrel=1
pkgdesc="Highest resolution graphics set for Simutrans Extended"
arch=('any')
url="https://www.simutrans.com/"
license=('CC-NC-SA 4.0')
depends=('simutrans-extended')
source=(https://github.com/Phystam/pak256-release/archive/2.0.1.0.zip)
sha256sums=('c79d2e3c80eb59fda1c5c4007a721953b62a483d1a45dd91870d3ae26243fdf9')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
  cp -r pak256-release-2.0.1.0/* "$pkgdir/usr/share/games/simutrans-extended/pak256-ex"
}
