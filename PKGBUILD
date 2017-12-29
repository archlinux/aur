# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_cranname=corpus
_cranver=0.10.0
pkgname="r-cran-${_cranname}"
pkgver="${_cranver}"
pkgrel=1
pkgdesc="Corpus data analysis R tools with unicode support"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('r>=3.0.1' 'r-knitr' 'r-testthat')
conflicts=('r-corpus')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('e04afcf4e56ed90fdde829399913e1c5')

package() {
    mkdir -p "${pkgdir}/usr/lib/R/library"
    cd "${srcdir}"
    R CMD INSTALL "${_cranname}" -l "${pkgdir}/usr/lib/R/library"
}
