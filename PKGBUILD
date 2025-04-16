# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak192.comic
pkgver=0.7.2
pkgrel=1
pkgdesc='High resolution graphics set for Simutrans, with a comic style'
arch=('any')
url='https://www.simutrans.com/'
license=('CC-BY-SA')
provides=('simutrans-pak192.comic')
source=("https://github.com/Flemmbrav/Pak192.Comic/releases/download/V$pkgver/pak192.comic-serverset.zip")
sha256sums=('0551dfc1c5cb9a89eb7db1355c99bb62f045956d16267ca53284eefafed529ed')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak192.comic"
  cp -r pak192.comic*/* "$pkgdir/usr/share/games/simutrans/pak192.comic"
}
