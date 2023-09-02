# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=raqq
pkgbase=$_fname-font
pkgname=ttf-$_fname
pkgver=2.00
pkgrel=1
pkgdesc='A manuscript Kufic typeface'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(AGPL3)
provides=("$pkgbase")
_archive="${_fname^}-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.zip")
sha256sums=('b8fdeb17a689abb15e26ea04b11c57f1c0e88bbba416264eb0e723f7e5421cfe')

package_ttf-raqq() {
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README*.txt
}
