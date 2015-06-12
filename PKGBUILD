# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=stilts
pkgver=3.0.3
_pkgver=3.0-3
pkgrel=1
pkgdesc="Starlink Tables Infrastructure Library Tool Set"
arch=('any')
url="http://www.star.bris.ac.uk/~mbt/stilts/"
depends=('java-environment' 'sh')
license=('GPL')
noextract=('stilts.jar')
source=("ftp://andromeda.star.bris.ac.uk/pub/star/stilts/v${_pkgver}/stilts.jar"
        "stilts" "stilts4.gif")
md5sums=('ec8ef2e07238a6783fa417e63771869f'
         '4f7dd76969e791b934cfd8eb59822bf2'
         '574cb973184b3b7562f84c3e171244dd')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -m644 "$srcdir"/stilts.jar "$pkgdir"/usr/share/java
  install -m755 "$srcdir"/stilts "$pkgdir"/usr/bin/stilts
  install -m755 "$srcdir"/stilts4.gif "$pkgdir"/usr/share/pixmaps
}
