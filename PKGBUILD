# Maintainer: Ludvig Holtze <ludvighg1999 at gmail dot com>

pkgname=ttf-ocr-a
pkgver=2008
pkgrel=1
pkgdesc="A font that was designed to be easy for computers to read (TTF version)"
url="http://luc.devroye.org/fonts-48501.html"
license=('custom')
arch=('any')
depends=()
source=('http://luc.devroye.org/OCRA.zip')
sha256sums=('694371f1c48abc87bbdc42c8ab69666aa51a49c9abe95d73b547bfc2af080f08')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "$srcdir/ocr/OCRA.ttf" "$pkgdir/usr/share/fonts/TTF"
}
