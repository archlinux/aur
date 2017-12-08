# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python-msrest
pkgver=0.4.19
pkgrel=1
pkgdesc='The runtime library for AutoRest generated Python clients.'
arch=('any')
url="https://github.com/Azure/msrest-for-python"
license=('MIT')
depends=('python-isodate' 'python-requests-oauthlib')
makedepends=('python-setuptools')
source=("https://github.com/Azure/msrest-for-python/archive/v${pkgver}.tar.gz")
md5sums=('3619bd113d2867737b05fe8de8acd6a5')

build() {
  cd "msrest-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "msrest-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
