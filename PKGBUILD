# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak192.comic
pkgver=0.5
pkgrel=3
pkgdesc="High resolution graphics set for Simutrans, with a comic style"
arch=('any')
url="https://www.simutrans.com/"
license=('CC-BY-SA')
provides=('simutrans-pak192.comic')
source=(https://sourceforge.net/projects/simutrans/files/pak192.comic/pak192comic%20for%20120-2-2/pak192.comic.0.5.zip)
sha256sums=('5e739818e5611dfe81f3069229ae049715fadf5ce54d4df5cbd4198c47c567c2')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak192.comic"
  cp -r simutrans/pak192.comic/* "$pkgdir/usr/share/games/simutrans/pak192.comic"
}
