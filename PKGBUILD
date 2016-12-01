# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=gsubfn
_cranver=0.6-6
pkgname=r-cran-$_cranname
pkgver=0.6.6
pkgrel=1
pkgdesc="gsub with a replacement function"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('r' 'r-cran-proto')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('94195ff3502706c736d9c593c07252bc')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
