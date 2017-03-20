# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python2-msrestazure
pkgver=0.4.7
pkgrel=1
pkgdesc="AutoRest swagger generator Python client runtime. Azure-specific module."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python2-adal' 'python2-keyring' 'python2-msrest')
makedepends=('python2-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v0.4.7.tar.gz")
md5sums=('4c1f622e49b6d99c3c65b17e8d19b06c')

build() {
  cd "msrestazure-for-python-$pkgver"
  python2 setup.py build
}

package() {
  cd "msrestazure-for-python-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
