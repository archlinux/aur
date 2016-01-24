#Maintained by: fordprefect <fordprefect@dukun.de>
_cranname=curl
_cranver=0.9.5
pkgname=r-cran-$_cranname
pkgver=$_cranver
pkgrel=1
pkgdesc="enhanced download abilities for R"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
license=('MIT')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('b0304ad26375c5fd71b557e6411091cd')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
