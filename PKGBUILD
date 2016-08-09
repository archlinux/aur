# Contributer: Donald Carr <sirspudd@gmail.com>

pkgname=ellcc
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}")
url="http://ellcc.org/"
pkgver=0.1.32
pkgrel=1
pkgdesc="The ELLCC Embedded Compiler Collection"
arch=("x86_64")
license=("BSD" "MIT" "UIUC")
#depends=()
#makedepends=()
_filename="ellcc-x86_64-linux-${pkgver}.tgz"
source=("http://ellcc.org/releases/${_filename}")
sha256sums=("910993004f8e332a017df930942a053611ccce2914453d15df0c7239e3d05d4b")
options=('!strip')

package() {
  local resting_place="${pkgdir}/opt"
  mkdir -p ${resting_place}
  cp -r ${srcdir}/${pkgname} ${resting_place}
} 
