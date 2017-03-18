# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python-msrest
pkgver=0.4.6
pkgrel=2
pkgdesc='The runtime library for AutoRest generated Python clients.'
arch=('any')
url="https://github.com/Azure/msrest-for-python"
license=('MIT')
depends=('python-isodate' 'python-requests-oauthlib')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrest-for-python/archive/v0.4.6.tar.gz")
md5sums=('5b8872e572a81bac7bb78aecd6b96297')

build() {
  cd "msrest-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "msrest-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}