# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pandas-stubs
_pkgname=${pkgname:7}
pkgver=1.4.2.220622
pkgrel=1
pkgdesc="Type annotations for Pandas"
arch=('any')
url="https://github.com/pandas-dev/pandas-stubs"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/pandas_stubs-$pkgver-py3-none-any.whl)
sha256sums=('ceebb0b3d56523e8397d74fe6b538918377ff34b184c44f74aaca8f250c5b4ba')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
