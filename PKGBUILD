# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=upplay
pkgver=1.2.7
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
depends=('libupnpp>=0.15.0' 'qtwebkit')
#makedepends=('qtchooser')
makedepends=( )
source=("http://www.lesbonscomptes.com/upplay/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('ada6d02bcb776c1fe572f91af38525c7')
         

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake-qt4 PREFIX="/usr"
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install INSTALL_ROOT="${pkgdir}"
}
