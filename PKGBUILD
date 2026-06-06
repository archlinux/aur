# Maintainer: Maryam Sheikh (Mahid Sheikh) <mahid@standingpad.org>
pkgname=nom-bin
pkgver=3.3.2
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ae6064937a8d279a1138808657c8ff70a1a342f8d4fee0fb6c7f762ec1c00cd9')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
