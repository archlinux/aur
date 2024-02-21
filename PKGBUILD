# Maintainer: Mahid Sheikh <mahid@standingpad.org>
#
# shellcheck disable=all
pkgname=nom-bin
pkgver=2.1.3
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=('https://github.com/guyfedwards/nom/releases/download/v2.1.3/nom_2.1.3_linux_amd64.tar.gz')
sha256sums=('f1ad02cb5f5c160ae66e9ac3914f37f0ca03eeb8b61a06973188bd07693cc56c')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
