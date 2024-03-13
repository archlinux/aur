# Maintainer: Marco Pompili <aur@mg.odd.red>

pkgname=stlsoft
pkgver=1.10.11
pkgrel=1
pkgdesc="C++ header-only library providing operating system facades and STL extensions."
arch=('any')
url="http://www.stlsoft.org/"
license=('BSD')
source=("https://github.com/synesissoftware/STLSoft-1.10/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('db5bb17ce4e2ee5902614a1215c8b41dfe96672633278a6f1772cc003e5eefb3')

package() {
  mkdir -p ${pkgdir}/usr/

  cp -R ${srcdir}/STLSoft-1.10-${pkgver}/include ${pkgdir}/usr/
}
