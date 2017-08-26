# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=inkscape-download-palette
pkgver=1.0
pkgrel=1
pkgdesc="Inkscape extension to download color palettes"
arch=("any")
url="https://github.com/olibia/inkscape-download-palette"
license=("GPL")
depends=("inkscape" "python2-lxml")
provides=("inkscape-download-palette")
conflicts=("inkscape-download-palette-git")
source=("$pkgname::https://github.com/olibia/inkscape-download-palette/archive/v$pkgver.tar.gz")
md5sums=("cd15f23883b2407cdd33d13f0e221036")

package() {
  mkdir -p "$pkgdir/usr/share/inkscape/extensions/"

  cd "$srcdir/$pkgname-$pkgver"
  cp "download_palette.inx" "$pkgdir/usr/share/inkscape/extensions/"
  cp "download_palette.py" "$pkgdir/usr/share/inkscape/extensions/"
}
