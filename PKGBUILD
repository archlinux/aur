# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=aref-ruqaa
_pname=ArefRuqaa
pkgbase=$_fname-font
pkgname=(otf-$_fname ttf-$_fname)
pkgver=1.006
pkgrel=1
pkgdesc='an Arabic typeface that aspires to capture the classical Ruqaa calligraphic style'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(OFL)
provides=("$pkgbase")
_archive="$_pname-v$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.zip")
sha256sums=('83e7084d8a326bf9e2d7048318cad85aa718ec47a3ac75af125fb3cab2b43699')

package_otf-aref-ruqaa() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}

package_ttf-aref-ruqaa() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" ttf/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
}
