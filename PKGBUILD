# Maintainer: Andy Crowd <andy_crowd@ainsdata.se>
pkgname=lsdsk
pkgver=3.0.0
pkgrel=0
pkgdesc="Search in *.desktop for content in Exec and Categories/Name."
arch=(any)
depends=(bash)
makedepends=('git')
source=("lsdsk::git+https://github.com/AndyCrowd/lsdsk.git")
license=('GPL')
md5sums=('SKIP')
url="https://github.com/AndyCrowd/lsdsk/blob/master/lsdsk"

package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"

  install -m755 "$srcdir/$pkgname/lsdsk" "$pkgdir/usr/bin"
  install -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
