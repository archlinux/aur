# Maintainer: fordprefect <fordprefect@dukun.de>
_cranname=tnet
pkgname=r-cran-$_cranname
pkgver=3.0.14
pkgrel=1
pkgdesc="R package for analyzing weighted, two-mode, and longitudinal networks"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
license=('CCPL:by-nc')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('129a06065f7a0252f2fac3e5e6211f6e')
 
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
