# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-pandas-stubs
_pkgname=${pkgname:7}
pkgver=1.4.3.220704
pkgrel=1
pkgdesc="Type annotations for Pandas"
arch=('any')
url="https://github.com/pandas-dev/pandas-stubs"
license=('MIT')
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/pandas_stubs-$pkgver-py3-none-any.whl)
sha256sums=('bf6e48e6219627d93136b126b480fb2ae344808846c352f7f501447e44c7d674')

package() {
    python -m installer --destdir="$pkgdir" *.whl
}
