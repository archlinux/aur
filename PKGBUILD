# Maintainer: Mahid Sheikh <mahid@standingpad.org>
#
# shellcheck disable=all
pkgname=nom-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=('https://github.com/guyfedwards/nom/releases/download/v2.5.0/nom_2.5.0_linux_amd64.tar.gz')
sha256sums=('3b1fb8f348dc8102b2bdc5e0c5151f3305a7724778d8e765ed5638d0a534a5aa')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
