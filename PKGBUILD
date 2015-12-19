# Maintainer: Tristelune  <tristelune at archlinux dot info>
pkgname=upplay
pkgver=1.2.1
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="http://www.lesbonscomptes.com/upplay/"
arch=('x86_64')
license=('GPL2')
depends=('libupnpp>=0.12.1' 'qtwebkit')
makedepends=('qtchooser')
source=("http://www.lesbonscomptes.com/upplay/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('218fec8ebecc119a1a4c8c8d84dc5a06')
         

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	qmake-qt4 PREFIX="${pkgdir}/usr"
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install
}
