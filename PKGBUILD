# Maintainer: wagnerflo <florian@wagner-flo.net>
_cranname=RColorBrewer
_cranver=1.1-2
pkgname=r-cran-rcolorbrewer
pkgver=1.1.2
pkgrel=1
pkgdesc="ColorBrewer Palettes"
url="http://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('i686' 'x86_64')
license=('APACHE')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('66054d83eade4dff8a43ad4732691182')

package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd ${srcdir}
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
