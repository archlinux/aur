# Maintainer: Mahid Sheikh <mahid@standingpad.org>
pkgname=nom-bin
pkgver=2.15.0
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b85edbbc668b0cdfa73c767dfa14c033a68e7509ecb31d4ab7eeed0f76154157')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
