pkgname=otf-bodoni
pkgver=2.3
pkgrel=1
pkgdesc="An OpenType Bodoni revival created by indestructible type*."
arch=('any')
url="https://indestructibletype.com/Bodoni.html"
license=('custom:OFL')
source=("https://github.com/indestructible-type/Bodoni/archive/$pkgver.tar.gz")
sha256sums=('13f76c99c6c8a7b640528180438cf3fa031d68c3561f853e1328b492891128f2')

package() {
  install -d "$pkgdir/usr/share/fonts/bodoni"
  cd "$srcdir/Bodoni-$pkgver"
  install -m644 fonts/otf/*.otf "$pkgdir/usr/share/fonts/bodoni/"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
