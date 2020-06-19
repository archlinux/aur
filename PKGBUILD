pkgname=simutrans-pak192.comic
pkgver=0.5
pkgrel=1
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
  mkdir -p "$pkgdir/usr/share/games/simutrans"
  cp -r pak192.comic.$pkgver "$pkgdir/usr/share/games/simutrans"
}
