# Maintainer: Andy Crowd <andy_crowd@ainsdata.se>
pkgname="lsdesktopf"
pkgver=1.0.0
pkgrel=10
pkgdesc="List available *.desktop files and search in their content."
arch=(any)
depends=(bash)
makedepends=('git')
source=("lsdesktopf::git+https://github.com/AndyCrowd/list-desktop-files.git")
license=('GPL3')
md5sums=('SKIP')
url="https://github.com/AndyCrowd/list-desktop-files"

package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/doc/$pkgname"

  install -m755 "$srcdir/$pkgname/lsdesktopf" "$pkgdir/usr/bin"
  install -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
