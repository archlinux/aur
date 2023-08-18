#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=fermat
pkgver=7.0
pkgrel=1
pkgdesc='A computer algebra system for polynomial and matrix computation'
url='http://home.bway.net/lewis/home.html'
license=('GPL')
arch=('x86_64')
depends=('glibc')

source=("http://home.bway.net/lewis/fermat64/Ferl7.tar.gz")
sha256sums=('6099a3e9b0fc9006253db079cb0dd9e60191324e19233d0839293cdc086a2355')

package() {
	  install -dm755 "${pkgdir}"/usr/bin
	  cp -r "${srcdir}/Ferl7/fer64" "${pkgdir}"/usr/bin/
	  cp -r "${srcdir}/Ferl7/BACKWARD/" "${pkgdir}"/usr/bin/BACKWARD/
}
