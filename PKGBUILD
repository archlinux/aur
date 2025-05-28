# Maintainer: Mahid Sheikh <mahid@standingpad.org>
pkgname=nom-bin
pkgver=2.8.1
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=("https://github.com/guyfedwards/nom/releases/download/v${pkgver}/nom_${pkgver}_linux_amd64.tar.gz")
sha256sums=('20442b232d9f399b1c1d81c83b3758295c8d719c42d040d0c8b405365a45d6ab')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
