# Maintainer: Marc Cousin <cousinmarc@gmail.com>
pkgname=algobox
pkgver=1.1.0
pkgrel=1
pkgdesc="Algorithmic learning for high school students"
url="http://www.xm1math.net/algobox/index.html"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('qt5-base' 'qt5-webkit' 'qt5-webengine')
optdepends=()
makedepends=()
source=("http://www.xm1math.net/algobox/${pkgname}-${pkgver}.tar.bz2"
       )
md5sums=('a3abf874761e6369e312f07f7c81cf8a')

build() {
	  cd "${srcdir}/${pkgname}-${pkgver}"
    qmake
	  make
}

package() {
	  cd "${srcdir}/${pkgname}-${pkgver}"
	    make INSTALL_ROOT="${pkgdir}" install
#	      install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
