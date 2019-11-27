# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=r-rhtslib
_bc_name=Rhtslib
pkgver=1.18.0
pkgrel=1
pkgdesc="high-throughput sequencing library"
url="https://bioconductor.org/packages/release/bioc/html/${_bc_name}.html"
arch=("x86_64")
options=('staticlibs')
license=('LGPL (>= 2)')
depends=('r' 'r-zlibbioc')
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bc_name}_${pkgver}.tar.gz")
sha1sums=('cc264f13d48810127cc86dd798d1da540d02ffed')

package() {
 mkdir -p $pkgdir/usr/lib/R/library
 cd $srcdir

 R CMD INSTALL -l $pkgdir/usr/lib/R/library ./${_bc_name}
}
