# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
pkgname=dumpet
pkgver=2.1
pkgrel=5
pkgdesc="A tool for debugging El Torito boot images."
arch=('i686' 'x86_64')
url="https://fedorahosted.org/dumpet/"
license=('GPL2')
install=
changelog=
source=("https://fedorahosted.org/releases/d/u/dumpet/${pkgname}-${pkgver}.tar.bz2")
noextract=()
sha512sums=('ca12d0852594acabda6a97b91e072872a6d83cd29b9c549a2f03120a8e92b19d1254ac229e27b562c5b0439b92daeec54e95df0282af4cd346e66b876d4a33b3')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
