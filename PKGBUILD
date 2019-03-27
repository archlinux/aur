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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("90be17defa5cdf7981788c5893c54694")

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/multipage_export.inx" "$pkgdir/usr/share/inkscape/extensions/multipage_export.inx"
  install -Dm644 "$srcdir/$pkgname-$pkgver/multipage_export.py" "$pkgdir/usr/share/inkscape/extensions/multipage_export.py"
}
