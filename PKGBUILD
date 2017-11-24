# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python2-msrestazure
pkgver=0.4.16
pkgrel=1
pkgdesc="The runtime library \"msrestazure\" for AutoRest generated Python clients."
arch=('any')
url="https://github.com/Azure/msrestazure-for-python"
license=('MIT')
depends=('python2-adal' 'python2-keyring' 'python2-msrest')
makedepends=('python2-setuptools')
source=("https://github.com/Azure/msrestazure-for-python/archive/v${pkgver}.tar.gz")
md5sums=('9f63e8cb7afa976e99b9e0ac3bca65b6')

build() {
  cd "msrestazure-for-python-$pkgver"
  python2 setup.py build
}

package() {
  cd "msrestazure-for-python-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
