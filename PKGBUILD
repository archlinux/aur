# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=inkscape-multipage-export
pkgver=1.0
pkgrel=3
pkgdesc="Inkscape extension to export selected objects to various file formats"
arch=("any")
url="https://github.com/olibia/inkscape-multipage-export"
license=("GPL")
depends=("inkscape" "python2-lxml" "librsvg")
provides=("inkscape-multipage-export")
conflicts=("inkscape-multipage-export-git")
source=("$pkgname::https://github.com/olibia/inkscape-multipage-export/archive/v$pkgver.tar.gz")
md5sums=("90be17defa5cdf7981788c5893c54694")

package() {
  mkdir -p "$pkgdir/usr/share/inkscape/extensions/"

  cd "$srcdir/$pkgname-$pkgver"
  cp "multipage_export.inx" "$pkgdir/usr/share/inkscape/extensions/"
  cp "multipage_export.py" "$pkgdir/usr/share/inkscape/extensions/"
}
