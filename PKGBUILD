# Maintainer: Caleb Maclennan <caleb@alerque.com>

_fname=anti
pkgbase=$_fname-font
pkgname=(otf-$_fname)
pkgver=4.000
pkgrel=1
pkgdesc='a cryptic and playful Arabic typeface'
arch=(any)
url="https://github.com/aliftype/$_fname"
license=(AGPL3)
provides=("$pkgbase")
source=("$url/releases/download/v${pkgver%0}/${_fname^}-${pkgver%00}.zip")
sha256sums=('276646b191e512498a463e4ec9ea1a45ae0f5cae82dc635620a35d6415b4ea06')

package_otf-mada() {
	cd "${_fname^}-${pkgver%00}"
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF" *.otf
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
