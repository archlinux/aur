# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=raqq
pkgbase=$_fname-font
pkgname=ttf-$_fname
pkgver=1.00
pkgrel=2
pkgdesc='A manuscript Kufic typeface'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(AGPL3)
provides=("$pkgbase")
_archive="${_fname^}-$pkgver"
source=("$_archive-$pkgrel.zip::$url/releases/download/v$pkgver/$_archive.zip")
sha256sums=('c0e199c1ac515e96286a15e986012e6126073c4fbea6ba45fd46be19e7bde227')

package_ttf-raqq() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README*.txt
}
