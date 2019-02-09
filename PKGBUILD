# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-rcolorbrewer
_cran_name=RColorBrewer
_pkgver=1.1-2
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ColorBrewer Palettes"
arch=('x86_64')
url="http://cran.r-project.org/web/packages/${_cran_name}/index.html"
license=('GPL3')
depends=('r')
source=("http://cran.r-project.org/src/contrib/${_cran_name}_${_pkgver}.tar.gz")
md5sums=('66054d83eade4dff8a43ad4732691182')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_cran_name}
}
