pkgname=otf-bodoni
pkgver=2.2
pkgrel=1
pkgdesc="An OpenType Bodoni revival created by indestructible type*."
arch=('any')
url="https://indestructibletype.com/Bodoni.html"
license=('custom:OFL')
source=("https://github.com/indestructible-type/Bodoni/archive/$pkgver.tar.gz")
sha256sums=('8e4febd19ba6a32e8bef7f935efb896d4459f5dc55f9c0afe1f4b9a10dc37525')

package() {
  install -d "$pkgdir/usr/share/fonts/bodoni"
  cd "$srcdir/Bodoni-$pkgver"
  install -m644 fonts/otf/*.otf "$pkgdir/usr/share/fonts/bodoni/"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
