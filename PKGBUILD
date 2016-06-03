# Contributer: Donald Carr <sirspudd@gmail.com>

pkgname=ellcc
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}")
url="http://ellcc.org/"
pkgver=0.1.31
pkgrel=1
pkgdesc="The ELLCC Embedded Compiler Collection"
arch=("x86_64")
license=("BSD" "MIT" "UIUC")
#depends=()
#makedepends=()
_filename="ellcc-x86_64-linux-${pkgver}.tgz"
source=("http://ellcc.org/releases/${_filename}")
sha256sums=("48da7af8189d04961fcd0c53acaa47e89314bbf03910a605818a9dd504be1e5d")
options=('!strip')

package() {
  local resting_place="${pkgdir}/opt"
  mkdir -p ${resting_place}
  cp -r ${srcdir}/${pkgname} ${resting_place}
} 
