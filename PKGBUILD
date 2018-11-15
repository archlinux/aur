# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=inkscape-generate-palette
pkgver=2.0
pkgrel=1
pkgdesc="Inkscape extension to generate color palettes"
arch=("any")
url="https://github.com/olibia/inkscape-generate-palette"
license=("GPL")
depends=("inkscape" "python2-lxml")
conflicts=("$pkgname" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("82588c648d9948839c5c1e2704424f9d")

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/generate_palette.inx" "$pkgdir/usr/share/inkscape/extensions/generate_palette.inx"
  install -Dm644 "$srcdir/$pkgname-$pkgver/generate_palette.py" "$pkgdir/usr/share/inkscape/extensions/generate_palette.py"
}
