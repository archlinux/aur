# Maintainer: Mahid Sheikh <mahid@standingpad.org>
pkgname=nom-bin
pkgver=2.20.0
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a84156552f60bf93c22b21a35217b7f862d14b7ba45749df5c78798d44c6f3f3')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
