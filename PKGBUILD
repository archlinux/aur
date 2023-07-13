# Maintainer: Mahid Sheikh <mahidsheikh@proton.me>
#
# shellcheck disable=all
pkgname=nom-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="RSS reader for the terminal"
arch=(x86_64)
url="https://github.com/guyfedwards/nom"
license=('GPL')
source=('https://github.com/guyfedwards/nom/releases/download/v1.2.1/nom_1.2.1_Linux_x86_64.tar.gz')
sha256sums=('b016077e7e2ed9f30417d30b050cf0010e1900e7cd174b5aec567dc7ed20df05')

package() {
	cd "$srcdir/"
	install -Dm0755 -t "$pkgdir/usr/local/bin" "nom"
}
