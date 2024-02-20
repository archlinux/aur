# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak192.comic
pkgver=0.7.1
pkgrel=1
pkgdesc='High resolution graphics set for Simutrans, with a comic style'
arch=('any')
url='https://www.simutrans.com/'
license=('CC-BY-SA')
provides=('simutrans-pak192.comic')
source=('https://github.com/Flemmbrav/Pak192.Comic/releases/download/V0.7.1/pak192.comic-serverset.zip')
sha256sums=('4d1f2c053a5928e66131ff402136677c5ef18854c4731a05d232dd8a9b87a03c')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak192.comic"
  cp -r pak192.comic*/* "$pkgdir/usr/share/games/simutrans/pak192.comic"
}
