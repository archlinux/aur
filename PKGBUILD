# Maintainer: Mahid Sheikh <mahid@standingpad.org>
#
# shellcheck disable=all
pkgname=nom-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=('https://github.com/guyfedwards/nom/releases/download/v2.5.1/nom_2.5.1_linux_amd64.tar.gz')
sha256sums=('4d71fcd5d29cd59f1c6820b0399f3225bfe827e94b0269315152d08bf664d88d')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
