# Maintainer: Roboron <robertoms258 at gmail dot com >

pkgname=simutrans-pak48.excentrique
pkgver=0.18
pkgrel=1
pkgdesc="Low resolution graphics set for Simutrans, with an eccentric theme"
arch=('any')
url="https://www.simutrans.com/"
license=('custom:Artistic')
source=(http://sourceforge.net/projects/ironsimu/files/pak48.Excentrique/v018/pak48-excentrique_v018.zip)
sha256sums=('c69dc9cce34a3c61afed5f57751a480d3aa4366c9e45225777601f71fd1606ab')

package() {
  #data
  mkdir -p "$pkgdir/usr/share/games/simutrans/pak48.excentrique"
  cp -r pak48.Excentrique/* "$pkgdir/usr/share/games/simutrans/pak48.excentrique"
}
