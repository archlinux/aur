pkgname=simutrans-pak192.comic
pkgver=0.4.1
pkgrel=1
pkgdesc="High resolution graphics set for Simutrans"
arch=('any')
url="http://192comic.simutrans.com/"
license=('CC-BY-SA')
provides=('simutrans-pak192.comic')
options=('!strip')
source=(https://dl.dropboxusercontent.com/u/85896215/pak192.comic.$pkgver.zip)
md5sums=('SKIP')

package() {
  cd "$srcdir"

  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans"
  cp -r pak192.comic.$pkgver "$pkgdir/usr/share/games/simutrans"
}
