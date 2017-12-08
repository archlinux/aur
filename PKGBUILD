# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=gournal
pkgver=0.5.1.1
_pkgver=0.5.1-1
pkgrel=2
pkgdesc='A note-taking application written for usage on Tablet-PCs'
arch=('any')
url='http://www.adebenham.com/old-stuff/gournal/'
license=('GPL')
depends=(gnomecanvas-perl perl-gnome2-print perl-xml-mini)
options=(!strip)
source=("http://www.adebenham.com/debian/${pkgname}_$_pkgver.tar.gz"
gournal.desktop)
sha256sums=('3df4baf5e3b299c3606e199935fdfb6d3acdc91adecc45fc21e92ea407fd6155'
            '5d9a6da20c2c99a04c8c38b95df98ffd5b5bb53c6e4a044b05121a7c5609ce8d')

package(){
  cd "$srcdir/$pkgname"
  install -Dm755 gournal $pkgdir/usr/bin/gournal
  install -Dm644 gournal.glade $pkgdir/usr/share/gournal/gournal.glade
  install -Dm644 ../gournal.desktop $pkgdir/usr/share/applications/gournal.desktop
  cp pixmaps/*.png $pkgdir/usr/share/gournal
}
