# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-common
pkgname=python-$_name
pkgver=1.1.4
pkgrel=1
pkgdesc="Microsoft Azure Client Library for Python (Common)"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('Apache')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
md5sums=('290a03b3a74417ad2f8c58c2e20ae233')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
