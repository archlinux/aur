# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-extended-pak128.sweden
pkgver=20200504
pkgrel=2
pkgdesc="High resolution graphics set for Simutrans Extended, with a swedish theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
depends=('simutrans-extended-git')
source=(http://bridgewater-brunel.me.uk/downloads/nightly/pakset/pak128.sweden-ex-nightly.tar.gz)
sha256sums=('e70f2c7bed856724baaf25397d0099b79af77d74e3848e3150ba22224ebf0d22')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans-extended/pak128.sweden-ex"
  cp -r * "$pkgdir/usr/share/games/simutrans-extended/pak128.sweden-ex"
}
