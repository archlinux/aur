# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=upplay
pkgver=1.2.6
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
depends=('libupnpp>=0.15.0' 'qtwebkit')
makedepends=('qtchooser')
source=("http://www.lesbonscomptes.com/upplay/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('aca936d7ac8a49fbda09b707c3e58b8b')
         

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake-qt4 PREFIX="/usr"
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install INSTALL_ROOT="${pkgdir}"
}
