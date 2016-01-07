# Maintainer: Paulo Castro <p.oliveira.castro@gmail.com>
pkgname=xppaut
pkgver=8.0
pkgrel=1
pkgdesc="Graphical tool for solving many kinds of equations"
arch=('i686' 'x86_64')
url="http://www.math.pitt.edu/~bard/xpp/xpp.html"
license=('GPL')
depends=('libx11')
source=("http://www.math.pitt.edu/~bard/bardware/binary/latest/${pkgname}${pkgver}.tgz")
md5sums=('1ee38419eae1f55e711bcb768cefdd6e')
build() {
	cd "${srcdir}"
	make
}

package() {
	cd "${srcdir}"
	make DESTDIR="$pkgdir/" BINDIR="/usr/bin" MANDIR="/usr/share/man/man1" install
}
