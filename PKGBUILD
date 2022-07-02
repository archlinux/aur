# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pandas-stubs
_pkgname=${pkgname:7}
pkgver=1.4.2.220626
pkgrel=1
pkgdesc="Type annotations for Pandas"
arch=('any')
url="https://github.com/pandas-dev/pandas-stubs"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/pandas_stubs-$pkgver-py3-none-any.whl)
sha256sums=('c0037457dfaff8434cac0fb63fd261fac296abf003c931a8546d2c0c8369eac2')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
