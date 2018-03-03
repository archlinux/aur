# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python2-msrest
pkgver=0.4.26
pkgrel=1
pkgdesc='The runtime library for AutoRest generated Python clients.'
arch=('any')
url="https://github.com/Azure/msrest-for-python"
license=('MIT')
depends=('python2-isodate' 'python2-requests-oauthlib')
makedepends=('python2-setuptools')
source=("https://github.com/Azure/msrest-for-python/archive/v${pkgver}.tar.gz")
md5sums=('327b780c79e4404c70fd8d3a771a0e42')

build() {
  cd "msrest-for-python-$pkgver"
  python2 setup.py build
}

package() {
  cd "msrest-for-python-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
