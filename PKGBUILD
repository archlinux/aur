# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=upplay
pkgver=1.2.8
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
depends=('libupnpp>=0.15.0' 'qtwebkit')
#makedepends=('qtchooser')
makedepends=( )
source=("http://www.lesbonscomptes.com/upplay/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('dc6150d9e17178d10a33d01761d432b9')
         

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake-qt4 PREFIX="/usr"
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install INSTALL_ROOT="${pkgdir}"
}
