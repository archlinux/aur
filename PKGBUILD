# Maintainer: Marco Pompili <marcs.pompili@gmail.com>
# Contributor: Marco Pompili <marcs.pompili@gmail.com>

pkgname=stlsoft
pkgver=1.9.124
pkgrel=1
pkgdesc="C++ library providing operating system facades and STL extensions."
arch=('any')
url="http://www.stlsoft.org/"
license=('BSD')
source=("https://github.com/synesissoftware/STLSoft-1.9/archive/STLSoft-${pkgver}.tar.gz")
md5sums=('7e64507190925a348ac2eae8d0fe274a')

package() {
  mkdir -p ${pkgdir}/usr/

  cp -R ${srcdir}/STLSoft-1.9-STLSoft-${pkgver}/include ${pkgdir}/usr/
}
