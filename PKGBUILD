#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=fermat
pkgver=6.38
pkgrel=1
pkgdesc='A computer algebra system for polynomial and matrix computation'
url='http://home.bway.net/lewis/home.html'
license=('GPL')
arch=('x86_64')
depends=('glibc')

source=("http://home.bway.net/lewis/fermat64/ferl6.tar.gz")
sha256sums=('1716ff6ca97c078191d8d1b48ba08f4e4963cafb9b1b08e636e83d78c1acbc8f')

package() {
	  install -dm755 "${pkgdir}"/usr/bin
	  cp -r "${srcdir}/ferl6/fer64" "${pkgdir}"/usr/bin/
	  cp -r "${srcdir}/ferl6/BACKWARD/" "${pkgdir}"/usr/bin/BACKWARD/
}