# Maintainer: Caleb Maclennan <caleb@alerque.com>

_name=exeter-book-hand
pkgbase=$_name-font
pkgname=(otf-$_name)
pkgver=1.0.0
pkgrel=1
pkgdesc='a font set based on the calligraphic style found in the 10th-century Exeter Book'
arch=(any)
url="https://${_name//-}.com"
license=(OFL)
_archive="EBH-v$pkgver"
source=("$url/$_archive.zip")
sha256sums=('6787471d7766a8be31f2e601620e402ff43bafd183d626a8df75767e91052af3')

package_otf-exeter-book-hand() {
	provides=("$pkgbase")
	cd "$_archive"
	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" license.md
	install -Dm644 -t "$pkgdir/usr/share/docs/$pkgname/" *.pdf
}
