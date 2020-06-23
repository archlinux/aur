# Maintainer: Christopher Michael Mescher $(echo \<pascha-mescher+faith\>|sed s/\+/./g\;s/\-/@/)

pkgname=pascha-git
pkgver=1.3
pkgrel=1

pkgdesc="A simple shell script to calculate and display the date of Pascha (Easter)"
arch=('any')
url="https://gitlab.com/cmmescher/pascha.git"
license=('GPL3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
