# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=inkscape-download-palette
pkgver=1.0
pkgrel=2
pkgdesc="Inkscape extension to download color palettes"
arch=("any")
url="https://github.com/olibia/inkscape-download-palette"
license=("GPL")
depends=("inkscape" "python-lxml")
provides=("inkscape-download-palette")
conflicts=("inkscape-download-palette-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("cd15f23883b2407cdd33d13f0e221036")

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/download_palette.inx" "$pkgdir/usr/share/inkscape/extensions/download_palette.inx"
  install -Dm644 "$srcdir/$pkgname-$pkgver/download_palette.py" "$pkgdir/usr/share/inkscape/extensions/download_palette.py"
}
