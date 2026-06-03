# Maintainer: Maryam Sheikh (Mahid Sheikh) <mahid@standingpad.org>
pkgname=nom-bin
pkgver=3.3.1
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('996afe38e1f7e36c8fcb0c6089318377bfdac84a9fb1c8517b5609dbfa5e8c16')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
