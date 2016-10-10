# Maintainer: renek <aur@spaceshore.net>
_cranname=extrafontdb
pkgname=r-cran-$_cranname
pkgver=1.0
pkgrel=1
pkgdesc="R package for holding the database for the extrafont package"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
license=('GPL2')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
sha512sums=('a60a9d266459f5c5a2f62e25affaf9dc7205b91b29e94e58f579dd3148ee67f63695c58272d82d30d21788d3321be69227286ddaa9941aeaa5a3158a364266cd')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
