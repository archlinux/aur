#Maintainer: Dylan Delgado <dylan1496@live.com>

pkgname=fermat
pkgver=7.8
pkgrel=1
pkgdesc='A computer algebra system for polynomial and matrix computation'
url='http://home.bway.net/lewis/home.html'
license=('GPL')
arch=('x86_64')
depends=('glibc')

source=("http://home.bway.net/lewis/fermat64/Ferl7.tar.gz")
sha256sums=('b140129f68db94624b67cb5267f9337c840e7721cbc1c97d983062c641c47c49')

package() {
	  install -dm755 "${pkgdir}"/usr/bin
	  cp -r "${srcdir}/Ferl7/fer64" "${pkgdir}"/usr/bin/
	  cp -r "${srcdir}/Ferl7/BACKWARD/" "${pkgdir}"/usr/bin/BACKWARD/
}
