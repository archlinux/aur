# Maintainer: Maryam Sheikh (Mahid Sheikh) <mahid@standingpad.org>
pkgname=nom-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ac381c634a39112e3a1024dbd3a96f20617b158d420807c36cd75382a56e4a64')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
