# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=tibble
_cranver=1.2
pkgname=r-cran-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="Flexibly Reshape Data: A Reboot of the Reshape Package"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r' 'r-cran-assertthat' 'r-cran-lazyeval>=0.1.10' 'r-cran-rcpp')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('bdbc3d67aa16860741add6d6ec20ea13')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
