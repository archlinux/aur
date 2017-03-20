# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python2-azure-git
pkgver=latest
pkgrel=1
pkgdesc="Microsoft Azure SDK for Python"
arch=('any')
url="https://github.com/Azure/azure-sdk-for-python"
license=('MIT')
depends=('python2-azure-storage' 'python2-msrestazure')
makedepends=('python2-setuptools')
provides=('python2-azure')
conflicts=('python2-azure')
source=("git+https://github.com/Azure/azure-sdk-for-python.git")
md5sums=('SKIP')

build() {
  cd azure-sdk-for-python
  python2 setup.py build
}

package() {
  cd azure-sdk-for-python
  python2 setup.py install --root="$pkgdir" --optimize=1
}
