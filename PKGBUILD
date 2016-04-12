# $Id: PKGBUILD 129917 2015-03-25 20:02:54Z arojas $
# Maintainer: Joel <aullidolunar (at) gmai1 dot c0m >
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Ner0

pkgname=gtk-theme-orion
pkgver=1.5
pkgrel=5
pkgdesc="A modern and light GTK theme"
arch=('any')
url="http://deviantart.com/view/281431756"
license=('GPL3')
optdepends=('gtk-engine-murrine: For the GTK2 theme')
source=("https://github.com/shimmerproject/Orion/archive/master.zip")
md5sums=('13282665487538b53f3de5b9c2e79435')

package() {
  cd Orion-master
  find . -type f -not -name .gitignore -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/Orion/{}" \;
}
