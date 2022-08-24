# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak192.comic
pkgver=0.6
pkgrel=1
pkgdesc='High resolution graphics set for Simutrans, with a comic style'
arch=('any')
url='https://www.simutrans.com/'
license=('CC-BY-SA')
provides=('simutrans-pak192.comic')
source=('https://github.com/Flemmbrav/Pak192.Comic/releases/download/V0.6/pak192.comic-serverset.zip')
sha256sums=('4c894d01d04fce6d2f0edeef3066486cf7e3882182fc4cc26255a1aa6bc2209a')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak192.comic"
  cp -r pak192.comic*/* "$pkgdir/usr/share/games/simutrans/pak192.comic"
}
