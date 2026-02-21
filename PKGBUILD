# Maintainer: Maryam Sheikh (Mahid Sheikh) <mahid@standingpad.org>
pkgname=nom-bin
pkgver=3.2.5
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('27227050da6b0f44c4cae967832805fc575b2b1f2de7567b209b76943305606a')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
