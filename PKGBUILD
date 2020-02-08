# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak96.comic
pkgver=0.4.10.extended
pkgrel=1
pkgdesc="Medium resolution graphics set for Simutrans, with a comic style"
arch=('any')
url="https://www.simutrans.com/"
license=('Freeware')
source=(https://sourceforge.net/projects/simutrans/files/pak96.comic/pak96.comic%20for%20111-3/pak96.comic-0.4.10-plus.zip)
sha256sums=('9e24684d63440be04ea5031d40642332ff3b04a9145af685f62fe24932eebc5c')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak96.comic"
  cp -r simutrans/pak96.comic/* "$pkgdir/usr/share/games/simutrans/pak96.comic"
}
