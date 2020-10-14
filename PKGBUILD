# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak192.comic
pkgver=0.6.RC1
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans, with a comic style"
arch=('any')
url="https://www.simutrans.com/"
license=('CC-BY-SA')
provides=('simutrans-pak192.comic')
source=(https://github.com/Flemmbrav/Pak192.Comic/releases/download/2021-V0.6-RC1/pak192.comic.0.6.RC1.with_addons.zip)
sha256sums=('fccae14d2e37508b5532137b5a3b69b20cf1dc9132e123d0a04222b1a402f064')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak192.comic"
  cp -r simutrans/pak192.comic/* "$pkgdir/usr/share/games/simutrans/pak192.comic"
}
