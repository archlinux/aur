# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=inkscape-multipage-export
pkgver=2.0
pkgrel=2
pkgdesc="Inkscape extension to export selected objects to various file formats"
arch=("any")
url="https://github.com/olibia/inkscape-multipage-export"
license=("GPL")
depends=("inkscape" "python2-lxml" "librsvg" "pdftk")
provides=("inkscape-multipage-export")
conflicts=("inkscape-multipage-export-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("142d127351b85c201131a3ac0ebf0aef")

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/multipage_export.inx" "$pkgdir/usr/share/inkscape/extensions/multipage_export.inx"
  install -Dm644 "$srcdir/$pkgname-$pkgver/multipage_export.py" "$pkgdir/usr/share/inkscape/extensions/multipage_export.py"
}
