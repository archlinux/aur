# Maintainer:
# Contributor:

_pkgname=pydocstyle
pkgname=python-pydocstyle
pkgver=1.1.1
pkgrel=1
pkgdesc="Python docstring style checker."
url='https://github.com/PyCQA/pydocstyle'
license=('MIT')
arch=('any')
makedepends=('python2-setuptools')
source=(https://github.com/PyCQA/"$_pkgname"/archive/"$pkgver".zip)
md5sums=('89f601e5b32f1fe7ebacd46ea25186b9')

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

