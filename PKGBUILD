# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=inkscape-generate-palette
pkgver=1.1
pkgrel=1
pkgdesc="Inkscape extension to generate color palettes"
arch=("any")
url="https://github.com/olibia/inkscape-generate-palette"
license=("GPL")
depends=("inkscape" "python2-lxml")
provides=("inkscape-generate-palette")
conflicts=("inkscape-generate-palette-git")
source=("$pkgname::https://github.com/olibia/inkscape-generate-palette/archive/v$pkgver.tar.gz")
md5sums=("99df7073cdfef25bf408b9d91a1e4e9e")

package() {
  mkdir -p "$pkgdir/usr/share/inkscape/extensions/"

  cd "$srcdir/$pkgname-$pkgver"
  cp "generate_palette.inx" "$pkgdir/usr/share/inkscape/extensions/"
  cp "generate_palette.py" "$pkgdir/usr/share/inkscape/extensions/"
}
