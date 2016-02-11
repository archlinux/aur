# Maintainer: Andy Crowd <andy_crowd@ainsdata.se>
pkgname=fbrokendesktop
pkgver=1.0.3
pkgrel=1
pkgdesc="Search for broken Exec in *.desktop"
arch=(any)
depends=(bash)
makedepends=('git')
source=("fbrokendesktop::git+https://github.com/AndyCrowd/fbrokendesktop.git")
license=('GPL2')
md5sums=('SKIP')
url="https://github.com/AndyCrowd/"

package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"

  install -m755 "$srcdir/$pkgname/fbrokendesktop" "$pkgdir/usr/bin"
  install -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
