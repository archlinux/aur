# Contributer: Donald Carr <sirspudd@gmail.com>

pkgname=ellcc
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=("${pkgname}")
url="http://ellcc.org/"
pkgver=0.1.28
pkgrel=1
pkgdesc="The ELLCC Embedded Compiler Collection"
arch=("x86_64")
license=("BSD" "MIT" "UIUC")
#depends=()
#makedepends=()
_filename="ellcc-x86_64-linux-eng-${pkgver}.tgz"
source=("http://ellcc.org/releases/${_filename}")
sha256sums=("fbe5f01ada5c52406d1875704031c3503518acec1b215a5cd46ba36ee2125a5e")
options=('!strip')

package() {
  local resting_place="${pkgdir}/opt"
  mkdir -p ${resting_place}
  cp -r ${srcdir}/${pkgname} ${resting_place}
} 
