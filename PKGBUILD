# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=inkscape-multipage-export
pkgver=3.0
pkgrel=1
pkgdesc="Inkscape extension to export selected objects to various file formats"
arch=("any")
url="https://github.com/olibia/inkscape-multipage-export"
license=("GPL")
depends=("inkscape" "python2-lxml" "librsvg" "pdftk")
provides=("inkscape-multipage-export")
conflicts=("inkscape-multipage-export-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("fde65e344e68696bb1efae72bf286e93")

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/multipage_export.inx" "$pkgdir/usr/share/inkscape/extensions/multipage_export.inx"
  install -Dm644 "$srcdir/$pkgname-$pkgver/multipage_export.py" "$pkgdir/usr/share/inkscape/extensions/multipage_export.py"
}
