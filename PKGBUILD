# Maintainer: Marc Cousin <cousinmarc@gmail.com>
pkgname=algobox
pkgver=1.1.1
pkgrel=1
epoch=2
pkgdesc="Algorithmic learning for high school students"
url="http://www.xm1math.net/algobox/index.html"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('qt6-base')
optdepends=()
makedepends=()
source=("http://www.xm1math.net/algobox/${pkgname}-${pkgver}.tar.bz2"
       )
sha256sums=('b5db2479360d5efa00c1856466e98481571d22064ed63272706ff0d5098f0e5e')


build() {
	  cd "${srcdir}/${pkgname}-${pkgver}"
    qmake6
	  make
}

package() {
	  cd "${srcdir}/${pkgname}-${pkgver}"
	    make INSTALL_ROOT="${pkgdir}" install
#	      install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
