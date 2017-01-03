# Maintainer: Donald Carr <sirspudd@gmail.com>

pkgname=ellcc
url="http://ellcc.org/"
pkgver=0.1.33
pkgrel=1
pkgdesc="The ELLCC Embedded Compiler Collection"
arch=("x86_64")
license=("BSD" "MIT" "UIUC")
_filename="ellcc-x86_64-linux-${pkgver}.tgz"
source=("http://ellcc.org/releases/${_filename}")
sha256sums=("b5f2349a7c85d04f9481bdb1ff5509cefc179efe12b2e35cf8fa4c4a6ca2b3dc")
options=('!strip')

package() {
  local resting_place="${pkgdir}/opt"
  mkdir -p ${resting_place}
  cp -r ${srcdir}/${pkgname} ${resting_place}
  chmod o+rx -R ${resting_place}/${pkgname}
} 
