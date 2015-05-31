# Maintainer: fordprefect <fordprefect@dukun.de>
_cranname=wikibooks
pkgname=r-cran-$_cranname
pkgver=0.2
pkgrel=1
pkgdesc="collection of functions and datas used in the german WikiBook 'GNU R'"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
md5sums=('e7e28894723f66fd83bdc551bc431390')
 
build() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
