# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak192.comic
pkgver=0.6
pkgrel=1
pkgdesc='High resolution graphics set for Simutrans, with a comic style'
arch=('any')
url='https://www.simutrans.com/'
license=('CC-BY-SA')
provides=('simutrans-pak192.comic')
source=('https://github.com/Flemmbrav/Pak192.Comic/releases/download/V0.7/pak192.comic-serverset.zip')
sha256sums=('5149e9114b6918b94ff2659b232110c1c7525cd4ed8f63eae50c90119f0175e9')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak192.comic"
  cp -r pak192.comic*/* "$pkgdir/usr/share/games/simutrans/pak192.comic"
}
