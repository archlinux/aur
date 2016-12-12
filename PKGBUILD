# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=stringi
_cranver=1.1.2
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=2
pkgdesc="fast, correct, consistent, portable, convenient character string processing"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r' 'icu>=50')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('0ec2faa62643e1900734c0eaf5096648')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
