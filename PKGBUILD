# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-msrestazure
pkgver=0.4.7
pkgrel=1
pkgdesc="The runtime library for AutoRest generated Python clients."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python-adal' 'python-keyring' 'python-msrest')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v0.4.7.tar.gz")
md5sums=('4c1f622e49b6d99c3c65b17e8d19b06c')

build() {
  cd "msrestazure-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "msrestazure-for-python-$pkgver"
  python setup.py install --root="$pkgdir"
}
