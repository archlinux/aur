# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=aref-ruqaa
_pname=ArefRuqaa
pkgbase=$_fname-font
pkgname=(ttf-$_fname)
pkgver=1.003
pkgrel=2
pkgdesc='an Arabic typeface that aspires to capture the classical Ruqaa calligraphic style'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(OFL)
provides=("$pkgbase")
source=("$url/releases/download/v$pkgver/$_pname-$pkgver.zip")
sha256sums=('26c4b0690d48d3fba4d8b3d0a004c92e9f9cf5f476a6a2fcbc5221427bf1dcb3')

package_otf-aref-ruqaa() {
	cd "$_pname-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

package_ttf-aref-ruqaa() {
	cd "$_pname-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
