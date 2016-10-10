# Maintainer: renek <aur@spaceshore.net>
_cranname=extrafont
pkgname=r-cran-$_cranname
pkgver=0.17
pkgrel=1
pkgdesc="R package with tools for using fonts other than the standard PostScript fonts"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('any')
license=('GPL2')
depends=('r' 'r-cran-rttf2pt1' 'r-cran-extrafontdb')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${pkgver}.tar.gz")
sha512sums=('4db91d2820449f7328aefddc6bf3a8e4a401277f881f0ceb35c596b91bd34560f068a776324e5b932a379d63a07675bc73f69002c5368a9900f028f5fb7ad441')
 
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
