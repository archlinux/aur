pkgname=otf-bodoni
pkgver=2.1
pkgrel=1
pkgdesc="An OpenType Bodoni revival created by indestructible type*."
arch=('any')
url="https://indestructibletype.com/Bodoni.html"
license=('custom:OFL')
depends=('fontconfig')
source=("https://github.com/indestructible-type/Bodoni/archive/$pkgver.tar.gz")
sha256sums=('63bb89966c21232defe7ca834240883262b4f856a7ea7472ea4ec915549554f6')

package() {
  install -d "$pkgdir/usr/share/fonts/bodoni"
  cd "$srcdir/Bodoni-$pkgver"
  install -m644 fonts/otf/*.otf "$pkgdir/usr/share/fonts/bodoni/"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
