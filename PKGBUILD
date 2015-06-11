# Contributor: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=netfleet
pkgver=0.2.1
pkgrel=3
pkgdesc="Qt4 Multi-threaded download utility"
arch=('i686' 'x86_64')
url="http://code.google.com/p/netfleet/"
license=('GPL')
depends=('qt4')
optdepends=()
provides=('netfleet')
install=$pkgname.install
source=("http://netfleet.googlecode.com/files/${pkgname}_${pkgver}.tar.bz2")
sha256sums=('05ec6e3a47e59a89c740272f2f21d60ad019df8dd3dda03daa05f3e536ecf8e2')

build() {

	cd ${srcdir}/${pkgname}
	qmake-qt4

}

package() {
	cd ${srcdir}/${pkgname}
	make INSTALL_ROOT="${pkgdir}" install
}