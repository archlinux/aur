# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=inkscape-generate-palette
pkgver=4.0
pkgrel=2
pkgdesc="Inkscape extension to generate color palettes"
arch=("any")
url="https://github.com/olibia/inkscape-generate-palette"
license=("GPL")
depends=("inkscape" "python-lxml")
conflicts=("$pkgname" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("a2ef63a38399d82233c935031b33d7a1")

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/generate_palette.inx" "$pkgdir/usr/share/inkscape/extensions/generate_palette.inx"
  install -Dm644 "$srcdir/$pkgname-$pkgver/generate_palette.py" "$pkgdir/usr/share/inkscape/extensions/generate_palette.py"
  install -Dm644 "$srcdir/$pkgname-$pkgver/info.svg" "$pkgdir/usr/share/inkscape/extensions/info.svg"
}
