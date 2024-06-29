#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=fermat
pkgver=7.6
pkgrel=1
pkgdesc='A computer algebra system for polynomial and matrix computation'
url='http://home.bway.net/lewis/home.html'
license=('GPL')
arch=('x86_64')
depends=('glibc')

source=("http://home.bway.net/lewis/fermat64/Ferl7.tar.gz")
sha256sums=('7a6dac0d8ca7ac800b1da94ce54aa68ef5f871ff2dcd1673a37ee1e1a80ab4b5')

package() {
	  install -dm755 "${pkgdir}"/usr/bin
	  cp -r "${srcdir}/Ferl7/fer64" "${pkgdir}"/usr/bin/
	  cp -r "${srcdir}/Ferl7/BACKWARD/" "${pkgdir}"/usr/bin/BACKWARD/
}
