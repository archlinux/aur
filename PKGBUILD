# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=mada
pkgbase=$_fname-font
pkgname=(otf-$_fname ttf-$_fname)
pkgver=1.3
pkgrel=2
pkgdesc='A geometric, unmodulted Arabic display typeface'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(OFL)
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/${_fname^}-$pkgver.zip")
sha256sums=('73a11529781730985ddf4bdbf18f2df58babc73d0ae72a87ae388410c71b0b37')

package_otf-mada() {
	cd "${_fname^}-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

package_ttf-mada() {
	cd "${_fname^}-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF" ttf/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.txt
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
