# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=inkscape-generate-palette
pkgver=3.0
pkgrel=1
pkgdesc="Inkscape extension to generate color palettes"
arch=("any")
url="https://github.com/olibia/inkscape-generate-palette"
license=("GPL")
depends=("inkscape" "python2-lxml")
conflicts=("$pkgname" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("65d4c400b1b98b0bc925fb3ec2ece6a2")

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/generate_palette.inx" "$pkgdir/usr/share/inkscape/extensions/generate_palette.inx"
  install -Dm644 "$srcdir/$pkgname-$pkgver/generate_palette.py" "$pkgdir/usr/share/inkscape/extensions/generate_palette.py"
}
