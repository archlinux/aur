# Maintainer: Mahid Sheikh <mahid@standingpad.org>
#
# shellcheck disable=all
pkgname=nom-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=('https://github.com/guyfedwards/nom/releases/download/v2.4.0/nom_2.4.0_linux_amd64.tar.gz')
sha256sums=('05f040a2a021a6038751c1075fed375c04c3d6587167ca5b20652fe69c9d9a90')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
