# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=upplay
pkgver=0.10.0
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
depends=('libupnpp' 'qtwebkit')
makedepends=('qtchooser')
source=("http://www.lesbonscomptes.com/upplay/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('ddaf5bba24371b063b21a268fc8a8a93')
         

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
#	patch -p1 -i ${srcdir}/upplay.patch
	qmake-qt4 PREFIX="${pkgdir}/usr"
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install
}
