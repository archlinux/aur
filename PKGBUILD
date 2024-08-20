# Maintainer: Mahid Sheikh <mahid@standingpad.org>
#
# shellcheck disable=all
pkgname=nom-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=('https://github.com/guyfedwards/nom/releases/download/v2.6.0/nom_2.6.0_linux_amd64.tar.gz')
sha256sums=('4de4710c461f6e6830ebeb4e29789a6416159127c28639b0eaa168d8fcb236b4')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
