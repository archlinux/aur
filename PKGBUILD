#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=fermat
pkgver=7.4
pkgrel=1
pkgdesc='A computer algebra system for polynomial and matrix computation'
url='http://home.bway.net/lewis/home.html'
license=('GPL')
arch=('x86_64')
depends=('glibc')

source=("http://home.bway.net/lewis/fermat64/Ferl7.tar.gz")
sha256sums=('3613e35c03e53666f7535b12e9d469f80e4d40c6bde7b437511bb63f177d09ea')

package() {
	  install -dm755 "${pkgdir}"/usr/bin
	  cp -r "${srcdir}/Ferl7/fer64" "${pkgdir}"/usr/bin/
	  cp -r "${srcdir}/Ferl7/BACKWARD/" "${pkgdir}"/usr/bin/BACKWARD/
}
