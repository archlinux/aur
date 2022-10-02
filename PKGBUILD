# Maintainer: Pranav K Anupam <pranavanupam@yahoo.com>
# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-matrix
_cran_name=Matrix
_pkgver=1.5-1
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Sparse and Dense Matrix Classes and Methods"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r>=3.5.0' 'r-lattice')
optdepends=('r-expm' 'r-mass')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
sha1sums=('01e5b8156bb677d7c2a50c040c57984e3f5af6c0')

build(){
    cd "${srcdir}"
    R CMD INSTALL ${_pkgtar} -l ${srcdir}
}
package() {
    cd "${scrdir}"
    install -dm0755 "$pkgdir/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}

