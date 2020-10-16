#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=fermat
pkgver=6.37
pkgrel=1
pkgdesc='A computer algebra system for polynomial and matrix computation'
url='http://home.bway.net/lewis/home.html'
license=('GPL')
arch=('x86_64')
depends=('glibc')

source=("http://home.bway.net/lewis/fermat64/ferl6.tar.gz")
sha256sums=('c051ec9c4e1d025a45826f9ea8faab233f806618e60be2f40e2c5ceeee71612a')

package() {
	  install -dm755 "${pkgdir}"/usr/bin
	  cp -r "${srcdir}/ferl6/fer64" "${pkgdir}"/usr/bin/
	  cp -r "${srcdir}/ferl6/BACKWARD/" "${pkgdir}"/usr/bin/BACKWARD/
}