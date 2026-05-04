# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=qashib
pkgbase=$_fname-font
pkgname=(ttf-$_fname)
pkgver=2.00
pkgrel=1
pkgdesc='A manuscript Kufic typeface'
arch=(any)
url="https://aliftype.com/$_fname/"
license=(AGPL-3.0-only)
provides=("$pkgbase")
source=("https://github.com/aliftype/$_fname/releases/download/v$pkgver/${_fname^}-$pkgver.zip")
sha256sums=('f8eafdd4b53f060c447c0dc1dfed21fe97b8d493c8e8ae10ab07ace48a3b492e')

package_ttf-qahiri() {
	cd "${_fname^}-$pkgver"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
