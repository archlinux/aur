# Maintainer: Marco Pompili <aur@mg.odd.red>

pkgname=stlsoft
pkgver=1.9.134
pkgrel=1
pkgdesc="C++ header-only library providing operating system facades and STL extensions."
arch=('any')
url="http://www.stlsoft.org/"
license=('BSD')
source=("https://github.com/synesissoftware/STLSoft-1.9/archive/${pkgver}.tar.gz")
sha256sums=('70885609d20ebf3f333169117e765d1813415f9548d3c436b13fd4b232139714')

package() {
  mkdir -p ${pkgdir}/usr/

  cp -R ${srcdir}/STLSoft-1.9-${pkgver}/include ${pkgdir}/usr/
}
