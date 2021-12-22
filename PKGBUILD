# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak192.comic
pkgver=0.6.RC2
pkgrel=1
pkgdesc='High resolution graphics set for Simutrans, with a comic style'
arch=('any')
url='https://www.simutrans.com/'
license=('CC-BY-SA')
provides=('simutrans-pak192.comic')
source=('https://github.com/Flemmbrav/Pak192.Comic/releases/download/2021-V0.6-RC2/pak192.comic.0.6.RC2.with_addons.zip')
sha256sums=('a39b56bf485621ef9325772c07a6cd4bbc5101e29879fb0638974bdd556e6166')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak192.comic"
  cp -r pak192.comic*/* "$pkgdir/usr/share/games/simutrans/pak192.comic"
}
