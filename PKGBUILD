# Maintainer: Mahid Sheikh <mahid@standingpad.org>
pkgname=nom-bin
pkgver=2.17.0
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d329a31dbbde71785aa542cffe58a060d3a9f95d2736145cc97b880afe6f50dc')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
