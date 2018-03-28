#Maintained by: fordprefect <fordprefect@dukun.de>
_cranname=curl
_cranver=3.2
pkgname=r-cran-$_cranname
pkgver=$_cranver
pkgrel=1
pkgdesc="enhanced download abilities for R"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('c2d9d8634409a92c3092b79a54d53a10')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
