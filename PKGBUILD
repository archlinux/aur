# Maintainer: Matt Frichtl <frichtlm@gmail.com>
# Contributer: wagnerflo <florian@wagner-flo.net>
_cranname=lazyeval
_cranver=0.2.1
pkgname=r-$_cranname
pkgver=${_cranver}
pkgrel=1
pkgdesc="An alternative approach to non-standard evaluation using formulas. Provides a full implementation of LISP style 'quasiquotation', making it easier to generate code with other code."
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('GPL-3')
depends=('r>=3.1.0')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('e7f4dcf399829e6cf1e49371cc773085')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
