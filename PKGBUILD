# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=upplay
pkgver=1.2.2
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
depends=('libupnpp>=0.12.1' 'qtwebkit')
makedepends=('qtchooser')
source=("http://www.lesbonscomptes.com/upplay/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('fad12020360dbaa9e4d94c7ad7f95a75')
         

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake-qt4 PREFIX="/usr"
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install INSTALL_ROOT="${pkgdir}"
}
