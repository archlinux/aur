pkgname=otf-bodoni
pkgver=1.2
pkgrel=1
pkgdesc="An OpenType Bodoni revival created by indestructible type*."
arch=('any')
url="https://indestructibletype.com/Bodoni.html"
license=('custom:OFL')
depends=('fontconfig')
source=("https://indestructibletype.com/Bodoni.zip")
sha256sums=('125de4678b5d075c71042e37ab7138a45160527ecbe939a03d73245f1393792c')

package() {

  install -d "$pkgdir/usr/share/fonts/bodoni"
  install -m644 OpenType/*.otf "$pkgdir/usr/share/fonts/bodoni/"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
