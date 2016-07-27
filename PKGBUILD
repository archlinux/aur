#Maintained by: fordprefect <fordprefect@dukun.de>
_cranname=curl
_cranver=1.1
pkgname=r-cran-$_cranname
pkgver=$_cranver
pkgrel=1
pkgdesc="enhanced download abilities for R"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('35e362fd6505e0e42ff54e340ecffe2d')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
