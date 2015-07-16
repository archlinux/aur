# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: ArchAssault <team at archassault dot org>
# Contributor: Jeremy Lynch <jl at archassault dot org>

pkgname=python2-enum
pkgver=0.4.4
pkgrel=2
pkgdesc="Robust enumerated type support in Python."
arch=('any')
url="http://pypi.python.org/pypi/enum/"
license=('GPL2')
depends=('python2')
makedepends=('python2-distribute')
provides=('python2-enum')
conflicts=('python2-enum')
source=("https://pypi.python.org/packages/source/e/enum/enum-${pkgver}.tar.gz")
sha512sums=('67819dc2412f833b4d27171dd71d12a7b67a35c1e8401d03938621273b1c13b6ec6d561b2cddaaf2080d92abfed5ccaa460996a3e7f7058e0f90ae3a0dd0f552')

build() {
  cd "${srcdir}/enum-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/enum-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 
}
