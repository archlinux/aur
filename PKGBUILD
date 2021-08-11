#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=fermat
pkgver=6.5
pkgrel=1
pkgdesc='A computer algebra system for polynomial and matrix computation'
url='http://home.bway.net/lewis/home.html'
license=('GPL')
arch=('x86_64')
depends=('glibc')

source=("http://home.bway.net/lewis/fermat64/ferl6.tar.gz")
sha256sums=('aa552eb463424e025b5d9ac9f318ff2e5b04d0656dfc4780fd3f95635517f1a1')

package() {
	  install -dm755 "${pkgdir}"/usr/bin
	  cp -r "${srcdir}/ferl6/fer64" "${pkgdir}"/usr/bin/
	  cp -r "${srcdir}/ferl6/BACKWARD/" "${pkgdir}"/usr/bin/BACKWARD/
}
