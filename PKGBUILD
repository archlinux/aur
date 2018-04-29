# Maintainer: Donald Carr <sirspudd@gmail.com>

pkgname=ellcc
url="http://ellcc.org/"
pkgver=2017.08.23
pkgrel=1
pkgdesc="The ELLCC Embedded Compiler Collection"
arch=("x86_64")
license=("BSD" "MIT" "UIUC")
_filename="ellcc-${CARCH}-linux-$(echo ${pkgver} | tr '.' '-').bz2"
source=("http://ellcc.org/releases/latest/${_filename}")
sha256sums=("1fba934e295762e1b986f04a0726e37221deb48e9a418efca33262800895cf98")
options=('!strip')

package() {
  local resting_place="${pkgdir}/opt"
  mkdir -p ${resting_place}
  cp -r ${srcdir}/${pkgname} ${resting_place}
  chmod o+rx -R ${resting_place}/${pkgname}
} 
