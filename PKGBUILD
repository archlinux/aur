pkgname=otf-bodoni
pkgver=2.0
pkgrel=1
pkgdesc="An OpenType Bodoni revival created by indestructible type*."
arch=('any')
url="https://indestructibletype.com/Bodoni.html"
license=('custom:OFL')
depends=('fontconfig')
source=("https://indestructibletype.com/Bodoni.zip")
sha256sums=('d8e61cb93c475e933589398f88815820b714df8e4a2971c4b220bd51be7fced2')

package() {

  install -d "$pkgdir/usr/share/fonts/bodoni"
  install -m644 OpenType/*.otf "$pkgdir/usr/share/fonts/bodoni/"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
